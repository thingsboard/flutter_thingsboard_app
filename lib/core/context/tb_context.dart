import 'dart:async';
import 'package:universal_platform/universal_platform.dart';
import 'package:device_info/device_info.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:package_info/package_info.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/oauth2/app_secret_provider.dart';
import 'package:thingsboard_app/core/auth/oauth2/tb_oauth2_client.dart';
import 'package:thingsboard_app/modules/main/main_page.dart';
import 'package:thingsboard_app/utils/services/widget_action_handler.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_app_storage.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

enum NotificationType { info, warn, success, error }

class TbLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      debugPrint(line);
    }
  }
}

class TbLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode) {
      return event.level.index >= Level.warning.index;
    } else {
      return true;
    }
  }
}

class TbLogger {
  final _logger = Logger(
      filter: TbLogsFilter(),
      printer: PrefixPrinter(PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 200,
          colors: false,
          printEmojis: true,
          printTime: false)),
      output: TbLogOutput());

  void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }
}

typedef OpenDashboardCallback = void Function(String dashboardId,
    {String? dashboardTitle, String? state, bool? hideToolbar});

abstract class TbMainDashboardHolder {
  Future<void> navigateToDashboard(String dashboardId,
      {String? dashboardTitle,
      String? state,
      bool? hideToolbar,
      bool animate = true});

  Future<bool> openMain({bool animate});

  Future<bool> closeMain({bool animate});

  Future<bool> openDashboard({bool animate});

  Future<bool> closeDashboard({bool animate});

  bool isDashboardOpen();

  Future<bool> dashboardGoBack();
}

class TbContext {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  bool _initialized = false;
  bool isUserLoaded = false;
  final ValueNotifier<bool> _isAuthenticated = ValueNotifier(false);
  PlatformType? _oauth2PlatformType;
  List<OAuth2ClientInfo>? oauth2ClientInfos;
  User? userDetails;
  HomeDashboardInfo? homeDashboard;
  final _isLoadingNotifier = ValueNotifier<bool>(false);
  final _log = TbLogger();
  late final _widgetActionHandler;
  late final AndroidDeviceInfo? _androidInfo;
  late final IosDeviceInfo? _iosInfo;
  late final String packageName;
  TbMainDashboardHolder? _mainDashboardHolder;
  bool _closeMainFirst = false;

  GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late final ThingsboardClient tbClient;
  late final TbOAuth2Client oauth2Client;

  final FluroRouter router;
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  TbContextState? currentState;

  TbContext(this.router) {
    _widgetActionHandler = WidgetActionHandler(this);
  }

  TbLogger get log => _log;
  WidgetActionHandler get widgetActionHandler => _widgetActionHandler;

