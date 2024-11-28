import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/web/tb_web_auth.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show PlatformTypeToString;
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';

import 'app_secret_provider.dart';

class TbOAuth2AuthenticateResult {
  String? accessToken;
  String? refreshToken;
  String? error;

  TbOAuth2AuthenticateResult.success(this.accessToken, this.refreshToken);

  TbOAuth2AuthenticateResult.failed(this.error);

  bool get success => error == null;
}

class TbOAuth2Client {
  final TbContext _tbContext;
  final AppSecretProvider _appSecretProvider;

  TbOAuth2Client({
    required TbContext tbContext,
    required AppSecretProvider appSecretProvider,
  })  : _tbContext = tbContext,
        _appSecretProvider = appSecretProvider;

  Future<TbOAuth2AuthenticateResult> authenticate(String oauth2Url) async {
    final appSecret = await _appSecretProvider.getAppSecret(
      _tbContext.platformType,
    );
    final pkgName = _tbContext.packageName;
    final jwt = JWT(
      {
        'callbackUrlScheme':
            ThingsboardAppConstants.thingsboardOAuth2CallbackUrlScheme,
      },
      issuer: pkgName,
    );
    final key = SecretKey(appSecret);
    final appToken = jwt.sign(
      key,
      algorithm: _HMACBase64Algorithm.hs512,
      expiresIn: const Duration(minutes: 2),
    );
    var url =
        Uri.parse(await getIt<IEndpointService>().getEndpoint() + oauth2Url);
    final params = Map<String, String>.from(url.queryParameters);
    params['pkg'] = pkgName;
    params['appToken'] = appToken;
    params['platform'] = _tbContext.platformType.toShortString();
    url = url.replace(queryParameters: params);

    _tbContext.log.debug('TbOAuth2Client::authenticate() request url -> $url');
    final result = await TbWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme:
          ThingsboardAppConstants.thingsboardOAuth2CallbackUrlScheme,
      saveHistory: false,
    );
    final resultUri = Uri.parse(result);
    _tbContext.log
        .debug('TbOAuth2Client::authenticate() result url -> $resultUri');
    final error = resultUri.queryParameters['error'];
    if (error != null) {
      return TbOAuth2AuthenticateResult.failed(error);
    } else {
      final accessToken = resultUri.queryParameters['accessToken'];
      final refreshToken = resultUri.queryParameters['refreshToken'];
      if (accessToken != null && refreshToken != null) {
        return TbOAuth2AuthenticateResult.success(accessToken, refreshToken);
      } else {
        return TbOAuth2AuthenticateResult.failed(
          'No authentication credentials in response.',
        );
      }
    }
  }
}

class _HMACBase64Algorithm extends JWTAlgorithm {
  static const hs512 = _HMACBase64Algorithm('HS512');

  final String _name;

  const _HMACBase64Algorithm(this._name);

  @override
  String get name => _name;

  @override
  Uint8List sign(JWTKey key, Uint8List body) {
    assert(key is SecretKey, 'key must be a SecretKey');
    final secretKey = key as SecretKey;

    final hmac = Hmac(_getHash(name), base64Decode(secretKey.key));

    return Uint8List.fromList(hmac.convert(body).bytes);
  }

  @override
  bool verify(JWTKey key, Uint8List body, Uint8List signature) {
    assert(key is SecretKey, 'key must be a SecretKey');

    final actual = sign(key, body);

    if (actual.length != signature.length) return false;

    for (var i = 0; i < actual.length; i++) {
      if (actual[i] != signature[i]) return false;
    }

    return true;
  }

  Hash _getHash(String name) {
    switch (name) {
      case 'HS256':
        return sha256;
      case 'HS384':
        return sha384;
      case 'HS512':
        return sha512;
      default:
        throw ArgumentError.value(name, 'name', 'unknown hash name');
    }
  }
}
