import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';

class TbRecaptcha extends TbPageWidget {
  TbRecaptcha(
    super.tbContext, {
    required this.siteKey,
    required this.version,
    this.logActionName,
    super.key,
  });

  final String siteKey;
  final String version;
  final String? logActionName;

  @override
  State<StatefulWidget> createState() => _TbRecaptchaState();
}

class _TbRecaptchaState extends TbPageState<TbRecaptcha> {
  final _webViewController = Completer<InAppWebViewController>();

  bool webViewLoading = true;
  final recaptchaLoading = ValueNotifier(true);

  final recaptchaWebViewKey = GlobalKey();
  late WebUri _initialUrl;

  final setting = InAppWebViewSettings(
    mediaPlaybackRequiresUserGesture: false,
    javaScriptEnabled: true,
    cacheEnabled: true,
    clearCache: true,
    supportZoom: false,
    useHybridComposition: true,
    thirdPartyCookiesEnabled: true,
    allowsInlineMediaPlayback: true,
    isInspectable: kDebugMode,
  );

  @override
  void initState() {
    _initialUrl = WebUri(
      '${getIt<IEndpointService>().getCachedEndpoint()}'
      '/signup/recaptcha?siteKey=${widget.siteKey}'
      '&version=${widget.version}'
      '&logActionName=${widget.logActionName}',
    );

    super.initState();
  }

  @override
  void didUpdateWidget(TbRecaptcha oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    recaptchaLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: _buildRecaptchaView(context),
    );
  }

  Widget _buildRecaptchaView(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          key: recaptchaWebViewKey,
          initialUrlRequest: URLRequest(url: _initialUrl),
          initialSettings: setting,
          onWebViewCreated: (webViewController) {
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileRecaptchaLoadedHandler',
              callback: (args) async {
                recaptchaLoading.value = false;
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileRecaptchaHandler',
              callback: (args) async {
                final recaptchaResponse = args[0];
                pop(recaptchaResponse);
              },
            );
          },
          onConsoleMessage: (controller, consoleMessage) {
            log.debug(
              '[JavaScript console] ${consoleMessage.messageLevel}: '
              '${consoleMessage.message}',
            );
          },
          onLoadStop: (controller, url) async {
            log.debug('onLoadStop: $url');
            if (webViewLoading) {
              webViewLoading = false;
              _webViewController.complete(controller);
            }
          },
        ),
        ValueListenableBuilder(
          valueListenable: recaptchaLoading,
          builder: (BuildContext context, bool loading, child) {
            if (!loading) {
              return const SizedBox.shrink();
            } else {
              return Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: const CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  void refresh() async {
    var windowMessage = <String, dynamic>{'type': 'resetRecaptcha'};
    var controller = await _webViewController.future;
    await controller.postWebMessage(
      message: WebMessage(data: jsonEncode(windowMessage)),
      targetOrigin: WebUri('*'),
    );
  }
}
