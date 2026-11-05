// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';

class TbRecaptcha extends StatefulWidget {
  const TbRecaptcha(
     {
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

class _TbRecaptchaState extends State<TbRecaptcha> {
  final _webViewController = Completer<InAppWebViewController>();

  bool webViewLoading = true;
  final recaptchaLoading = ValueNotifier(true);

  final recaptchaWebViewKey = GlobalKey();
  late WebUri _initialUrl;

  final setting = InAppWebViewSettings(
    mediaPlaybackRequiresUserGesture: false,
    clearCache: true,
    supportZoom: false,
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
              callback: (args)  {
                recaptchaLoading.value = false;
              },
            );
            webViewController.addJavaScriptHandler(
              handlerName: 'tbMobileRecaptchaHandler',
              callback: (args)  {
                final recaptchaResponse = args[0];
                getIt<ThingsboardAppRouter>().pop(recaptchaResponse);
              },
            );
          },
          onConsoleMessage: (controller, consoleMessage) {
            log(
              // translate-me-ignore-next-line
              '[JavaScript console] ${consoleMessage.messageLevel}: '
              '${consoleMessage.message}',
            );
          },
          onLoadStop: (controller, url)  {
            // translate-me-ignore-next-line
            log('onLoadStop: $url');
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

  Future<void> refresh() async {
    final windowMessage = <String, dynamic>{'type': 'resetRecaptcha'};
    final controller = await _webViewController.future;
    await controller.postWebMessage(
      message: WebMessage(data: jsonEncode(windowMessage)),
      targetOrigin: WebUri('*'),
    );
  }
}
