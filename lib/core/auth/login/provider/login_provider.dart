// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/models/mobile_basic_info.dart';
import 'package:thingsboard_app/core/auth/oauth2/i_oauth2_client.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/providers/app_locale/app_locale_provider.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_loaded_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  // Read the live client on every access: a QR-code endpoint switch re-creates
  // the client (ITbClientService.reInit), so a reference captured at build time
  // would keep pointing at the old host and fail with 401 (PROD-8200).
  ThingsboardClient get _tbClient => getIt<ITbClientService>().client;
  final _deviceInfoService = getIt<IDeviceInfoService>();
  late final StreamSubscription<UserLoadedEvent> _listener;
  final _overlayService = getIt<IOverlayService>();
  @override
  LoginState build() {
    _listener = getIt<ICommunicationService>().on<UserLoadedEvent>().listen((
      _,
    ) async {
      await _safeHandleUserLoaded();
    });
    ref.onDispose(() => _listener.cancel());
    Future(_safeHandleUserLoaded);
    return const LoginState(isUserLoaded: false);
  }

  /// handleUserLoaded runs from fire-and-forget contexts (event bus, build):
  /// a failure there (e.g. the session was invalidated while loading the
  /// user) must not escape as an unhandled zone error (PROD-8200).
  Future<void> _safeHandleUserLoaded() async {
    try {
      await handleUserLoaded();
    } catch (e) {
      log('handle user loaded failed: $e');
    }
  }

  Future<void> logout() async {
    // Must run before the client logout: the teardown's gpsActive=false write
    // needs the still-valid token.
    await getIt<ILiveLocationTrackingService>().teardownForLogout();
    if (state.isFullyAuthenticated()) {
      await getIt<NotificationService>().logout();
    }
    getIt<ICustomTranslationService>().clear();
    await _tbClient.logout(requestConfig: RequestConfig(ignoreErrors: true));
  }

  Future<void> handleUserLoaded() async {
    log('handle user loaded: ${_tbClient.getAuthUser()?.userId}');

    if (!_tbClient.isAuthenticated()) {
      state = const LoginState(isUserLoaded: false);
      // Fire-and-forget: the cleanup swallows its own errors, and the
      // registration flag is deleted last, so an interrupted attempt is
      // retried on the next launch without delaying the login screen.
      // NotificationService.init() waits for it, so a fast auto-login
      // (QR code, OAuth2) cannot register a token while it is being deleted.
      unawaited(getIt<NotificationService>().cleanUpStalePushRegistration());
      return;
    }
    if (_tbClient.isPreVerificationToken() ||
        _tbClient.isMfaConfigurationToken()) {
      state = state.copyWith(
        isUserLoaded: true,
        userScope: _tbClient.getAuthUser()?.authority,
        user: null,
      );
      return;
    }
    await _onFullyLoggedIn();
  }

  Future<bool> login(String email, String password) async {
    try {
      await _tbClient.login(
        LoginRequest(
          (b) => b
            ..username = email
            ..password = password,
        ),
      );
      final user = _tbClient.getAuthUser();
      if (user != null &&
          (user.isMfaConfigurationToken() || user.isPreVerificationToken())) {
        return false;
      }
    } catch (e) {
      getIt<ITbClientService>().reportUnsupportedServer(e);
      return false;
    }
    return true;
  }

  /// [silent] keeps the requests away from the global error toast/dialog, for
  /// a caller that reports the failure itself.
  Future<void> loadUser({bool silent = false}) async {
    final extra = silent ? silentRequestExtra() : null;
    final mobileResp = await _tbClient
        .getMobileAppControllerApi()
        .getUserMobileInfo(
          pkgName: _deviceInfoService.getApplicationId(),
          platform: _deviceInfoService.getPlatformType().name,
          extra: extra,
        );
    final mobileInfo = MobileBasicInfo.fromUserMobileInfo(mobileResp.data!);

    final userInfo = (await _tbClient.getAuthControllerApi().getUser(
      extra: extra,
    )).data!;
    final lang = userInfo.additionalInfo?.isMap == true
        ? userInfo.additionalInfo?.asMap['lang']
        : null;
    final langStr = lang?.toString();
    ref.read(appLocaleProvider.notifier).set(localeFromTbCode(langStr));
    await getIt<ICustomTranslationService>().load(
      localeCode: (langStr != null && langStr.isNotEmpty) ? langStr : 'en_US',
    );
    final userPermissions =
        (await _tbClient
                .getUserPermissionsControllerApi()
                .getAllowedPermissions(extra: extra))
            .data!;
    state = state.copyWith(
      isUserLoaded: true,
      user: userInfo,
      userScope: userInfo.authority,
      mobileLoginInfo: mobileInfo,
      userPermissions: userPermissions,
    );
  }

  Future<void> _onFullyLoggedIn() async {
    final client = _tbClient;
    try {
      await loadUser(silent: true);
    } catch (e) {
      log('load user failed: $e');
      await _onLoadUserFailed(client, e);
      return;
    }
    await getIt<NotificationService>().init();
  }

  /// Only a loaded user moves the app past the login and 2FA screens, so a
  /// failed load must end in a retry or a logout: keeping the session without
  /// a user left the login loader spinning and the 2FA screen frozen on a
  /// valid code (the old TbContext.onUserLoaded did the same).
  Future<void> _onLoadUserFailed(ThingsboardClient client, Object e) async {
    // A QR endpoint switch replaced the client, or a rejected refresh token
    // cleared the session: that change fires its own UserLoadedEvent.
    bool superseded() =>
        !identical(client, _tbClient) || !client.isAuthenticated();
    if (superseded()) {
      return;
    }
    // The generated APIs throw a DioException that wraps the error.
    final error = toThingsboardError(e);
    final choice = Utils.isConnectionError(error)
        ? await _overlayService.showConnectionErrorRetryDialog(
            content: (context) => DialogContent(
              title: S.of(context).connectionError,
              message: S.of(context).failedToConnectToServer,
              ok: S.of(context).retry,
              cancel: S.of(context).logout,
            ),
          )
        : await _overlayService.showConfirmDialog(
            content: (context) => DialogContent(
              title: S.of(context).somethingWentWrong,
              message: error.getTranslatedMessage(context),
              ok: S.of(context).retry,
              cancel: S.of(context).logout,
            ),
          );
    if (superseded()) {
      return;
    }
    // Dismissing the dialog retries: only the explicit button drops the
    // session.
    if (choice == false) {
      await logout();
    } else {
      await _onFullyLoggedIn();
    }
  }

  Future<bool> oauthLogin(String url) async {
    try {
      final result = await getIt<IOAuth2Client>().authenticate(url);
      if (result.success) {
        await _tbClient.setUserFromJwtToken(
          result.accessToken,
          result.refreshToken,
          true,
        );
        return true;
      } else {
        _overlayService.showErrorNotification((_) => result.error!);
      }
    } catch (e) {
      if (!getIt<ITbClientService>().reportUnsupportedServer(e)) {
        _overlayService.showErrorNotification((_) => e.toString());
      }
    }
    return false;
  }
}
