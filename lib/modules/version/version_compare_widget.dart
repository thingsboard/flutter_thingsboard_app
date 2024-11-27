import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/version/version_route_arguments.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionCompareWidget extends TbContextWidget {
  VersionCompareWidget(
    super.tbContext, {
    required this.arguments,
    super.key,
  });

  final VersionRouteArguments arguments;

  @override
  State<StatefulWidget> createState() => _VersionCompareWidgetState();
}

class _VersionCompareWidgetState extends TbContextState<VersionCompareWidget>
    with SingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 2, vsync: this);
  late String releaseNotes =
      widget.arguments.versionInfo.minVersionReleaseNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: Text(S.of(context).updateRequired),
        leading: null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: tabCtrl,
                onTap: (index) {
                  if (index == 0) {
                    releaseNotes =
                        widget.arguments.versionInfo.minVersionReleaseNotes;
                  } else {
                    releaseNotes =
                        widget.arguments.versionInfo.latestVersionReleaseNotes;
                  }

                  setState(() {});
                },
                tabs: [
                  Tab(
                    text: widget.arguments.versionInfo.minVersion.toString(),
                  ),
                  Tab(
                    text: widget.arguments.versionInfo.latestVersion.toString(),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Html(
                    data: releaseNotes,
                    onLinkTap: (link, _, __) {
                      if (link != null) {
                        launchUrlString(
                          link,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible:
                      widget.arguments.storeInfo?.storeLink?.isNotEmpty == true,
                  child: ElevatedButton(
                    onPressed: () {
                      launchUrlString(
                        widget.arguments.storeInfo!.storeLink!,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Text(
                      S.of(context).updateTo(
                            widget.arguments.versionInfo.latestVersion
                                .toString(),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }
}
