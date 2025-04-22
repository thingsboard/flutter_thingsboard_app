import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlPage extends TbContextWidget {
  UrlPage({
    required this.url,
    required TbContext tbContext,
    super.key,
  }) : super(tbContext);

  final String url;

  @override
  State<StatefulWidget> createState() => _UrlPageState();
}

class _UrlPageState extends TbContextState<UrlPage> {
  late final titleNotifier = ValueNotifier<String>('Url');
  late final subTitleUrlNotifier = ValueNotifier<String>(widget.url);
  bool canGoBack = false;

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
                Text(
                  title,
                  style: TbTextStyles.labelLarge,
                ),
                ValueListenableBuilder(
                  valueListenable: subTitleUrlNotifier,
                  builder: (context, url, __) {
                    return Text(
                      url,
                      style: TbTextStyles.labelSmall.copyWith(
                          // color: Colors.black.withOpacity(.54),
                          ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        leading: BackButton(
          onPressed: () async {
            if (await webViewController?.canGoBack() == true) {
              webViewController?.goBack();
            } else if (context.mounted && Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else if (context.mounted && !Navigator.of(context).canPop()) {
              setState(() => canGoBack = false);
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              launchUrlString(widget.url, mode: LaunchMode.externalApplication);
            },
            icon: const Icon(Icons.open_in_browser),
          ),
        ],
        canGoBack: canGoBack,
      ),
      body: UniversalPlatform.isWeb
          ? const Center(child: Text('Not implemented!'))
          : InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(widget.url.toString()),
              ),
              onWebViewCreated: (ctrl) => webViewController = ctrl,
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                  resources: request.resources,
                  action: PermissionResponseAction.GRANT,
                );
              },
              onTitleChanged: (_, title) {
                titleNotifier.value = title ?? 'Url';
              },
              onUpdateVisitedHistory: (ctrl, url, __) async {
                subTitleUrlNotifier.value = url?.host ?? widget.url;
                canGoBack = await ctrl.canGoBack();
                setState(() {});
              },
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
