import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/features/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/notification_service.dart';
import 'package:thingsboard_app/services/toast_notification/i_toast_notification_service.dart';
import 'package:thingsboard_app/services/widget_action_handler.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:universal_platform/universal_platform.dart';

part 'has_tb_context.dart';

enum NotificationType { info, warn, success, error }

class TbContext implements PopEntry {
  TbContext(this.router) {
    _widgetActionHandler = WidgetActionHandler(this);
  }

  static final deviceInfoPlugin = DeviceInfoPlugin();
  bool isUserLoaded = false;
  final _isAuthenticated = ValueNotifier<bool>(false);
  late PlatformType platformType;
  List<TwoFaProviderInfo>? twoFactorAuthProviders;

  final _isLoadingNotifier = ValueNotifier<bool>(false);
  final _log = getIt<ILoggerService>();
  late final WidgetActionHandler _widgetActionHandler;
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  late String packageName;
  late PlatformVersion version;

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

  final FluroRouter router;
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  Listenable get isAuthenticatedListenable => _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated.value;

  TbContextState? currentState;

  ILoggerService get log => _log;

  WidgetActionHandler get widgetActionHandler => _widgetActionHandler;

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
      if (UniversalPlatform.isAndroid) {
        androidInfo = await deviceInfoPlugin.androidInfo;
        platformType = PlatformType.ANDROID;
      } else if (UniversalPlatform.isIOS) {
        iosInfo = await deviceInfoPlugin.iosInfo;
        platformType = PlatformType.IOS;
      } else {
        platformType = PlatformType.WEB;
      }
      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        packageName = packageInfo.packageName;
        version = PlatformVersion.fromString(packageInfo.version);
      } else {
        packageName = 'web.app';
      }
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
    // TODO rework
    getIt<IToastNotificationService>().showErrorNotification(tbError.message!);
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

      _isAuthenticated.value =
          tbClient.isAuthenticated() && !tbClient.isPreVerificationToken();

      if (isAuthenticated) {
        onDone?.call();
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
          navigateTo(
            '/login',
            replace: true,
            clearStack: true,
            transition: TransitionType.fadeIn,
            transitionDuration: const Duration(milliseconds: 750),
          );
        }
      } else {
        navigateTo(
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
        navigateByAppLink(link);
      } catch (e) {
        log.error('TbContext:getInitialUri() exception $e');
      }

      _appLinkStreamSubscription ??= appLinks.uriLinkStream.listen(
        (link) {
          navigateByAppLink(link.toString());
        },
        onError: (err) {
          log.error('linkStream.listen $err');
        },
      );
    }
  }

  Future<void> navigateByAppLink(String? link) async {
    if (link != null) {
      final uri = Uri.parse(link);
      await getIt<ILocalDatabaseService>().deleteInitialAppLink();

      log.debug('TbContext: navigate by appLink $uri');
      navigateTo(
        uri.path,
        routeSettings: RouteSettings(
          arguments: {...uri.queryParameters, 'uri': uri},
        ),
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
      try {
        await NotificationService(tbClient, log, this).logout();
      } catch (e) {
        log.error('NotificationService::logout() error -> $e');
      }
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

  Future<dynamic> navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
    closeDashboard = true,
    TransitionType? transition,
    Duration? transitionDuration,
    bool restoreDashboard = true,
    RouteSettings? routeSettings,
  }) async {
    if (currentState != null) {
      if (transition != TransitionType.nativeModal) {
        transition = TransitionType.none;
      } else if (transition == null) {
        if (replace) {
          transition = TransitionType.fadeIn;
        } else {
          transition = TransitionType.native;
        }
      }

      return await router.navigateTo(
        currentState!.context,
        path,
        transition: transition,
        transitionDuration: transitionDuration,
        replace: replace,
        clearStack: clearStack,
        routeSettings: routeSettings,
      );
    }
  }

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) async {
    return router.navigateTo(
      currentState!.context,
      '/dashboard',
      routeSettings: RouteSettings(
        arguments: DashboardArgumentsEntity(
          dashboardId,
          title: dashboardTitle,
          state: state,
          hideToolbar: hideToolbar,
          animate: animate,
        ),
      ),
    );
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

  void pop<T>([T? result, BuildContext? context]) async {
    var targetContext = context ?? currentState?.context;
    if (targetContext != null) {
      router.pop<T>(targetContext, result);
    }
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
          TextButton(onPressed: () => pop(null, context), child: Text(ok)),
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
            onPressed: () => pop(false, context),
            child: Text(cancel),
          ),
          TextButton(onPressed: () => pop(true, context), child: Text(ok)),
        ],
      ),
    );
  }
}
