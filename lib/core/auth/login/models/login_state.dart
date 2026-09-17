import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/core/auth/login/models/mobile_basic_info.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required bool isUserLoaded,
    User? user,
    MobileBasicInfo? mobileLoginInfo,
    Authority? userScope,
  }) = _LoginState;
  const LoginState._();
  bool isFullyAuthenticated() {
    return ![
      Authority.MFA_CONFIGURATION_TOKEN,
      Authority.PRE_VERIFICATION_TOKEN
     
    ].contains(userScope) && userScope != null;
  }
}
