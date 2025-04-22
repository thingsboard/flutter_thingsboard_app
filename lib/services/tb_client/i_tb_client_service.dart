import 'package:thingsboard_app/services/alarm/i_alarm_service.dart';
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/services/i_service_has_resource.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show AuthUser, LoginResponse, RequestConfig, TwoFaProviderType;

abstract interface class ITbClientService implements IServiceHasResource {
  IDashboardService get dashboardService;

  IAlarmService get alarmService;

  IUserService get userService;

  IMobileService get mobileService;

  bool isAuthenticated();

  bool isPreVerificationToken();

  AuthUser? getAuthUser();

  bool isUserFullyAuthenticated();

  Future<void> setUserFromJwtToken(
    String? jwtToken,
    String? refreshToken,
    bool? notify,
  );

  Future<LoginResponse> login({
    required String userName,
    required String password,
    RequestConfig? requestConfig,
  });

  bool isSystemAdmin();

  bool isTenantAdmin();

  bool isCustomerUser();

  String? getJwtToken();

  String? getRefreshToken();

  Future<void> sendResetPasswordLink(
    String email, {
    RequestConfig? requestConfig,
  });

  Future<LoginResponse> checkTwoFaVerificationCode(
    TwoFaProviderType providerType,
    String verificationCode, {
    RequestConfig? requestConfig,
  });
}
