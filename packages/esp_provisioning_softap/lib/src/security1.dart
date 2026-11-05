import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:cryptography/cryptography.dart';
import 'cryptor.dart';
import 'proto/dart/sec1.pb.dart';
import 'proto/dart/session.pb.dart';
import 'security.dart';
import 'package:logger/logger.dart';

class Security1 implements Security {
  final String pop;
  final bool verbose;
  SecurityState sessionState;
  late SimpleKeyPairData clientKey;
  late List<int> clientPubKey;
  late SimplePublicKey devicePublicKey;
  late Uint8List deviceRandom;
  Cryptor crypt = Cryptor();
  var logger = Logger();
  final algorithm = X25519();

  Security1(
      {required this.pop,
      this.sessionState = SecurityState.REQUEST1,
      this.verbose = false});

  @override
  Future<Uint8List> encrypt(Uint8List data) async {
    logger.i('raw data before encryption: ${data.toString()}');
    return crypt.crypt(data);
  }

  @override
  Future<Uint8List> decrypt(Uint8List data) async {
    logger.i('Decrypt');
    return encrypt(data);
  }

  Future<void> _generateKey() async {
    // creates client key with X25519 algo
    clientKey = await (await algorithm.newKeyPair()).extract();
  }

  Uint8List _xor(Uint8List a, Uint8List b) {
    // XOR two inputs of type `bytes`
    Uint8List ret = Uint8List(max(a.length, b.length));
    for (var i = 0; i < max(a.length, b.length); i++) {
      // Convert the characters to corresponding 8-bit ASCII codes
      // then XOR them and store in bytearray
      final _a = i < a.length ? a[i] : 0;
      final _b = i < b.length ? b[i] : 0;
      ret[i] = (_a ^ _b);
    }
    return ret;
  }

  @override
  Future<SessionData?> securitySession(SessionData? responseData) async {
    if (sessionState == SecurityState.REQUEST1) {
      sessionState = SecurityState.RESPONSE1_REQUEST2;
      return await setup0Request();
    }
    if (sessionState == SecurityState.RESPONSE1_REQUEST2) {
      sessionState = SecurityState.RESPONSE2;
      if (responseData == null) {
        throw Exception('Response Data is null, when needed: if-Statement SecurityState.RESPONSE1_REQUEST2');
      }
      await setup0Response(responseData);
      return await setup1Request(responseData);
    }
    if (sessionState == SecurityState.RESPONSE2) {
      sessionState = SecurityState.FINISH;
      if (responseData == null) {
        throw Exception('Response Data is null, when needed: if-Statement SecurityState.RESPONSE2');
      }
      await setup1Response(responseData);
      return null;
    }
    throw Exception('Unexpected state');
  }

  Future<SessionData> setup0Request() async {
    var setupRequest = SessionData();

    setupRequest.secVer = SecSchemeVersion.SecScheme1;
    await _generateKey();
    SessionCmd0 sc0 = SessionCmd0();
    await clientKey.extractPublicKey().then((publicKey) {
      sc0.clientPubkey = publicKey.bytes;
      clientPubKey = publicKey.bytes;
    });

    Sec1Payload sec1 = Sec1Payload();
    sec1.sc0 = sc0;
    setupRequest.sec1 = sec1;
    logger.i("setup0Request: clientPubkey = ${clientPubKey.toString()}");
    return setupRequest;
  }

  Future<SessionData?> setup0Response(SessionData responseData) async {
    SessionData setupResp = responseData;
    if (setupResp.secVer != SecSchemeVersion.SecScheme1) {
      throw Exception('Invalid sec scheme');
    }
    devicePublicKey = SimplePublicKey(setupResp.sec1.sr0.devicePubkey,
        type: KeyPairType.x25519);
    deviceRandom = Uint8List.fromList(setupResp.sec1.sr0.deviceRandom);

    logger.i('setup0Response:Device public key ${devicePublicKey.toString()}');
    logger.i('setup0Response:Device random ${deviceRandom.toString()}');

    final sharedKey = await algorithm.sharedSecretKey(
        keyPair: clientKey, remotePublicKey: devicePublicKey);

    await sharedKey.extractBytes().then((sharedSecret) async {
      Uint8List sharedKeyBytes;
      logger.i(
          'setup0Response: Shared key calculated: ${sharedSecret.toString()}');
        var sink = Sha256().newHashSink();
        sink.add(utf8.encode(pop));
        sink.close();
        final hash = await sink.hash();
        sharedKeyBytes = _xor(
            Uint8List.fromList(sharedSecret), Uint8List.fromList(hash.bytes));
        logger.i(
            'setup0Response: pop: $pop, hash: ${hash.bytes.toString()} sharedK: ${sharedKeyBytes.toString()}');

      await crypt.init(sharedKeyBytes, deviceRandom);
      logger.i(
          'setup0Response: cipherSecretKey: ${sharedKeyBytes.toString()} cipherNonce: ${deviceRandom.toString()}');
      return setupResp;
    });
    return null;
  }

  Future<SessionData> setup1Request(SessionData responseData) async {
    logger.i('setup1Request ${devicePublicKey.toString()}');
    var clientVerify = await encrypt(Uint8List.fromList(devicePublicKey.bytes));

    logger.i('client verify ${clientVerify.toString()}');
    var setupRequest = SessionData();
    setupRequest.secVer = SecSchemeVersion.SecScheme1;
    Sec1Payload sec1 = Sec1Payload();
    sec1.msg = Sec1MsgType.Session_Command1;
    SessionCmd1 sc1 = SessionCmd1();
    sc1.clientVerifyData = clientVerify;
    sec1.sc1 = sc1;
    setupRequest.sec1 = sec1;
    logger.i('setup1Request finished');
    return setupRequest;
  }

  Future<SessionData?> setup1Response(SessionData responseData) async {
    logger.i('setup1Response');
    var setupResp = responseData;
    if (setupResp.secVer == SecSchemeVersion.SecScheme1) {
      final deviceVerify = setupResp.sec1.sr1.deviceVerifyData;
      logger.i('Device verify: ${deviceVerify.toString()}');
      final encClientPubkey = await decrypt(
          Uint8List.fromList(setupResp.sec1.sr1.deviceVerifyData));
      logger.i('encClientPubkey: ${encClientPubkey.toString()}');
      logger.i('clientKey.publicKey.bytes: ${clientPubKey.toString()}');

      Function eq = const ListEquality().equals;
      if (!eq(encClientPubkey, clientPubKey)) {
        throw Exception('Mismatch in device verify');
      }
      return null;
    }
    throw Exception('Unsupported security protocol');
  }
}
