import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlPage extends StatefulWidget {
  const UrlPage({required this.url, super.key});

  final String url;

  @override
  State<StatefulWidget> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  late final titleNotifier = ValueNotifier<String>('Url');
  late final subTitleUrlNotifier = ValueNotifier<String>(widget.url);
  bool canGoBack = false;
  bool ready = false;
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        title: ValueListenableBuilder(
          valueListenable: titleNotifier,
          builder: (context, title, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TbTextStyles.labelLarge),
                ValueListenableBuilder(
                  valueListenable: subTitleUrlNotifier,
                  builder: (context, url, _) {
                    return Text(
                      url,
                      style: TbTextStyles.labelSmall.copyWith(
                        // color: Colors.black.withValues(alpha:.54),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        leading: AnimatedVisibilityWidget(
          show: canGoBack,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await webViewController?.canGoBack() == true) {
                webViewController?.goBack();
              } else if (context.mounted && context.canPop()) {
                Navigator.of(context).pop();
              } else if (context.mounted && !context.canPop()) {
                setState(() => canGoBack = false);
              }
            },
            // },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              launchUrlString(widget.url, mode: LaunchMode.externalApplication);
            },
            icon: const Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body:
          UniversalPlatform.isWeb
              ? Center(child: Text(S.of(context).notImplemented))
              : Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                    onWebViewCreated: (ctrl) {
                      webViewController = ctrl;
                    },
                    onPermissionRequest: (controller, request) async {
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
}
