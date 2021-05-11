import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/constants/api_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:url_launcher/url_launcher.dart';

typedef DashboardTitleCallback = void Function(String title);

class Dashboard extends TbContextWidget<Dashboard, _DashboardState> {

  final String _dashboardId;
  final String? _state;
  final bool? _home;
  final bool? _hideToolbar;
  final bool _fullscreen;
  final DashboardTitleCallback? _titleCallback;

  Dashboard(TbContext tbContext, {required String dashboardId, required bool fullscreen,
                                  DashboardTitleCallback? titleCallback, String? state, bool? home,
                                  bool? hideToolbar}):
        this._dashboardId = dashboardId,
        this._fullscreen = fullscreen,
        this._titleCallback = titleCallback,
        this._state = state,
        this._home = home,
        this._hideToolbar = hideToolbar,
        super(tbContext);

  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends TbContextState<Dashboard, _DashboardState> {

  final Completer<InAppWebViewController> _controller = Completer<InAppWebViewController>();

  final ValueNotifier<bool> webViewLoading = ValueNotifier(true);

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        javaScriptEnabled: true,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: false,
        thirdPartyCookiesEnabled: true
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late String _dashboardUrl;
  late String _currentDashboardId;
  late String? _currentDashboardState;

  @override
  void initState() {
    super.initState();
    _dashboardUrl = thingsBoardApiEndpoint + '/dashboard/' + widget._dashboardId;
    List<String> params = [];
    if (widget._state != null) {
      params.add('state=${widget._state}');
    }
    if (widget._home == true) {
      params.add('embedded=true');
    }
    if (widget._hideToolbar == true) {
      params.add('hideToolbar=true');
    }
    if (params.isNotEmpty) {
      _dashboardUrl += '?${params.join('&')}';
    }
    _currentDashboardId = widget._dashboardId;
    _currentDashboardState = widget._state;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
            onWillPop: () async {
              var controller = await _controller.future;
              if (await controller.canGoBack()) {
                await controller.goBack();
                return false;
              }
              return true;
            },
            child: Stack(
              children: [
                InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: Uri.parse(_dashboardUrl)),
                    initialOptions: options,
                    onWebViewCreated: (webViewController) {
                      webViewController.addJavaScriptHandler(handlerName: "tbMobileDashboardStateNameHandler", callback: (args) async {
                        log.debug("Invoked tbMobileDashboardStateNameHandler: $args");
                        webViewLoading.value = false;
                        if (args.isNotEmpty && args[0] is String) {
                          if (widget._titleCallback != null) {
                            widget._titleCallback!(args[0]);
                          }
                        }
                      });
                      webViewController.addJavaScriptHandler(handlerName: "tbMobileHandler", callback: (args) async {
                        log.debug("Invoked tbMobileHandler: $args");
                        return await widgetActionHandler.handleWidgetMobileAction(args, webViewController);
                      });
                      _controller.complete(webViewController);
                    },
                    shouldOverrideUrlLoading: (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;
                      var uriString = uri.toString();
                      log.debug('disallowing navigation to $uriString');
                      if (!uriString.startsWith(thingsBoardApiEndpoint) && await canLaunch(uriString)) {
                        await launch(uriString);
                      }
                      return NavigationActionPolicy.CANCEL;
                    },
                    onUpdateVisitedHistory: (controller, url, androidIsReload) async {
                      if (url != null) {
                        String newStateId = url.pathSegments.last;
                        log.debug('onUpdateVisitedHistory: $newStateId');
                        if (newStateId == 'profile') {
                          webViewLoading.value = true;
                          await controller.goBack();
                          await navigateTo('/profile');
                          webViewLoading.value = false;
                          return;
                        } else if (newStateId == 'login') {
                          webViewLoading.value = true;
                          await controller.pauseTimers();
                          await controller.stopLoading();
                          await tbClient.logout();
                          return;
                        } else if (['devices', 'assets', 'dashboards'].contains(newStateId)) {
                          var controller = await _controller.future;
                          await controller.goBack();
                          navigateTo('/$newStateId');
                          return;
                        } else {
                          if (url.pathSegments.length > 1) {
                            var segmentName = url.pathSegments[url.pathSegments.length-2];
                            if (segmentName == 'dashboards' && widget._home != true) {
                              webViewLoading.value = true;
                              var targetPath = _createDashboardNavigationPath(newStateId, fullscreen: widget._fullscreen);
                              await navigateTo(targetPath, replace: true);
                              return;
                            } else if (segmentName == 'dashboard') {
                              _currentDashboardId = newStateId;
                              _currentDashboardState = url.queryParameters['state'];
                              return;
                            }
                          }
                          webViewLoading.value = true;
                          if (widget._home == true) {
                            await navigateTo('/home', replace: true);
                          } else {
                            var targetPath = _createDashboardNavigationPath(_currentDashboardId, state: _currentDashboardState, fullscreen: widget._fullscreen);
                            await navigateTo(targetPath, replace: true);
                          }
                        }
                      }
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      log.debug('[JavaScript console] ${consoleMessage.messageLevel}: ${consoleMessage.message}');
                    },
                    onLoadStart: (controller, url) async {
                      log.debug('onLoadStart: $url');
                      await _setTokens(controller.webStorage.localStorage);
                    },
                    onLoadStop: (controller, url) {
                    },

                ),
                ValueListenableBuilder(
                    valueListenable: webViewLoading,
                    builder: (BuildContext context, bool loading, child) {
                      if (!loading) {
                        return SizedBox.shrink();
                      } else {
                        return Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: CircularProgressIndicator()
                          ),
                        );
                      }
                    }
                )
              ],
            )
    );
  }

  String _createDashboardNavigationPath(String dashboardId, {bool? fullscreen, String? state}) {
    var targetPath = '/dashboard/$dashboardId';
    List<String> params = [];
    if (state != null) {
      params.add('state=$state');
    }
    if (fullscreen != null) {
      params.add('fullscreen=$fullscreen');
    }
    if (params.isNotEmpty) {
      targetPath += '?${params.join('&')}';
    }
    return targetPath;
  }

  Future<void> _setTokens(Storage storage) async {
    String jwtToken = tbClient.getJwtToken()!;
    int jwtTokenExpiration = _getClientExpiration(jwtToken);
    String refreshToken = tbClient.getRefreshToken()!;
    int refreshTokenExpiration = _getClientExpiration(refreshToken);
    await storage.setItem(key: 'jwt_token', value: jwtToken);
    await storage.setItem(key: 'jwt_token_expiration', value: jwtTokenExpiration);
    await storage.setItem(key: 'refresh_token', value: refreshToken);
    await storage.setItem(key: 'refresh_token_expiration', value: refreshTokenExpiration);
  }

/*  String _setTokensJavaScript() {
    String jwtToken = tbClient.getJwtToken()!;
    int jwtTokenExpiration = _getClientExpiration(jwtToken);
    String refreshToken = tbClient.getRefreshToken()!;
    int refreshTokenExpiration = _getClientExpiration(refreshToken);
    return "window.localStorage.setItem('jwt_token','$jwtToken');\n"+
           "window.localStorage.setItem('jwt_token_expiration','$jwtTokenExpiration');\n"+
           "window.localStorage.setItem('refresh_token','$refreshToken');\n"+
           "window.localStorage.setItem('refresh_token_expiration','$refreshTokenExpiration');";
  } */

  int _getClientExpiration(String token) {
    var decodedToken = JwtDecoder.decode(tbClient.getJwtToken()!);
    int issuedAt = decodedToken['iat'];
    int expTime = decodedToken['exp'];
    int ttl = expTime - issuedAt;
    int clientExpiration = DateTime.now().millisecondsSinceEpoch + ttl * 1000;
    return clientExpiration;
  }

}
