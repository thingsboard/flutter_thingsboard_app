import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardWidget extends TbContextWidget {
  DashboardWidget(
    super.tbContext, {
    required this.controllerCallback,
    this.pageController,
    this.home,
    this.titleCallback,
    super.key,
  });

  final DashboardControllerCallback controllerCallback;
  final DashboardPageController? pageController;
  final bool? home;
  final DashboardTitleCallback? titleCallback;

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends TbContextState<DashboardWidget> {
  bool webViewLoading = true;
  final dashboardLoading = ValueNotifier<bool>(true);

  late final DashboardController dashboardController;
  late final TbLogger log;
  late WebUri _initialUrl;

  final settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    javaScriptEnabled: true,
    cacheEnabled: true,
    supportZoom: false,
    clearCache: true,
    useHybridComposition: true,
    thirdPartyCookiesEnabled: true,
    allowsInlineMediaPlayback: true,
    allowsBackForwardNavigationGestures: false,
  );

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isWeb) {
      return const Center(child: Text('Not implemented!'));
    }

    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: _initialUrl),
          initialSettings: settings,
          onWebViewCreated: (webViewController) {
            log.debug('onWebViewCreated');
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileReadyHandler',
              callback: (_) async {
                log.debug('Invoked tbMobileReadyHandler');

                dashboardController.setWebViewController(webViewController);
                widget.controllerCallback(
                  dashboardController,
                  dashboardLoading,
                );
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileDashboardLoadedHandler',
              callback: (args) async {
                bool hasRightLayout = args[0];
                bool rightLayoutOpened = args[1];
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
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileDashboardLayoutHandler',
              callback: (args) async {
                bool rightLayoutOpened = args[0];
                log.debug(
                  'Invoked tbMobileDashboardLayoutHandler: '
                  'rightLayoutOpened: $rightLayoutOpened',
                );
                dashboardController.onRightLayoutOpened(rightLayoutOpened);
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileDashboardStateNameHandler',
              callback: (args) async {
                log.debug(
                  'Invoked tbMobileDashboardStateNameHandler: $args',
                );
                if (args.isNotEmpty && args[0] is String) {
                  if (widget.titleCallback != null) {
                    widget.titleCallback!(args[0]);
                  }
                }
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileNavigationHandler',
              callback: (args) async {
                log.debug(
                  'Invoked tbMobileNavigationHandler: $args',
                );
                if (args.isNotEmpty) {
                  late String path;

                  if (args.first.contains('.')) {
                    path =
                        '/${args.first.split('.').first}/${args.first.split('.').last}';
                  } else {
                    path = '/${args.first}';
                  }

                  Map<String, dynamic>? params;
                  if (args.length > 1) {
                    params = args[1];
                  }

                  log.debug('path: $path');
                  log.debug('params: $params');
                  try {
                    await dashboardController.tryLocalNavigation(
                      path,
                      home: widget.home,
                    );
                  } on UnimplementedError catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        _buildWarnSnackBar(e.message!),
                      );
                    }
                  }
                }
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileHandler',
              callback: (args) async {
                log.debug('Invoked tbMobileHandler: $args');
                return await widget.tbContext.widgetActionHandler
                    .handleWidgetMobileAction(
                  args,
                  webViewController,
                );
              },
            );
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url!;
            final uriString = uri.toString();
            final endpoint = await getIt<IEndpointService>().getEndpoint();

            log.debug('shouldOverrideUrlLoading $uriString');
            if (Platform.isAndroid ||
                Platform.isIOS &&
                    navigationAction.navigationType ==
                        NavigationType.LINK_ACTIVATED) {
              if (uriString.startsWith(endpoint)) {
                var target = uriString.substring(endpoint.length);
                if (!target.startsWith('?accessToken')) {
                  if (target.startsWith('/')) {
                    target = target.substring(1);
                  }
                  try {
                    await dashboardController.tryLocalNavigation(
                      target,
                      home: widget.home,
                    );
                  } on UnimplementedError catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        _buildWarnSnackBar(e.message!),
                      );
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
          onUpdateVisitedHistory: (controller, url, androidIsReload) async {
            log.debug('onUpdateVisitedHistory: $url');
            dashboardController.onHistoryUpdated(controller.canGoBack());
          },
          onConsoleMessage: (controller, consoleMessage) {
            log.debug(
              '[JavaScript console] ${consoleMessage.messageLevel}: '
              '${consoleMessage.message}',
            );
          },
          onLoadStart: (controller, url) async {
            log.debug('onLoadStart: $url');
          },
          onLoadStop: (controller, url) async {
            log.debug('onLoadStop: $url');
            if (webViewLoading) {
              webViewLoading = false;
            }
          },
          onPermissionRequest: (controller, request) async {
            log.debug(
              'onPermissionRequest resources: ${request.resources}',
            );

            return PermissionResponse(
              action: PermissionResponseAction.GRANT,
              resources: request.resources,
            );
          },
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

    _initialUrl = WebUri(
      '${getIt<IEndpointService>().getCachedEndpoint()}'
      '?accessToken=${widget.tbContext.tbClient.getJwtToken()!}'
      '&refreshToken=${widget.tbContext.tbClient.getRefreshToken()!}',
    );

    dashboardController = DashboardController(widget.tbContext);
    log = widget.tbContext.log;
  }

  @override
  void dispose() {
    dashboardLoading.dispose();
    dashboardController.dispose();
    super.dispose();
  }

  SnackBar _buildWarnSnackBar(String message) {
    return SnackBar(
      duration: const Duration(seconds: 10),
      backgroundColor: const Color(0xFFdc6d1b),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
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
