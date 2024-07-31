import 'dart:ui';

import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/i_noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class NoAuthRepository implements INoAuthRepository {
  const NoAuthRepository({required this.remoteDatasource});

  final INoAuthRemoteDatasource remoteDatasource;

  @override
  Future<LoginResponse> getJwtToken({
    required String host,
    required String key,
  }) {
    return remoteDatasource.getJwtToken(host: host, key: key);
  }

  @override
  Future<void> setUserFromJwtToken(LoginResponse loginData) async {
    await remoteDatasource.setUserFromJwtToken(loginData);
  }

  @override
  Future<void> logout({
    RequestConfig? requestConfig,
    bool notifyUser = true,
  }) async {
    await remoteDatasource.logout(
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
    await remoteDatasource.reInit(
      endpoint: endpoint,
      onDone: onDone,
      onError: onError,
    );
  }

  @override
  bool isAuthenticated() {
    return remoteDatasource.isAuthenticated();
  }

  @override
  AuthUser getAuthUserFromJwt(String jwt) {
    return remoteDatasource.getAuthUserFromJwt(jwt);
  }

  @override
  AuthUser? getCurrentlyAuthenticatedUserOrNull() {
    return remoteDatasource.getCurrentlyAuthenticatedUserOrNull();
  }
}
