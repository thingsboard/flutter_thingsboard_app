import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

import 'package:universal_platform/universal_platform.dart';

part 'has_tb_context.dart';

class TbContext implements PopEntry {
  bool isUserLoaded = false;
  final _isAuthenticated = ValueNotifier<bool>(false);
  List<TwoFaProviderInfo>? twoFactorAuthProviders;
  User? userDetails;
  HomeDashboardInfo? homeDashboard;
  VersionInfo? versionInfo;
  StoreInfo? storeInfo;
  final IOverlayService _overlayService = getIt<IOverlayService>();
  final _deviceInfoService = getIt<IDeviceInfoService>();
  final _isLoadingNotifier = ValueNotifier<bool>(false);
  final _log = TbLogger();
  StreamSubscription? _appLinkStreamSubscription;

  late bool _handleRootState;
  final appLinks = AppLinks();

  @override
  final ValueNotifier<bool> canPopNotifier = ValueNotifier<bool>(false);

  @override
  void onPopInvoked(bool didPop) {
    onPopInvokedImpl(didPop);
  }

  @override
  void onPopInvokedWithResult(bool didPop, result) {
    onPopInvokedImpl(didPop, result);
  }

  late ThingsboardClient tbClient;


 final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  Listenable get isAuthenticatedListenable => _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated.value;

  TbContextState? currentState;
  late final ThingsboardAppRouter thingsboardAppRouter = getIt();
  TbLogger get log => _log;
  final bottomNavigationTabChangedStream = StreamController<int>.broadcast();

