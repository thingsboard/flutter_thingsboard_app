import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_app/widgets/two_value_listenable_builder.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardController {
  final ValueNotifier<bool> canGoBack = ValueNotifier(false);
  final ValueNotifier<bool> hasRightLayout = ValueNotifier(false);
  final ValueNotifier<bool> rightLayoutOpened = ValueNotifier(false);

  final _DashboardState dashboardState;

  DashboardController(this.dashboardState);

  Future<void> openDashboard(String dashboardId,
      {String? state, bool? hideToolbar, bool fullscreen = false}) async {
    return await dashboardState._openDashboard(dashboardId,
        state: state, hideToolbar: hideToolbar, fullscreen: fullscreen);
  }

  Future<bool> goBack() async {
    return dashboardState._goBack();
  }

  onHistoryUpdated(Future<bool> canGoBackFuture) async {
    canGoBack.value = await canGoBackFuture;
  }

  onHasRightLayout(bool _hasRightLayout) {
    hasRightLayout.value = _hasRightLayout;
  }

  onRightLayoutOpened(bool _rightLayoutOpened) {
    rightLayoutOpened.value = _rightLayoutOpened;
  }

  Future<void> toggleRightLayout() async {
    await dashboardState._toggleRightLayout();
  }

  Future<void> activateDashboard() async {
    await dashboardState._activateDashboard();
  }

  Future<void> deactivateDashboard() async {
    await dashboardState._deactivateDashboard();
  }

  dispose() {
    canGoBack.dispose();
    hasRightLayout.dispose();
    rightLayoutOpened.dispose();
  }
}

typedef DashboardTitleCallback = void Function(String title);

typedef DashboardControllerCallback = void Function(
    DashboardController controller);

class Dashboard extends TbContextWidget {
  final bool? _home;
  final bool _activeByDefault;
  final DashboardTitleCallback? _titleCallback;
  final DashboardControllerCallback? _controllerCallback;

  Dashboard(TbContext tbContext,
      {Key? key,
      bool? home,
      bool activeByDefault = true,
      DashboardTitleCallback? titleCallback,
      DashboardControllerCallback? controllerCallback})
      : this._home = home,
        this._activeByDefault = activeByDefault,
        this._titleCallback = titleCallback,
        this._controllerCallback = controllerCallback,
        super(tbContext, key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends TbContextState<Dashboard> {
  final _controller = Completer<InAppWebViewController>();

  bool webViewLoading = true;
  final dashboardLoading = ValueNotifier<bool>(true);
  final dashboardActive = ValueNotifier<bool>(true);
  final readyState = ValueNotifier<bool>(false);

  final webViewKey = GlobalKey();

  late final DashboardController _dashboardController;

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
      useHybridComposition: true,
      thirdPartyCookiesEnabled: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
      allowsBackForwardNavigationGestures: false,
    ),
  );

  late Uri _initialUrl;

