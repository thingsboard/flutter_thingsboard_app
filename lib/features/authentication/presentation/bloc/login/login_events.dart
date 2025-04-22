part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.fetch() = LoginFetchEvent;

  const factory LoginEvent.login({
    required String username,
    required String password,
  }) = Login;

  const factory LoginEvent.loginWithOauth2(Oauth2Entity oauth2) =
      LoginWithOauth2Event;
}
