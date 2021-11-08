import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class TbRecaptcha extends TbPageWidget {

  final String siteKey;

  TbRecaptcha(TbContext tbContext, {required this.siteKey}) :
        super(tbContext);

  @override
  _TbRecaptchaState createState() => _TbRecaptchaState();

}

class _TbRecaptchaState extends TbPageState<TbRecaptcha> {

  final Completer<InAppWebViewController> _webViewController = Completer<InAppWebViewController>();

  bool webViewLoading = true;
  final ValueNotifier<bool> recaptchaLoading = ValueNotifier(true);

  final GlobalKey recaptchaWebViewKey = GlobalKey();

  late Uri _initialUrl;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        mediaPlaybackRequiresUserGesture: false,
        javaScriptEnabled: true,
        cacheEnabled: true,
        clearCache: true,
        supportZoom: false,
      ),
      android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
          thirdPartyCookiesEnabled: true
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
  ));

  @override
  void initState() {
    _initialUrl = Uri.parse(ThingsboardAppConstants.thingsBoardApiEndpoint + '/signup/recaptcha?siteKey=${widget.siteKey}');
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
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0
      ),
      body: _buildRecaptchaView(context)
    );
  }

  Widget _buildRecaptchaView(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
            key: recaptchaWebViewKey,
            initialUrlRequest: URLRequest(url: _initialUrl),
            initialOptions: options,
            onWebViewCreated: (webViewController) {
              webViewController.addJavaScriptHandler(handlerName: "tbMobileRecaptchaLoadedHandler", callback: (args) async {
                recaptchaLoading.value = false;
              });
              webViewController.addJavaScriptHandler(handlerName: "tbMobileRecaptchaHandler", callback: (args) async {
                var recaptchaResponse = args[0];
                pop(recaptchaResponse);
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              log.debug('[JavaScript console] ${consoleMessage.messageLevel}: ${consoleMessage.message}');
            },
            onLoadStop: (controller, url) async {
              log.debug('onLoadStop: $url');
              if (webViewLoading) {
                webViewLoading = false;
                _webViewController.complete(controller);
              }
            }
        ),
        ValueListenableBuilder(
            valueListenable: recaptchaLoading,
            builder: (BuildContext context, bool loading, child) {
              if (!loading) {
                return SizedBox.shrink();
              } else {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
      ],
    );
  }

  refresh() async {
    var windowMessage = <String, dynamic>{
      'type': 'resetRecaptcha'
    };
    var controller = await _webViewController.future;
    await controller.postWebMessage(message: WebMessage(data: jsonEncode(windowMessage)), targetOrigin: Uri.parse('*'));
  }

}