  @override
  void initState() {
    super.initState();
    dashboardActive.value = widget._activeByDefault;
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
        _initialUrl = WebUri(
          await getIt<IEndpointService>().getEndpoint() +
              '?accessToken=${tbClient.getJwtToken()!}&refreshToken=${tbClient.getRefreshToken()!}',
        );

        readyState.value = true;
      } else {
        var windowMessage = <String, dynamic>{
          'type': 'reloadUserMessage',
          'data': <String, dynamic>{
            'accessToken': tbClient.getJwtToken()!,
            'refreshToken': tbClient.getRefreshToken()!
          }
        };
        if (!UniversalPlatform.isWeb) {
          var controller = await _controller.future;
          await controller.postWebMessage(
              message: WebMessage(data: jsonEncode(windowMessage)),
              targetOrigin: WebUri('*'));
        }
      }
    }
  }

  Future<bool> _goBack() async {
    if (!UniversalPlatform.isWeb) {
      if (_dashboardController.rightLayoutOpened.value) {
        await _toggleRightLayout();
        return false;
      }
      var controller = await _controller.future;
      if (await controller.canGoBack()) {
        await controller.goBack();
        return false;
      }
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

  Future<void> _activateDashboard() async {
    if (!dashboardActive.value) {
      dashboardActive.value = true;
    }
  }

  Future<void> _deactivateDashboard() async {
    if (dashboardActive.value) {
      dashboardActive.value = false;
    }
  }

  Future<void> _openDashboard(String dashboardId,
      {String? state, bool? hideToolbar, bool fullscreen = false}) async {
    dashboardLoading.value = true;
    InAppWebViewController? controller;
    if (!UniversalPlatform.isWeb) {
      controller = await _controller.future;
    }
    var windowMessage = <String, dynamic>{
      'type': 'openDashboardMessage',
      'data': <String, dynamic>{'dashboardId': dashboardId}
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
    if (!UniversalPlatform.isWeb) {
      await controller!
          .postWebMessage(message: webMessage, targetOrigin: WebUri('*'));
    }
  }

  Future<void> _toggleRightLayout() async {
    var controller = await _controller.future;
    var windowMessage = <String, dynamic>{'type': 'toggleDashboardLayout'};
    var webMessage = WebMessage(data: jsonEncode(windowMessage));
    await controller.postWebMessage(
        message: webMessage, targetOrigin: WebUri('*'));
  }

  Future<void> tryLocalNavigation(String? path) async {
    log.debug("path: $path");
    if (path != null && path != '/home') {
      final parts = path.split("/");
      if ([
        'profile',
        'devices',
        'assets',
        'dashboards',
        'dashboard',
        'customers',
        'auditLogs',
        'deviceGroups',
        'assetGroups',
        'customerGroups',
        'dashboardGroups',
        'alarms',
      ].contains(parts[1])) {
        var firstPart = parts[1];
        if (firstPart.endsWith('Groups')) {
          firstPart = firstPart.replaceFirst('Groups', 's');
        }

        if ((firstPart == 'dashboard' || firstPart == 'dashboards') &&
            parts.length > 1) {
          final dashboardId = parts[1];
          await navigateToDashboard(dashboardId);
        } else if (firstPart != 'dashboard') {
          var targetPath = '/$firstPart';
          if (firstPart == 'devices' && widget._home != true) {
            targetPath = '/devicesPage';
          }

          await navigateTo(targetPath);
        }
      } else {
        throw UnimplementedError('The path $path is currently not supported.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget._home == true && !tbContext.isHomePage()) {
          return true;
        }
        if (readyState.value) {
          return await _goBack();
        } else {
          return true;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: readyState,
        builder: (BuildContext context, bool ready, child) {
          if (!ready) {
            return SizedBox.shrink();
          } else {
            return Stack(
              children: [
                UniversalPlatform.isWeb
                    ? Center(child: Text('Not implemented!'))
                    : InAppWebView(
                        key: webViewKey,
                        initialUrlRequest: URLRequest(url: WebUri.uri(_initialUrl)),
                        initialOptions: options,
                        onWebViewCreated: (webViewController) {
                          log.debug("onWebViewCreated");
                          webViewController.addJavaScriptHandler(
                            handlerName: "tbMobileDashboardLoadedHandler",
                            callback: (args) async {
                              bool hasRightLayout = args[0];
                              bool rightLayoutOpened = args[1];
                              log.debug(
                                  "Invoked tbMobileDashboardLoadedHandler: hasRightLayout: $hasRightLayout, rightLayoutOpened: $rightLayoutOpened");
                              _dashboardController
                                  .onHasRightLayout(hasRightLayout);
                              _dashboardController
                                  .onRightLayoutOpened(rightLayoutOpened);
                              dashboardLoading.value = false;
                            },
                          );
                          webViewController.addJavaScriptHandler(
                            handlerName: "tbMobileDashboardLayoutHandler",
                            callback: (args) async {
                              bool rightLayoutOpened = args[0];
                              log.debug(
                                  "Invoked tbMobileDashboardLayoutHandler: rightLayoutOpened: $rightLayoutOpened");
                              _dashboardController
                                  .onRightLayoutOpened(rightLayoutOpened);
                            },
                          );
                          webViewController.addJavaScriptHandler(
                            handlerName: "tbMobileDashboardStateNameHandler",
                            callback: (args) async {
                              log.debug(
                                  "Invoked tbMobileDashboardStateNameHandler: $args");
                              if (args.isNotEmpty && args[0] is String) {
                                if (widget._titleCallback != null) {
                                  widget._titleCallback!(args[0]);
                                }
                              }
                            },
                          );
                          webViewController.addJavaScriptHandler(
                            handlerName: "tbMobileNavigationHandler",
                            callback: (args) async {
                              log.debug(
                                "Invoked tbMobileNavigationHandler: $args",
                              );
                              if (args.isNotEmpty) {
                                late String path;

                                if (args.first.contains('.')) {
                                  path = '/${args.first.split('.').last}';
                                } else {
                                  path = '/${args.first}';
                                }

                                Map<String, dynamic>? params;
                                if (args.length > 1) {
                                  params = args[1];
                                }

                                log.debug("path: $path");
                                log.debug("params: $params");
                                try {
                                  await tryLocalNavigation(path);
                                } on UnimplementedError catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    _buildWarnSnackBar(e.message!),
                                  );
                                }
                              }
                            },
                          );
                          webViewController.addJavaScriptHandler(
                            handlerName: "tbMobileHandler",
                            callback: (args) async {
                              log.debug("Invoked tbMobileHandler: $args");
                              return await widgetActionHandler
                                  .handleWidgetMobileAction(
                                args,
                                webViewController,
                              );
                            },
                          );
                        },
                        shouldOverrideUrlLoading:
                            (controller, navigationAction) async {
                          final uri = navigationAction.request.url!;
                          final uriString = uri.toString();
                          final endpoint =
                              await getIt<IEndpointService>().getEndpoint();

                          log.debug('shouldOverrideUrlLoading $uriString');
                          if (Platform.isAndroid ||
                              Platform.isIOS &&
                                  navigationAction.iosWKNavigationType ==
                                      IOSWKNavigationType.LINK_ACTIVATED) {
                            if (uriString.startsWith(endpoint)) {
                              var target = uriString.substring(endpoint.length);
                              if (!target.startsWith("?accessToken")) {
                                if (target.startsWith("/")) {
                                  target = target.substring(1);
                                }
                                try {
                                  await tryLocalNavigation(target);
                                } on UnimplementedError catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    _buildWarnSnackBar(e.message!),
                                  );
                                }
                                return NavigationActionPolicy.CANCEL;
                              }
                            } else if (await canLaunchUrlString(uriString)) {
                              await launchUrlString(
                                uriString,
                              );
                              return NavigationActionPolicy.CANCEL;
                            }
                          }
                          return Platform.isIOS
                              ? NavigationActionPolicy.ALLOW
                              : NavigationActionPolicy.CANCEL;
                        },
                        onUpdateVisitedHistory:
                            (controller, url, androidIsReload) async {
                          log.debug('onUpdateVisitedHistory: $url');
                          _dashboardController
                              .onHistoryUpdated(controller.canGoBack());
                        },
                        onConsoleMessage: (controller, consoleMessage) {
                          log.debug(
                              '[JavaScript console] ${consoleMessage.messageLevel}: ${consoleMessage.message}');
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
                        androidOnPermissionRequest:
                            (controller, origin, resources) async {
                          log.debug(
                              'androidOnPermissionRequest origin: $origin, resources: $resources');
                          return PermissionRequestResponse(
                              resources: resources,
                              action: PermissionRequestResponseAction.GRANT);
                        },
                      ),
                if (!UniversalPlatform.isWeb)
                  TwoValueListenableBuilder(
                    firstValueListenable: dashboardLoading,
                    secondValueListenable: dashboardActive,
                    builder: (context, loading, active, child) {
                      if (!loading && active) {
                        return SizedBox.shrink();
                      } else {
                        var data = MediaQuery.of(context);
                        var bottomPadding = data.padding.top;
                        if (widget._home != true) {
                          bottomPadding += kToolbarHeight;
                        }
                        return Container(
                          padding: EdgeInsets.only(bottom: bottomPadding),
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: TbProgressIndicator(size: 50.0),
                        );
                      }
                    },
                  )
              ],
            );
          }
        },
      ),
    );
  }

  SnackBar _buildWarnSnackBar(String message) {
    return SnackBar(
      duration: const Duration(seconds: 10),
      backgroundColor: Color(0xFFdc6d1b),
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
