import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/constants/api_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController {

  final ValueNotifier<bool> canGoBack = ValueNotifier(false);
  final _DashboardState dashboardState;
  DashboardController(this.dashboardState);

  Future<void> openDashboard(String dashboardId, {String? state, bool? hideToolbar, bool fullscreen = false}) async {
    return await dashboardState._openDashboard(dashboardId, state: state, hideToolbar: hideToolbar, fullscreen: fullscreen);
  }

  Future<bool> goBack() async {
    return dashboardState._goBack();
  }

  onHistoryUpdated(Future<bool> canGoBackFuture) async {
    canGoBack.value = await canGoBackFuture;
  }

  dispose() {
    canGoBack.dispose();
  }

}

typedef DashboardTitleCallback = void Function(String title);

typedef DashboardControllerCallback = void Function(DashboardController controller);

class Dashboard extends TbContextWidget<Dashboard, _DashboardState> {

  final bool? _home;
  final DashboardTitleCallback? _titleCallback;
  final DashboardControllerCallback? _controllerCallback;

  Dashboard(TbContext tbContext, {Key? key, bool? home, DashboardTitleCallback? titleCallback, DashboardControllerCallback? controllerCallback}):
        this._home = home,
        this._titleCallback = titleCallback,
        this._controllerCallback = controllerCallback,
        super(tbContext);

  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends TbContextState<Dashboard, _DashboardState> {

  final Completer<InAppWebViewController> _controller = Completer<InAppWebViewController>();

  bool webViewLoading = true;
  final ValueNotifier<bool> dashboardLoading = ValueNotifier(true);
  final ValueNotifier<bool> readyState = ValueNotifier(false);

  final GlobalKey webViewKey = GlobalKey();

  late final DashboardController _dashboardController;

  bool _fullscreen = false;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        javaScriptEnabled: true,
        cacheEnabled: true,
        supportZoom: false,
        // useOnDownloadStart: true
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: false,
        thirdPartyCookiesEnabled: true
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late Uri _initialUrl;

  @override
  void initState() {
    super.initState();
    _dashboardController = DashboardController(this);
    if (widget._controllerCallback != null) {
      widget._controllerCallback!(_dashboardController);
    }
    tbContext.isAuthenticatedListenable.addListener(_onAuthenticated);
    if (tbContext.isAuthenticated) {
      _onAuthenticated();
    }
  }

  void _onAuthenticated() async {
    if (tbContext.isAuthenticated) {
      if (!readyState.value) {
        _initialUrl = Uri.parse(thingsBoardApiEndpoint + '?accessToken=${tbClient.getJwtToken()!}&refreshToken=${tbClient.getRefreshToken()!}');
        readyState.value = true;
      } else {
        var windowMessage = <String, dynamic>{
          'type': 'reloadUserMessage',
          'data': <String, dynamic>{
            'accessToken': tbClient.getJwtToken()!,
            'refreshToken': tbClient.getRefreshToken()!
          }
        };
        var controller = await _controller.future;
        await controller.postWebMessage(message: WebMessage(data: jsonEncode(windowMessage)), targetOrigin: Uri.parse('*'));
      }
    }
  }

  Future<bool> _goBack() async {
    var controller = await _controller.future;
    if (await controller.canGoBack()) {
      await controller.goBack();
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    tbContext.isAuthenticatedListenable.removeListener(_onAuthenticated);
    readyState.dispose();
    dashboardLoading.dispose();
    _dashboardController.dispose();
    super.dispose();
  }

  Future<void> _openDashboard(String dashboardId, {String? state, bool? hideToolbar, bool fullscreen = false}) async {
    _fullscreen = fullscreen;
    dashboardLoading.value = true;
    var controller = await _controller.future;
    var windowMessage = <String, dynamic>{
      'type': 'openDashboardMessage',
      'data': <String, dynamic>{
        'dashboardId': dashboardId
      }
    };
    if (state != null) {
      windowMessage['data']['state'] = state;
    }
    if (widget._home == true) {
      windowMessage['data']['embedded'] = true;
    }
    if (hideToolbar == true) {
      windowMessage['data']['hideToolbar'] = true;
    }
    var webMessage = WebMessage(data: jsonEncode(windowMessage));
    await controller.postWebMessage(message: webMessage, targetOrigin: Uri.parse('*'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
            onWillPop: () async {
              if (widget._home == true && !tbContext.isHomePage()) {
                return true;
              }
              var controller = await _controller.future;
              if (await controller.canGoBack()) {
                await controller.goBack();
                return false;
              }
              return true;
            },
            child:
            ValueListenableBuilder(
                valueListenable: readyState,
                builder: (BuildContext context, bool ready, child) {
                  if (!ready) {
                    return SizedBox.shrink();
                  } else {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: SafeArea(
                          child: Stack(
                              children: [
                                InAppWebView(
                                  key: webViewKey,
                                  initialUrlRequest: URLRequest(url: _initialUrl),
                                  initialOptions: options,
                                  onWebViewCreated: (webViewController) {
                                    log.debug("onWebViewCreated");
                                    webViewController.addJavaScriptHandler(handlerName: "tbMobileDashboardLoadedHandler", callback: (args) async {
                                      log.debug("Invoked tbMobileDashboardLoadedHandler");
                                      dashboardLoading.value = false;
                                    });
                                    webViewController.addJavaScriptHandler(handlerName: "tbMobileDashboardStateNameHandler", callback: (args) async {
                                      log.debug("Invoked tbMobileDashboardStateNameHandler: $args");
                                      if (args.isNotEmpty && args[0] is String) {
                                        if (widget._titleCallback != null) {
                                          widget._titleCallback!(args[0]);
                                        }
                                      }
                                    });
                                    webViewController.addJavaScriptHandler(handlerName: "tbMobileNavigationHandler", callback: (args) async {
                                      log.debug("Invoked tbMobileNavigationHandler: $args");
                                      if (args.length > 0) {
                                        String? path = args[0];
                                        Map<String, dynamic>? params;
                                        if (args.length > 1) {
                                          params = args[1];
                                        }
                                        log.debug("path: $path");
                                        log.debug("params: $params");
                                        if (path != null) {
                                          if ([
                                            'profile',
                                            'devices',
                                            'assets',
                                            'dashboards',
                                            'customers',
                                            'auditLogs'
                                          ].contains(path)) {
                                            var targetPath = '/$path';
                                            if (path == 'devices' && widget._home != true) {
                                              targetPath = '/devicesPage';
                                            }
                                            navigateTo(targetPath);
                                          }
                                        }
                                      }
                                    });
                                    webViewController.addJavaScriptHandler(handlerName: "tbMobileHandler", callback: (args) async {
                                      log.debug("Invoked tbMobileHandler: $args");
                                      return await widgetActionHandler.handleWidgetMobileAction(args, webViewController);
                                    });
                                  },
                                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                                    var uri = navigationAction.request.url!;
                                    var uriString = uri.toString();
                                    log.debug('shouldOverrideUrlLoading $uriString');
                                    if (![
                                      "http",
                                      "https",
                                      "file",
                                      "chrome",
                                      "data",
                                      "javascript",
                                      "about"
                                    ].contains(uri.scheme)) {
                                      if (await canLaunch(uriString)) {
                                        // Launch the App
                                        await launch(
                                          uriString,
                                        );
                                        // and cancel the request
                                        return NavigationActionPolicy.CANCEL;
                                      }
                                    }

                                    return Platform.isIOS ? NavigationActionPolicy.ALLOW : NavigationActionPolicy.CANCEL;
                                  },
                                  onUpdateVisitedHistory: (controller, url, androidIsReload) async {
                                    log.debug('onUpdateVisitedHistory: url');
                                    _dashboardController.onHistoryUpdated(controller.canGoBack());
                                  },
                                  onConsoleMessage: (controller, consoleMessage) {
                                    log.debug('[JavaScript console] ${consoleMessage.messageLevel}: ${consoleMessage.message}');
                                  },
                                  onLoadStart: (controller, url) async {
                                    log.debug('onLoadStart: $url');
                                  },
                                  onLoadStop: (controller, url) async {
                                    log.debug('onLoadStop: $url');
                                    if (webViewLoading) {
                                      webViewLoading = false;
                                      _controller.complete(controller);
                                    }
                                  },
                                  androidOnPermissionRequest: (controller, origin, resources) async {
                                    log.debug('androidOnPermissionRequest origin: $origin, resources: $resources');
                                    return PermissionRequestResponse(
                                        resources: resources,
                                        action: PermissionRequestResponseAction.GRANT);
                                  },
                                ),
                                ValueListenableBuilder(
                                    valueListenable: dashboardLoading,
                                    builder: (BuildContext context, bool loading, child) {
                                      if (!loading) {
                                        return SizedBox.shrink();
                                      } else {
                                        var data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
                                        var bottomPadding = data.padding.top;
                                        if (widget._home != true) {
                                          bottomPadding += kToolbarHeight;
                                        }
                                        return Container(
                                          padding: EdgeInsets.only(bottom: bottomPadding),
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          child: TbProgressIndicator(
                                              size: 50.0
                                          ),
                                        );
                                      }
                                    }
                                )
                              ]
                          )
                      ),
                    );
                  }
                }
            )
    );
  }
}
