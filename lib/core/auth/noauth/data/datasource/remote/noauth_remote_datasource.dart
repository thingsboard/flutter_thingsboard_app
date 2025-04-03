import 'dart:ui';

import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/i_noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class NoAuthRemoteDatasource implements INoAuthRemoteDatasource {
  const NoAuthRemoteDatasource({
    required this.thingsboardClient,
    required this.tbLogger,
    required this.tbContext,
  });

  final ThingsboardClient thingsboardClient;
  final TbLogger tbLogger;
  final TbContext tbContext;

  @override
  Future<LoginResponse> getJwtToken({
    required String host,
    required String key,
  }) async {
    try {
      final data = await thingsboardClient.getLoginDataBySecretKey(
        host: host,
        key: key,
        logging: EnvironmentVariables.apiCalls || EnvironmentVariables.verbose,
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

  @override
  Future<void> logout({
    RequestConfig? requestConfig,
    bool notifyUser = true,
  }) async {
    await tbContext.logout(
      requestConfig: requestConfig,
      notifyUser: notifyUser,
    );
  }

  @override
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onError,
  }) async {
    await tbContext.reInit(
      endpoint: endpoint,
      onDone: onDone,
      onAuthError: onError,
    );
  }

  @override
  bool isAuthenticated() {
    return tbContext.isAuthenticated;
  }

  @override
  AuthUser getAuthUserFromJwt(String jwt) {
    return thingsboardClient.getAuthUserFromJwt(jwt);
  }

  @override
  AuthUser? getCurrentlyAuthenticatedUserOrNull() {
    return thingsboardClient.getAuthUser();
  }
}
