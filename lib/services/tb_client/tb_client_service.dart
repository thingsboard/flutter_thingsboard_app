import 'dart:async';

import 'package:thingsboard_app/services/alarm/i_alarm_service.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart'
    show GlobalLogoutEvent, ICommunicationService;
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TBClientService implements ITbClientService {
  TBClientService(
    this.tbClient, {
    required this.communicationService,
    required this.dashboardService,
    required this.alarmService,
    required this.userService,
    required this.mobileService,
  }) {
    subscription = communicationService.on<GlobalLogoutEvent>().listen((_) {
      tbClient.logout();
    });
  }

  final ThingsboardClient tbClient;
  final ICommunicationService communicationService;
  late final StreamSubscription subscription;

  @override
  final IDashboardService dashboardService;
  @override
  final IAlarmService alarmService;
  @override
  final IUserService userService;
  @override
  final IMobileService mobileService;

  @override
  bool isAuthenticated() {
    return tbClient.isAuthenticated();
  }

  @override
  bool isPreVerificationToken() {
    return tbClient.isPreVerificationToken();
  }

  @override
  AuthUser? getAuthUser() {
    return tbClient.getAuthUser();
  }

  @override
  bool isUserFullyAuthenticated() {
    return tbClient.isAuthenticated() && !tbClient.isPreVerificationToken();
  }

  @override
  Future<void> setUserFromJwtToken(
    String? jwtToken,
    String? refreshToken,
    bool? notify,
  ) async {
    return tbClient.setUserFromJwtToken(jwtToken, refreshToken, notify);
  }

  @override
  Future<LoginResponse> login({
    required String userName,
    required String password,
    RequestConfig? requestConfig,
  }) {
    return tbClient.login(
      LoginRequest(userName, password),
      requestConfig: requestConfig,
    );
  }

  @override
  bool isSystemAdmin() {
    return tbClient.isSystemAdmin();
  }

  @override
  bool isTenantAdmin() {
    return tbClient.isTenantAdmin();
  }

  @override
  bool isCustomerUser() {
    return tbClient.isCustomerUser();
  }

  @override
  String? getJwtToken() {
    return tbClient.getJwtToken();
  }

  @override
  String? getRefreshToken() {
    return tbClient.getRefreshToken();
  }

  @override
  Future<void> dispose() async {
    subscription.cancel();
  }

  @override
  Future<void> sendResetPasswordLink(
    String email, {
    RequestConfig? requestConfig,
  }) async {
    return tbClient.sendResetPasswordLink(email, requestConfig: requestConfig);
  }

  @override
  Future<LoginResponse> checkTwoFaVerificationCode(
    TwoFaProviderType providerType,
    String verificationCode, {
    RequestConfig? requestConfig,
  }) {
    return tbClient.checkTwoFaVerificationCode(providerType, verificationCode);
  }
}
