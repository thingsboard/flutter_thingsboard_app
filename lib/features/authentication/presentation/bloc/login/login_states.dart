part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginLoadingState;

  const factory LoginState.data({
    required List<Oauth2Entity> oAuthClients,
  }) = LoginDataState;

  const factory LoginState.requireClientUpdate({
    required VersionInfo versionInfo,
    required StoreInfo? storeInfo,
  }) = LoginStateRequireClientUpdate;

  const factory LoginState.loginWip() = LoginStateLoginInProgress;

  const factory LoginState.mfa() = LoginStateMfa;
}