  Future<void> init() async {
    assert(() {
      if (_initialized) {
        throw StateError('TbContext already initialized!');
      }
      return true;
    }());
    _initialized = true;
    var storage = createAppStorage();
    tbClient = ThingsboardClient(ThingsboardAppConstants.thingsBoardApiEndpoint,
        storage: storage,
        onUserLoaded: onUserLoaded,
        onError: onError,
        onLoadStarted: onLoadStarted,
        onLoadFinished: onLoadFinished,
        computeFunc: <Q, R>(callback, message) => compute(callback, message));

    oauth2Client = TbOAuth2Client(
        tbContext: this, appSecretProvider: AppSecretProvider.local());

    try {
      if (UniversalPlatform.isAndroid) {
        _androidInfo = await deviceInfoPlugin.androidInfo;
        _oauth2PlatformType = PlatformType.ANDROID;
      } else if (UniversalPlatform.isIOS) {
        _iosInfo = await deviceInfoPlugin.iosInfo;
        _oauth2PlatformType = PlatformType.IOS;
      } else {
        _oauth2PlatformType = PlatformType.WEB;
      }
      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        packageName = packageInfo.packageName;
      } else {
        packageName = 'web.app';
      }
      await tbClient.init();
    } catch (e, s) {
      log.error('Failed to init tbContext: $e', e, s);
    }
  }

  void setMainDashboardHolder(TbMainDashboardHolder holder) {
    _mainDashboardHolder = holder;
  }

  void onError(ThingsboardError tbError) {
    log.error('onError', tbError, tbError.getStackTrace());
    showErrorNotification(tbError.message!);
  }

  void showErrorNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.error, duration: duration);
  }

  void showInfoNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.info, duration: duration);
  }

  void showWarnNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.warn, duration: duration);
  }

  void showSuccessNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.success, duration: duration);
  }

  void showNotification(String message, NotificationType type,
      {Duration? duration}) {
    duration ??= const Duration(days: 1);
    Color backgroundColor;
    var textColor = Color(0xFFFFFFFF);
    switch (type) {
      case NotificationType.info:
        backgroundColor = Color(0xFF323232);
        break;
      case NotificationType.warn:
        backgroundColor = Color(0xFFdc6d1b);
        break;
      case NotificationType.success:
        backgroundColor = Color(0xFF008000);
        break;
      case NotificationType.error:
        backgroundColor = Color(0xFF800000);
        break;
    }
    final snackBar = SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: textColor,
        onPressed: () {
          messengerKey.currentState!
              .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
        },
      ),
    );
    messengerKey.currentState!.removeCurrentSnackBar();
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  void hideNotification() {
    messengerKey.currentState!.removeCurrentSnackBar();
  }

  void onLoadStarted() {
    log.debug('On load started.');
    _isLoadingNotifier.value = true;
  }

  void onLoadFinished() {
    log.debug('On load finished.');
    _isLoadingNotifier.value = false;
  }

  Future<void> onUserLoaded() async {
    try {
      log.debug('onUserLoaded: isAuthenticated=${tbClient.isAuthenticated()}');
      isUserLoaded = true;
      if (tbClient.isAuthenticated()) {
        log.debug('authUser: ${tbClient.getAuthUser()}');
        if (tbClient.getAuthUser()!.userId != null) {
          try {
            userDetails = await tbClient.getUserService().getUser();
            homeDashboard =
                await tbClient.getDashboardService().getHomeDashboardInfo();
          } catch (e) {
            if (!_isConnectionError(e)) {
              tbClient.logout();
            } else {
              rethrow;
            }
          }
        }
      } else {
        userDetails = null;
        homeDashboard = null;
        oauth2ClientInfos = await tbClient.getOAuth2Service().getOAuth2Clients(
            pkgName: packageName, platform: _oauth2PlatformType);
      }
      _isAuthenticated.value = tbClient.isAuthenticated();
      await updateRouteState();
    } catch (e, s) {
      log.error('Error: $e', e, s);
      if (_isConnectionError(e)) {
        var res = await confirm(
            title: 'Connection error',
            message: 'Failed to connect to server',
            cancel: 'Cancel',
            ok: 'Retry');
        if (res == true) {
          onUserLoaded();
        } else {
          navigateTo('/login',
              replace: true,
              clearStack: true,
              transition: TransitionType.fadeIn,
              transitionDuration: Duration(milliseconds: 750));
        }
      }
    }
  }

  bool _isConnectionError(e) {
    return e is ThingsboardError &&
        e.errorCode == ThingsBoardErrorCode.general &&
        e.message == 'Unable to connect';
  }

  Listenable get isAuthenticatedListenable => _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated.value;

  bool get hasOAuthClients =>
      oauth2ClientInfos != null && oauth2ClientInfos!.isNotEmpty;

  Future<void> updateRouteState() async {
    if (currentState != null) {
      if (tbClient.isAuthenticated()) {
        var defaultDashboardId = _defaultDashboardId();
        if (defaultDashboardId != null) {
          bool fullscreen = _userForceFullscreen();
          if (!fullscreen) {
            await navigateToDashboard(defaultDashboardId, animate: false);
            navigateTo('/home',
                replace: true,
                closeDashboard: false,
                transition: TransitionType.none);
          } else {
            navigateTo('/fullscreenDashboard/$defaultDashboardId',
                replace: true, transition: TransitionType.fadeIn);
          }
        } else {
          navigateTo('/home',
              replace: true,
              transition: TransitionType.fadeIn,
              transitionDuration: Duration(milliseconds: 750));
        }
      } else {
        navigateTo('/login',
            replace: true,
            clearStack: true,
            transition: TransitionType.fadeIn,
            transitionDuration: Duration(milliseconds: 750));
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

  bool isPhysicalDevice() {
    if (UniversalPlatform.isAndroid) {
      return _androidInfo!.isPhysicalDevice;
    } else if (UniversalPlatform.isIOS) {
      return _iosInfo!.isPhysicalDevice;
    } else {
      return false;
    }
  }

  String userAgent() {
    String userAgent = 'Mozilla/5.0';
    if (UniversalPlatform.isAndroid) {
      userAgent +=
          ' (Linux; Android ${_androidInfo!.version.release}; ${_androidInfo!.model})';
    } else if (UniversalPlatform.isIOS) {
      userAgent += ' (${_iosInfo!.model})';
    }
    userAgent +=
        ' AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36';
    return userAgent;
  }

  bool isHomePage() {
    if (currentState != null) {
      if (currentState is TbMainState) {
        var mainState = currentState as TbMainState;
        return mainState.isHomePage();
      }
    }
    return false;
  }

  Future<dynamic> navigateTo(String path,
      {bool replace = false,
      bool clearStack = false,
      closeDashboard = true,
      TransitionType? transition,
      Duration? transitionDuration,
      bool restoreDashboard = true}) async {
    if (currentState != null) {
      hideNotification();
      bool isOpenedDashboard =
          _mainDashboardHolder?.isDashboardOpen() == true && closeDashboard;
      if (isOpenedDashboard) {
        _mainDashboardHolder?.openMain();
      }
      if (currentState is TbMainState) {
        var mainState = currentState as TbMainState;
        if (mainState.canNavigate(path) && !replace) {
          mainState.navigateToPath(path);
          return;
        }
      }
      if (TbMainNavigationItem.isMainPageState(this, path)) {
        replace = true;
        clearStack = true;
      }
      if (transition != TransitionType.nativeModal && isOpenedDashboard) {
        transition = TransitionType.none;
      } else if (transition == null) {
        if (replace) {
          transition = TransitionType.fadeIn;
        } else {
          transition = TransitionType.native;
        }
      }
      _closeMainFirst = isOpenedDashboard;
      return await router.navigateTo(currentState!.context, path,
          transition: transition,
          transitionDuration: transitionDuration,
          replace: replace,
          clearStack: clearStack);
    }
  }

  Future<void> navigateToDashboard(String dashboardId,
      {String? dashboardTitle,
      String? state,
      bool? hideToolbar,
      bool animate = true}) async {
    await _mainDashboardHolder?.navigateToDashboard(dashboardId,
        dashboardTitle: dashboardTitle,
        state: state,
        hideToolbar: hideToolbar,
        animate: animate);
  }

  Future<T?> showFullScreenDialog<T>(Widget dialog) {
    return Navigator.of(currentState!.context).push<T>(new MaterialPageRoute<T>(
        builder: (BuildContext context) {
          return dialog;
        },
        fullscreenDialog: true));
  }

  void pop<T>([T? result, BuildContext? context]) async {
    await closeMainIfNeeded();
    var targetContext = context ?? currentState?.context;
    if (targetContext != null) {
      router.pop<T>(targetContext, result);
    }
  }

  Future<bool> maybePop<T extends Object?>([T? result]) async {
    if (currentState != null) {
      return Navigator.of(currentState!.context).maybePop(result);
    } else {
      return true;
    }
  }

  Future<bool> willPop() async {
    if (await closeMainIfNeeded()) {
      return true;
    }
    if (_mainDashboardHolder != null) {
      return await _mainDashboardHolder!.dashboardGoBack();
    }
    return true;
  }

  Future<bool> closeMainIfNeeded() async {
    if (currentState != null) {
      if (currentState!.closeMainFirst && _mainDashboardHolder != null) {
        await _mainDashboardHolder!.closeMain();
        return true;
      }
    }
    return false;
  }

  Future<bool?> confirm(
      {required String title,
      required String message,
      String cancel = 'Cancel',
      String ok = 'Ok'}) {
    return showDialog<bool>(
        context: currentState!.context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => pop(false, context), child: Text(cancel)),
                TextButton(onPressed: () => pop(true, context), child: Text(ok))
              ],
            ));
  }
}

