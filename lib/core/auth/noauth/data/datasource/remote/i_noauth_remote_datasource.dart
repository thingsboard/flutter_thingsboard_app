import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class INoAuthRemoteDatasource {
  Future<LoginResponse> getJwtToken({
    required String host,
    required String key,
  });

  Future<void> setUserFromJwtToken(LoginResponse loginData);
}
