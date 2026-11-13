import 'dart:typed_data';

import 'proto/dart/session.pb.dart';

// Enum for state of protocomm_security1 FSM
enum SecurityState {
  REQUEST1,
  RESPONSE1_REQUEST2,
  RESPONSE2,
  FINISH,
}

abstract class Security {
  Future<Uint8List> encrypt(Uint8List data);

  Future<Uint8List> decrypt(Uint8List data);

  Future<SessionData?> securitySession(SessionData? responseData);
}
