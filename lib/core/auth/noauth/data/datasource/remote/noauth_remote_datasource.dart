import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/i_noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NoAuthRemoteDatasource implements INoAuthRemoteDatasource {
  const NoAuthRemoteDatasource({
    required this.thingsboardClient,
    required this.tbLogger,
  });

  final ThingsboardClient thingsboardClient;
  final TbLogger tbLogger;

  @override
  Future<LoginResponse> getJwtToken({
    required String host,
    required String key,
  }) async {
    try {
      final data = await thingsboardClient.getLoginDataBySecretKey(
        host: host,
        key: key,
      );

      return data;
    } catch (e) {
      tbLogger.error('NoAuthRemoteDatasource:getJwtToken() message $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserFromJwtToken(LoginResponse loginData) async {
    await thingsboardClient.setUserFromJwtToken(
      loginData.token,
      loginData.refreshToken,
      false,
    );
  }
}