mixin HasTbContext {
  late final TbContext _tbContext;

  void setTbContext(TbContext tbContext) {
    _tbContext = tbContext;
  }

  void setupCurrentState(TbContextState currentState) {
    if (_tbContext.currentState != null) {
      ModalRoute.of(_tbContext.currentState!.context)
          ?.removeScopedWillPopCallback(_tbContext.willPop);
    }
    _tbContext.currentState = currentState;
    if (_tbContext.currentState != null) {
      ModalRoute.of(_tbContext.currentState!.context)
          ?.addScopedWillPopCallback(_tbContext.willPop);
    }
    if (_tbContext._closeMainFirst) {
      _tbContext._closeMainFirst = false;
      if (_tbContext.currentState != null) {
        _tbContext.currentState!.closeMainFirst = true;
      }
    }
  }

  void setupTbContext(TbContextState currentState) {
    _tbContext = currentState.widget.tbContext;
  }

  TbContext get tbContext => _tbContext;

  TbLogger get log => _tbContext.log;

  bool get isPhysicalDevice => _tbContext.isPhysicalDevice();

  WidgetActionHandler get widgetActionHandler => _tbContext.widgetActionHandler;

  ValueNotifier<bool> get loadingNotifier => _tbContext._isLoadingNotifier;

  ThingsboardClient get tbClient => _tbContext.tbClient;

  Future<void> initTbContext() async {
    await _tbContext.init();
  }

  Future<dynamic> navigateTo(String path,
          {bool replace = false, bool clearStack = false}) =>
      _tbContext.navigateTo(path, replace: replace, clearStack: clearStack);

  void pop<T>([T? result, BuildContext? context]) =>
      _tbContext.pop<T>(result, context);

  Future<bool> maybePop<T extends Object?>([T? result]) =>
      _tbContext.maybePop<T>(result);

  Future<void> navigateToDashboard(String dashboardId,
          {String? dashboardTitle,
          String? state,
          bool? hideToolbar,
          bool animate = true}) =>
      _tbContext.navigateToDashboard(dashboardId,
          dashboardTitle: dashboardTitle,
          state: state,
          hideToolbar: hideToolbar,
          animate: animate);

  Future<bool?> confirm(
          {required String title,
          required String message,
          String cancel = 'Cancel',
          String ok = 'Ok'}) =>
      _tbContext.confirm(
          title: title, message: message, cancel: cancel, ok: ok);

  void hideNotification() => _tbContext.hideNotification();

  void showErrorNotification(String message, {Duration? duration}) =>
      _tbContext.showErrorNotification(message, duration: duration);

  void showInfoNotification(String message, {Duration? duration}) =>
      _tbContext.showInfoNotification(message, duration: duration);

  void showWarnNotification(String message, {Duration? duration}) =>
      _tbContext.showWarnNotification(message, duration: duration);

  void showSuccessNotification(String message, {Duration? duration}) =>
      _tbContext.showSuccessNotification(message, duration: duration);

  void subscribeRouteObserver(TbPageState pageState) {
    _tbContext.routeObserver
        .subscribe(pageState, ModalRoute.of(pageState.context) as PageRoute);
  }

  void unsubscribeRouteObserver(TbPageState pageState) {
    _tbContext.routeObserver.unsubscribe(pageState);
  }
}
