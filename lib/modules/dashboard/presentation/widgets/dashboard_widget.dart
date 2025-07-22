import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/export_module.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_action_handler.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardWidget extends TbContextWidget {
  DashboardWidget(
    super.tbContext, {
    required this.controllerCallback,
    this.pageController,
    this.onUrlChanged,
    this.home,
    this.titleCallback,
    super.key,
  });

  final DashboardControllerCallback controllerCallback;
  final DashboardPageController? pageController;
  final bool? home;
  final VoidCallback? onUrlChanged;
  final DashboardTitleCallback? titleCallback;

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends TbContextState<DashboardWidget> {
  bool webViewLoading = true;
  final dashboardLoading = ValueNotifier<bool>(true);

  late final DashboardController dashboardController;
  late WebUri _initialUrl;
  final _exportModule = TbDashboardExportModule();
  final settings = InAppWebViewSettings(
    isInspectable: kDebugMode || EnvironmentVariables.verbose,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    supportZoom: false,
    clearCache: true,
    allowsInlineMediaPlayback: true,
    allowsBackForwardNavigationGestures: false,
  );

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isWeb) {
      return  Center(child: Text(S.of(context).notImplemented));
    }

    return Stack(
      children: [
        InAppWebView(
          onDownloadStartRequest: _exportModule.onDownloadStartRequest,
          initialUrlRequest: URLRequest(url: _initialUrl),
          initialSettings: settings,
          onWebViewCreated: _onWebViewCreated,
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url!;
            final uriString = uri.toString();
            final endpoint = await getIt<IEndpointService>().getEndpoint();
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        _buildWarnSnackBar(e),
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
          onUpdateVisitedHistory: (controller, url, androidIsReload)  {
            // translate-me-ignore-next-line
            log.debug('onUpdateVisitedHistory: $url');
            dashboardController.onHistoryUpdated(controller.canGoBack());
            widget.onUrlChanged?.call();
          },
          onConsoleMessage: (controller, consoleMessage) {
            log.debug(
              // translate-me-ignore-next-line
              '[JavaScript console] ${consoleMessage.messageLevel}: '
              '${consoleMessage.message}',
            );
          },
          onLoadStart: (controller, url)  {
            // translate-me-ignore-next-line
            log.debug('onLoadStart: $url');
          },
          onLoadStop: (controller, url)  {
            // translate-me-ignore-next-line
            log.debug('onLoadStop: $url');
            if (webViewLoading) {
              webViewLoading = false;
            }
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
          onPermissionRequest: (controller, request) async {
            log.debug(
              // translate-me-ignore-next-line
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
  }

  @override
  void dispose() {
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
    _injectTbMobileDashboardLayoutHandler(webViewController);
    _injectTbMobileDashboardStateNameHandler(webViewController);
    _injectTbMobileNavigationHandler(webViewController);
    _injectTbMobileHandler(webViewController);
  }

  void _injectTbMobileHandler(InAppWebViewController webViewController) {
    webViewController.addJavaScriptHandler(
      handlerName: 'tbMobileHandler',
      callback: (args) async {
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
      callback: (args) async {
        log.debug(
          'Invoked tbMobileNavigationHandler: $args',
        );
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
              ScaffoldMessenger.of(context).showSnackBar(
                _buildWarnSnackBar(e),
              );
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
      callback: (args)  {
        log.debug(
          'Invoked tbMobileDashboardStateNameHandler: $args',
        );
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
      callback: (args)  {
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
      callback: (args)  {
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
      callback: (_)  {
        log.debug('Invoked tbMobileReadyHandler');

        dashboardController.setWebViewController(webViewController);
        widget.controllerCallback(
          dashboardController,
          dashboardLoading,
        );
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
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
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
