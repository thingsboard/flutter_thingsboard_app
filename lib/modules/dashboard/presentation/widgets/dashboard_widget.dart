// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_action_handler.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_load_error_script.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/export_module.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/ui/web_view_permissions.dart';
import 'package:thingsboard_app/utils/ui/web_view_reopen_policy.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    required this.controllerCallback,
    this.onUrlChanged,
    this.home,
    this.titleCallback,
    super.key,
  });

  final DashboardControllerCallback controllerCallback;
  final bool? home;
  final VoidCallback? onUrlChanged;
  final DashboardTitleCallback? titleCallback;

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardWidget> {
  late final Future<void> _cacheCleared =
      InAppWebViewController.clearAllCache();

  final dashboardLoading = ValueNotifier<bool>(true);
  final TbLogger log = getIt();
  final ThingsboardClient client = getIt<ITbClientService>().client;
  late final DashboardController dashboardController;
  late WebUri _initialUrl;
  Key _webViewKey = UniqueKey();

  /// The page the web view shows; its dashboard state is kept when the web
  /// view reopens after its process is gone.
  WebUri? _currentUrl;

  /// Set while a reopened web view starts; sent once the web app is ready.
  ({bool openDashboard, String? state})? _pendingReopen;
  bool _controllerCallbackRan = false;
  late final WebViewReopenPolicy _reopenPolicy;
  final _exportModule = TbDashboardExportModule();
  final settings = InAppWebViewSettings(
    isInspectable: kDebugMode || EnvironmentVariables.verbose,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    supportZoom: false,
    allowsInlineMediaPlayback: true,
    allowsBackForwardNavigationGestures: false,
    // Android defaults to 8px, so TB widgets that shrink text in an unbounded
    // loop (LED indicator, knob, round switch) never exit and freeze the page.
    minimumFontSize: 0,
    useOnRenderProcessGone: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<void>(
          future: _cacheCleared,
          // Load the dashboard only after the cache is cleared; a failed
          // clear still lets it start.
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
              ? InAppWebView(
                  key: _webViewKey,
                  onDownloadStarting: _exportModule.onDownloadStarting,
                  initialUserScripts: UnmodifiableListView(
                    dashboardUserScripts(defaultTargetPlatform),
                  ),
                  initialUrlRequest: URLRequest(url: _initialUrl),
                  initialSettings: settings,
                  onWebViewCreated: _onWebViewCreated,
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                        final uri = navigationAction.request.url!;
                        final uriString = uri.toString();
                        final endpoint = await getIt<IEndpointService>()
                            .getEndpoint();
                        widget.onUrlChanged?.call();
                        // translate-me-ignore-next-line
                        log.debug('shouldOverrideUrlLoading $uriString');
                        if (Platform.isAndroid ||
                            Platform.isIOS &&
                                navigationAction.navigationType ==
                                    NavigationType.LINK_ACTIVATED) {
                          if (uriString.startsWith(endpoint)) {
                            var target = uriString.substring(endpoint.length);
                            // translate-me-ignore-next-line
                            if (!target.startsWith('?accessToken')) {
                              if (target.startsWith('/')) {
                                target = target.substring(1);
                              }
                              try {
                                await dashboardController.tryLocalNavigation(
                                  target,
                                  home: widget.home,
                                );
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_buildWarnSnackBar(e));
                                }
                              }
                              return NavigationActionPolicy.CANCEL;
                            }
                          } else if (await canLaunchUrlString(uriString)) {
                            await launchUrlString(uriString);
                            return NavigationActionPolicy.CANCEL;
                          }
                        }

                        return Platform.isIOS
                            ? NavigationActionPolicy.ALLOW
                            : NavigationActionPolicy.CANCEL;
                      },
                  onUpdateVisitedHistory: (controller, url, androidIsReload) {
                    // translate-me-ignore-next-line
                    log.debug('onUpdateVisitedHistory: $url');
                    _currentUrl = url;
                    dashboardController.onHistoryUpdated(
                      controller.canGoBack(),
                    );
                    widget.onUrlChanged?.call();
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    log.debug(
                      // translate-me-ignore-next-line
                      '[JavaScript console] ${consoleMessage.messageLevel}: '
                      '${consoleMessage.message}',
                    );
                  },
                  onLoadStart: (controller, url) {
                    // translate-me-ignore-next-line
                    log.debug('onLoadStart: $url');
                  },
                  onLoadStop: (controller, url) {
                    // translate-me-ignore-next-line
                    log.debug('onLoadStop: $url');
                  },
                  onReceivedHttpError: (ctrl, req, errResponse) {
                    log.debug(
                      // translate-me-ignore-next-line
                      'onReceivedHttpError request: $req, response: $errResponse',
                    );

                    if (dashboardLoading.value &&
                        req.url.path.contains('/dashboard/')) {
                      dashboardLoading.value = false;
                    }
                  },
                  onWebContentProcessDidTerminate: (_) => _onProcessGone(),
                  onRenderProcessGone: (_, _) => _onProcessGone(),
                  onPermissionRequest: (controller, request) {
                    log.debug(
                      // translate-me-ignore-next-line
                      'onPermissionRequest resources: ${request.resources}',
                    );

                    return endpointOnlyPermission(
                      request,
                      getIt<IEndpointService>().getCachedEndpoint(),
                    );
                  },
                )
              : const SizedBox.shrink(),
        ),
        ValueListenableBuilder(
          valueListenable: dashboardLoading,
          builder: (context, loading, child) {
            if (!loading) {
              return const SizedBox.shrink();
            } else {
              final data = MediaQuery.of(context);
              var bottomPadding = data.padding.top;
              if (widget.home != true) {
                bottomPadding += kToolbarHeight;
              }

              return Container(
                padding: EdgeInsets.only(bottom: bottomPadding),
                alignment: Alignment.center,
                color: Colors.white,
                child: const TbProgressIndicator(size: 50.0),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _initialUrl = _signedInUrl(client.getJwtToken()!);

    dashboardController = DashboardController();
    _reopenPolicy = WebViewReopenPolicy(onReopen: _reopenPage);
  }

  WebUri _signedInUrl(String token) => WebUri(
    '${getIt<IEndpointService>().getCachedEndpoint()}'
    '?accessToken=$token'
    '&refreshToken=${client.getRefreshToken()!}',
  );

  /// See [WebViewReopenPolicy].
  void _onProcessGone() {
    // translate-me-ignore-next-line
    log.debug('Dashboard web view process gone');
    _reopenPolicy.onProcessGone();
  }

  /// A new web view starts like the first one, with the current tokens (the
  /// ones it was opened with may have expired), and then opens the dashboard
  /// that was open, unless [reopen] is [WebViewReopen.withoutPage]. The web
  /// view also opens every other dashboard of the page, so it starts again
  /// even then.
  void _reopenPage(WebViewReopen reopen) {
    final token = client.getJwtToken();
    // translate-me-ignore-next-line
    log.debug('Dashboard web view reopening (${reopen.name}) $_currentUrl');
    if (!mounted || token == null) return;
    final openDashboard = reopen == WebViewReopen.page;
    setState(() {
      _pendingReopen = (
        openDashboard: openDashboard,
        state: _currentUrl?.queryParameters['state'],
      );
      _initialUrl = _signedInUrl(token);
      _webViewKey = UniqueKey();
    });
    // Before the first ready call the page has not opened anything yet: the
    // first load's spinner stays as it is.
    if (_controllerCallbackRan) {
      dashboardLoading.value =
          openDashboard && dashboardController.hasOpenedDashboard;
    }
  }

  @override
  void dispose() {
    _reopenPolicy.dispose();
    dashboardLoading.dispose();
    dashboardController.dispose();
    super.dispose();
  }

  Future<void> _onWebViewCreated(
    InAppWebViewController webViewController,
  ) async {
    log.debug('onWebViewCreated');
    _exportModule.injectFileDownloadHandler(webViewController);
    _injectTbMobileReadyHandler(webViewController);
    _injectTbMobileDashboardLoadedHandler(webViewController);
    webViewController.addJavaScriptHandler(
      handlerName: dashboardLoadErrorHandler,
      callback: (args) {
        // translate-me-ignore-next-line
        log.debug('Dashboard request failed: $args');
        dashboardLoading.value = false;
      },
    );
    _injectTbMobileDashboardLayoutHandler(webViewController);
    _injectTbMobileDashboardStateNameHandler(webViewController);
    _injectTbMobileNavigationHandler(webViewController);
    _injectTbMobileHandler(webViewController);
  }

  void _injectTbMobileHandler(InAppWebViewController webViewController) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileHandler',
      callback: (List<dynamic> args) async {
        log.debug('Invoked tbMobileHandler: $args');
        return await getIt<WidgetActionHandler>().handleWidgetMobileAction(
          args,
          webViewController,
        );
      },
    );
  }

  void _injectTbMobileNavigationHandler(
    InAppWebViewController webViewController,
  ) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileNavigationHandler',
      callback: (List<dynamic> args) async {
        log.debug('Invoked tbMobileNavigationHandler: $args');
        if (args.isNotEmpty) {
          late String path;
          final pathArg = args.first.toString();
          if (args.first.toString().contains('.')) {
            path = '/${pathArg.split('.').first}/${pathArg.split('.').last}';
          } else {
            path = '/${args.first}';
          }

          Map<String, dynamic>? params;
          if (args.length > 1) {
            params = args[1] as Map<String, dynamic>?;
          }

          log.debug('path: $path');
          log.debug('params: $params');
          try {
            await dashboardController.tryLocalNavigation(
              path,
              home: widget.home,
            );
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(_buildWarnSnackBar(e));
            }
          }
        }
      },
    );
  }

  void _injectTbMobileDashboardStateNameHandler(
    InAppWebViewController webViewController,
  ) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileDashboardStateNameHandler',
      callback: (List<dynamic> args) {
        log.debug('Invoked tbMobileDashboardStateNameHandler: $args');
        if (args.isNotEmpty && args[0] is String) {
          if (widget.titleCallback != null) {
            widget.titleCallback?.call(args[0].toString());
          }
        }
      },
    );
  }

  void _injectTbMobileDashboardLayoutHandler(
    InAppWebViewController webViewController,
  ) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileDashboardLayoutHandler',
      callback: (List<dynamic> args) {
        if (args.isEmpty) {
          return;
        }
        final bool rightLayoutOpened = bool.parse(args[0].toString());
        log.debug(
          'Invoked tbMobileDashboardLayoutHandler: '
          'rightLayoutOpened: $rightLayoutOpened',
        );
        dashboardController.onRightLayoutOpened(rightLayoutOpened);
      },
    );
  }

  void _injectTbMobileDashboardLoadedHandler(
    InAppWebViewController webViewController,
  ) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileDashboardLoadedHandler',
      callback: (List<dynamic> args) {
        if (args.length < 2) {
          return;
        }
        final bool hasRightLayout = bool.parse(args[0].toString());
        final bool rightLayoutOpened = bool.parse(args[1].toString());
        log.debug(
          'Invoked tbMobileDashboardLoadedHandler: '
          'hasRightLayout: $hasRightLayout, '
          'rightLayoutOpened: $rightLayoutOpened',
        );
        dashboardController.onHasRightLayout(hasRightLayout);
        dashboardController.onRightLayoutOpened(rightLayoutOpened);
        dashboardLoading.value = false;
      },
    );
  }

  void _injectTbMobileReadyHandler(InAppWebViewController webViewController) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileReadyHandler',
      callback: (_) {
        log.debug('Invoked tbMobileReadyHandler');

        dashboardController.setWebViewController(webViewController);
        final reopen = _pendingReopen;
        _pendingReopen = null;
        // controllerCallback already ran for this controller; calling it again
        // would add its listeners twice.
        if (reopen != null && _controllerCallbackRan) {
          if (reopen.openDashboard) {
            dashboardController.reopenDashboard(state: reopen.state);
          }
          return;
        }
        _controllerCallbackRan = true;
        widget.controllerCallback(dashboardController, dashboardLoading);
      },
    );
  }

  SnackBar _buildWarnSnackBar(Object error) {
    String errorMessage = 'Unexpected error';
    if (error is UnimplementedError) {
      errorMessage = error.message ?? '';
    }

    return SnackBar(
      duration: const Duration(seconds: 10),
      backgroundColor: const Color(0xFFdc6d1b),
      content: Text(errorMessage, style: const TextStyle(color: Colors.white)),
      action: SnackBarAction(
        label: S.of(context).close,
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
