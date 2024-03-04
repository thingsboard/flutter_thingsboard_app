import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:universal_platform/universal_platform.dart';

class UrlPage extends StatelessWidget {
  const UrlPage({
    required this.url,
    required this.tbContext,
    super.key,
  });

  final String url;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: const Text('Url'),
      ),
      body: UniversalPlatform.isWeb
          ? const Center(child: Text('Not implemented!'))
          : InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(url),
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
