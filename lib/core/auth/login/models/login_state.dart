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
    AllowedPermissionsInfo? userPermissions,
  }) = _LoginState;
  const LoginState._();
  bool isFullyAuthenticated() {
    return ![
          Authority.MFA_CONFIGURATION_TOKEN,
          Authority.PRE_VERIFICATION_TOKEN,
        ].contains(userScope) &&
        userScope != null;
  }

  bool hasGenericPermission(Resource resource, Operation operation) {
    if (userPermissions != null) {
      return userPermissions!.hasGenericPermission(resource, operation);
    } else {
      return false;
    }
  }

  /// Includes shared dashboard groups, so users whose only access is a shared
  /// group are not locked out of listing and opening dashboards. Fails closed
  /// like [hasGenericPermission]: it guards the dashboard pages, not the menu.
  bool get canReadDashboards =>
      userPermissions?.hasReadGenericOrSharedGroupsPermission(
        Resource.DASHBOARD,
        EntityType.DASHBOARD,
      ) ??
      false;
}
