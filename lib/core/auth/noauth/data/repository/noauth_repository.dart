import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/i_noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

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
}
