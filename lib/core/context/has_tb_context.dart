part of 'tb_context.dart';

mixin HasTbContext {
  late final TbContext _tbContext;

  void setTbContext(TbContext tbContext) {
    _tbContext = tbContext;
  }

  void setupCurrentState(TbContextState currentState) {
    if (_tbContext.currentState != null) {
      // ignore: deprecated_member_use
      ModalRoute.of(_tbContext.currentState!.context)
          ?.unregisterPopEntry(_tbContext);
    }
    _tbContext.currentState = currentState;
    if (_tbContext.currentState != null) {
      // ignore: deprecated_member_use
      ModalRoute.of(_tbContext.currentState!.context)
          ?.registerPopEntry(_tbContext);
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

  Future<dynamic> navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
  }) =>
      _tbContext.navigateTo(path, replace: replace, clearStack: clearStack);

  void pop<T>([T? result, BuildContext? context]) =>
      _tbContext.pop<T>(result, context);

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) =>
      _tbContext.navigateToDashboard(
        dashboardId,
        dashboardTitle: dashboardTitle,
        state: state,
        hideToolbar: hideToolbar,
        animate: animate,
      );

  Future<bool?> confirm({
    required String title,
    required String message,
    String cancel = 'Cancel',
    String ok = 'Ok',
  }) =>
      _tbContext.confirm(
        title: title,
        message: message,
        cancel: cancel,
        ok: ok,
      );

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
