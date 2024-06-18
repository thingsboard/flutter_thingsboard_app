import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlPage extends TbPageWidget {
  UrlPage({
    required this.url,
    required TbContext tbContext,
    super.key,
  }) : super(tbContext);

  final String url;

  @override
  State<StatefulWidget> createState() => _UrlPageState();
}

class _UrlPageState extends TbPageState<UrlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: const Text('Url'),
        actions: [
          IconButton(
            onPressed: () {
              launchUrlString(widget.url, mode: LaunchMode.externalApplication);
            },
            icon: Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: UniversalPlatform.isWeb
          ? const Center(child: Text('Not implemented!'))
          : InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(widget.url.toString()),
              ),
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT,
                );
              },
            ),
    );
  }
}