  Future<void> init() async {
    _handleRootState = true;

    final endpoint = await getIt<IEndpointService>().getEndpoint();
    log.debug('TbContext::init() endpoint: $endpoint');

    tbClient = ThingsboardClient(
      endpoint,
      storage: getIt(),
      onUserLoaded: onUserLoaded,
      onError: onError,
      onLoadStarted: onLoadStarted,
      onLoadFinished: onLoadFinished,
      computeFunc: <Q, R>(callback, message) => compute(callback, message),
      debugMode: EnvironmentVariables.apiCalls || EnvironmentVariables.verbose,
    );

    try {
      await tbClient.init();
    } catch (e, s) {
      log.error('Failed to init tbContext: $e', e, s);
      await onFatalError(e);
    }
  }

  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  }) async {
    log.debug('TbContext:reinit()');

    _handleRootState = false;

    tbClient = ThingsboardClient(
      endpoint,
      storage: getIt(),
      onUserLoaded: () => onUserLoaded(onDone: onDone),
      onError: (error) {
        onAuthError(error);
        onError(error);
      },
      onLoadStarted: onLoadStarted,
      onLoadFinished: onLoadFinished,
      computeFunc: <Q, R>(callback, message) => compute(callback, message),
      debugMode: EnvironmentVariables.apiCalls || EnvironmentVariables.verbose,
    );

    await tbClient.init();
  }

  Future<void> onFatalError(e) async {
    var message = e is ThingsboardError
        ? (e.message ?? 'Unknown error.')
        : 'Unknown error.';
    message = 'Fatal application error occurred:\n$message.';
    await alert(title: 'Fatal error', message: message, ok: 'Close');
    logout();
  }

  void onError(ThingsboardError tbError) {
    log.error('onError', tbError, tbError.getStackTrace());
    _overlayService.showErrorNotification(tbError.message!);
  }

  void onLoadStarted() {
    log.debug('TbContext: On load started.');
    _isLoadingNotifier.value = true;
  }

  void onLoadFinished() async {
    log.debug('TbContext: On load finished.');
    _isLoadingNotifier.value = false;
  }

  Future<void> onUserLoaded({VoidCallback? onDone}) async {
    try {
      log.debug(
        'TbContext.onUserLoaded: isAuthenticated=${tbClient.isAuthenticated()}',
      );
      isUserLoaded = true;
      if (tbClient.isAuthenticated() && !tbClient.isPreVerificationToken()) {
        log.debug('authUser: ${tbClient.getAuthUser()}');
        if (tbClient.getAuthUser()!.userId != null) {
          try {
            final mobileInfo =
                await tbClient.getMobileService().getUserMobileInfo(
                      MobileInfoQuery(
                        platformType: _deviceInfoService.getPlatformType(),
                        packageName: _deviceInfoService.getApplicationId(),
                      ),
                    );
            userDetails = mobileInfo?.user;
            homeDashboard = mobileInfo?.homeDashboardInfo;
            versionInfo = mobileInfo?.versionInfo;
            storeInfo = mobileInfo?.storeInfo;
            getIt<ILayoutService>().cachePageLayouts(
              mobileInfo?.pages,
              authority: tbClient.getAuthUser()!.authority,
            );
          } catch (e) {
            log.error('TbContext::onUserLoaded error $e');
            if (!_isConnectionError(e)) {
              logout();
            } else {
              rethrow;
            }
          }
        }
      } else {
        if (tbClient.isPreVerificationToken()) {
          log.debug('authUser: ${tbClient.getAuthUser()}');
          twoFactorAuthProviders = await tbClient
              .getTwoFactorAuthService()
              .getAvailableLoginTwoFaProviders();
        } else {
          twoFactorAuthProviders = null;
        }

        userDetails = null;
        homeDashboard = null;
        versionInfo = null;
        storeInfo = null;
      }

      _isAuthenticated.value =
          tbClient.isAuthenticated() && !tbClient.isPreVerificationToken();
      if (versionInfo != null && versionInfo?.minVersion != null) {
        if (_deviceInfoService.getAppVersion().versionInt() <
            (versionInfo!.minVersion?.versionInt() ?? 0)) {
         thingsboardAppRouter.navigateTo(
            VersionRoutes.updateRequiredRoutePath,
            clearStack: true,
            replace: true,
            routeSettings: RouteSettings(
              arguments: VersionRouteArguments(
                versionInfo: versionInfo!,
                storeInfo: storeInfo,
              ),
            ),
          );
          return;
        }
      }

      if (isAuthenticated) {
        onDone?.call();
      }

      if (_handleRootState) {
        await updateRouteState();
      }

      if (isAuthenticated) {
        if (getIt<IFirebaseService>().apps.isNotEmpty) {
          await NotificationService(tbClient, log, this).init();
        }
      }
    } catch (e, s) {
      log.error('TbContext.onUserLoaded: $e', e, s);

      if (_isConnectionError(e)) {
        final res = await confirm(
          title: 'Connection error',
          message: 'Failed to connect to server',
          cancel: 'Cancel',
          ok: 'Retry',
        );
        if (res == true) {
          onUserLoaded();
        } else {
          thingsboardAppRouter.navigateTo(
            '/login',
            replace: true,
            clearStack: true,
            transition: TransitionType.fadeIn,
            transitionDuration: const Duration(milliseconds: 750),
          );
        }
      } else {
        thingsboardAppRouter.navigateTo(
          '/login',
          replace: true,
          clearStack: true,
          transition: TransitionType.fadeIn,
          transitionDuration: const Duration(milliseconds: 750),
        );
      }
    } finally {
      try {
        final link = await getIt<ILocalDatabaseService>().getInitialAppLink();
        thingsboardAppRouter.navigateByAppLink(link);
      } catch (e) {
        log.error('TbContext:getInitialUri() exception $e');
      }

      _appLinkStreamSubscription ??= appLinks.uriLinkStream.listen(
        (link) {
          thingsboardAppRouter.navigateByAppLink(link.toString());
        },
        onError: (err) {
          log.error('linkStream.listen $err');
        },
      );
    }
  }

  

  Future<void> logout({
    RequestConfig? requestConfig,
    bool notifyUser = true,
  }) async {
    log.debug('TbContext::logout($requestConfig, $notifyUser)');
    _handleRootState = true;

    if (getIt<IFirebaseService>().apps.isNotEmpty) {
      await NotificationService(tbClient, log, this).logout();
    }

    await tbClient.logout(
      requestConfig: requestConfig,
      notifyUser: notifyUser,
    );

    _appLinkStreamSubscription?.cancel();
    _appLinkStreamSubscription = null;
  }

  bool _isConnectionError(e) {
    return e is ThingsboardError &&
        e.errorCode == ThingsBoardErrorCode.general &&
        e.message == 'Unable to connect';
  }

  Future<void> updateRouteState() async {
    log.debug(
      'TbContext:updateRouteState() ${currentState != null && currentState!.mounted}',
    );
    if (currentState != null && currentState!.mounted) {
      if (tbClient.isAuthenticated() && !tbClient.isPreVerificationToken()) {
        final defaultDashboardId = _defaultDashboardId();
        if (defaultDashboardId != null) {
          bool fullscreen = _userForceFullscreen();
          if (!fullscreen) {
            await thingsboardAppRouter.navigateToDashboard(defaultDashboardId, animate: false);
           thingsboardAppRouter.navigateTo(
              '/main',
              replace: true,
              closeDashboard: false,
              clearStack: true,
              transition: TransitionType.none,
            );
          } else {
            thingsboardAppRouter.navigateTo(
              '/fullscreenDashboard/$defaultDashboardId',
              replace: true,
              clearStack: true,
              transition: TransitionType.fadeIn,
            );
          }
        } else {
          thingsboardAppRouter.navigateTo(
            '/main',
            replace: true,
            clearStack: true,
            transition: TransitionType.fadeIn,
            transitionDuration: const Duration(milliseconds: 750),
          );
        }
      } else {
        thingsboardAppRouter.navigateTo(
          '/login',
          replace: true,
          clearStack: true,
          transition: TransitionType.fadeIn,
          transitionDuration: const Duration(milliseconds: 750),
        );
      }
    }
  }

  String? _defaultDashboardId() {
    if (userDetails != null && userDetails!.additionalInfo != null) {
      return userDetails!.additionalInfo!['defaultDashboardId'];
    }
    return null;
  }

  bool _userForceFullscreen() {
    return tbClient.getAuthUser()!.isPublic! ||
        (userDetails != null &&
            userDetails!.additionalInfo != null &&
            userDetails!.additionalInfo!['defaultDashboardFullscreen'] == true);
  }

  String userAgent() {
    String userAgent = 'Mozilla/5.0';
    if (UniversalPlatform.isAndroid) {
      userAgent +=
          ' (Linux; Android ${_deviceInfoService.getSystemVersion()}; ${_deviceInfoService.getDeviceModel()})';
    } else if (UniversalPlatform.isIOS) {
      userAgent += ' (${_deviceInfoService.getDeviceModel()})';
    }
    userAgent +=
        ' AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36';
    return userAgent;
  }

  

  Future<T?> showFullScreenDialog<T>(Widget dialog, {BuildContext? context}) {
    return Navigator.of(context ?? currentState!.context).push<T>(
      MaterialPageRoute<T>(
        builder: (BuildContext context) {
          return dialog;
        },
        fullscreenDialog: true,
      ),
    );
  }

  void onPopInvokedImpl<T>(bool didPop, [T? result]) async {
    if (didPop) {
      return;
    }

    if (await currentState?.willPop() == true) {
      if (currentState?.context != null &&
          currentState?.context.mounted == true) {
        final navigator = Navigator.of(currentState!.context);
        if (navigator.canPop()) {
          navigator.pop(result);
        } else {
          SystemNavigator.pop();
        }
      }
    }
  }

  Future<void> alert({
    required String title,
    required String message,
    String ok = 'Ok',
  }) {
    return showDialog<bool>(
      context: currentState!.context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => thingsboardAppRouter.pop(null, context), child: Text(ok),),
        ],
      ),
    );
  }

  Future<bool?> confirm({
    required String title,
    required String message,
    String cancel = 'Cancel',
    String ok = 'Ok',
  }) {
    return showDialog<bool>(
      context: currentState!.context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => getIt<ThingsboardAppRouter>().pop(false, context),
            child: Text(cancel),
          ),
          TextButton(onPressed: () => getIt<ThingsboardAppRouter>().pop(true, context), child: Text(ok)),
        ],
      ),
    );
  }
}
