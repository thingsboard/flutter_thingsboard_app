import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/version/version_compare_widget.dart';
import 'package:thingsboard_app/modules/version/version_route_arguments.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpdateRequiredPage extends TbContextWidget {
  UpdateRequiredPage(
    super.tbContext, {
    required this.arguments,
    super.key,
  });

  final VersionRouteArguments arguments;

  @override
  State<StatefulWidget> createState() => _UpdateRequiredPageState();
}

class _UpdateRequiredPageState extends TbContextState<UpdateRequiredPage>
    with SingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 1, vsync: this);

  @override
  Widget build(BuildContext context) {
    String releaseNotes = '';
    String version;

    if ((widget.arguments.versionInfo.minVersion?.versionInt() ?? 0) !=
            (widget.arguments.versionInfo.latestVersion?.versionInt() ?? 0) &&
        widget.arguments.versionInfo.minVersionReleaseNotes.isNotEmpty &&
        widget.arguments.versionInfo.latestVersionReleaseNotes.isNotEmpty) {
      return VersionCompareWidget(tbContext, arguments: widget.arguments);
    } else if (widget.arguments.versionInfo.minVersionReleaseNotes.isNotEmpty ||
        widget.arguments.versionInfo.latestVersionReleaseNotes.isNotEmpty) {
      releaseNotes =
          widget.arguments.versionInfo.minVersionReleaseNotes.isNotEmpty
              ? widget.arguments.versionInfo.minVersionReleaseNotes
              : widget.arguments.versionInfo.latestVersionReleaseNotes;
    }

    if (widget.arguments.versionInfo.minVersion != null) {
      version = widget.arguments.versionInfo.minVersion.toString();
    } else if (widget.arguments.versionInfo.latestVersion != null) {
      version = widget.arguments.versionInfo.latestVersion.toString();
    } else {
      version = '';
    }

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
              Visibility(
                visible: version.isNotEmpty,
                child: TabBar(
                  controller: tabCtrl,
                  tabs: [
                    Tab(text: version),
                  ],
                ),
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
                            widget.arguments.versionInfo.latestVersion != null
                                ? widget.arguments.versionInfo.latestVersion
                                    .toString()
                                : 'latest',
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
}
