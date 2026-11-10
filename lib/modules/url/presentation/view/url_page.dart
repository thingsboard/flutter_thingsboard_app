// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlPage extends StatefulWidget {
  const UrlPage({required this.url, super.key});

  final String url;

  @override
  State<StatefulWidget> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> with AutomaticKeepAliveClientMixin {
  late final titleNotifier = ValueNotifier<String>('Url');
  late final subTitleUrlNotifier = ValueNotifier<String>(widget.url);
  bool canGoBack = false;
  bool ready = false;
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: UrlPageAppBar(
        url: widget.url,
        title: titleNotifier,
        host: subTitleUrlNotifier,
        webCanGoBack: canGoBack,
        onWebBack: () => webViewController?.goBack(),
      ),
      body: Stack(
        children: [
          InAppWebView(
            keepAlive: InAppWebViewKeepAlive(),
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (ctrl) {
              webViewController = ctrl;
            },
            onPermissionRequest: (controller, request) {
              return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT,
              );
            },
            onTitleChanged: (_, title) {
              titleNotifier.value = title ?? S.of(context).url;
            },
            onLoadStop: (controller, url) async {
              canGoBack = await controller.canGoBack();
              ready = true;
              setState(() {});
            },

            onUpdateVisitedHistory: (ctrl, url, _) async {
              subTitleUrlNotifier.value = url?.host ?? widget.url;
              canGoBack = await ctrl.canGoBack();
              setState(() {});
            },
          ),
          AnimatedVisibilityWidget(
            show: !ready,
            child: const ColoredBox(
              color: AppColors.white,
              child: FullScreenLoader(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleNotifier.dispose();
    subTitleUrlNotifier.dispose();
    webViewController?.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

/// The page's title and host. The back arrow steps through the site's history;
/// without one [TbAppBar] shows its usual route back arrow.
@visibleForTesting
class UrlPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UrlPageAppBar({
    required this.url,
    required this.title,
    required this.host,
    required this.webCanGoBack,
    required this.onWebBack,
    super.key,
  });

  final String url;
  final ValueListenable<String> title;
  final ValueListenable<String> host;
  final bool webCanGoBack;
  final VoidCallback onWebBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TbAppBar(
      title: ValueListenableBuilder(
        valueListenable: title,
        builder: (context, title, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TbTextStyles.labelLarge),
              ValueListenableBuilder(
                valueListenable: host,
                builder: (context, host, _) {
                  return Text(host, style: TbTextStyles.labelSmall);
                },
              ),
            ],
          );
        },
      ),
      leading: webCanGoBack
          ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: onWebBack)
          : null,
      actions: [
        IconButton(
          onPressed: () {
            launchUrlString(url, mode: LaunchMode.externalApplication);
          },
          icon: const Icon(Icons.open_in_browser),
        ),
      ],
    );
  }
}
