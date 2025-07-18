import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionCompareWidget extends TbContextWidget {
  VersionCompareWidget(
    super.tbContext, {
    required this.minVersion,
    required this.minVersionNotes,
    required this.latestVersion,
    required this.latestVersionNotes,
    required this.storeLink,
    super.key,
  });

  final String minVersion;
  final String minVersionNotes;
  final String latestVersion;
  final String latestVersionNotes;
  final String? storeLink;

  @override
  State<StatefulWidget> createState() => _VersionCompareWidgetState();
}

class _VersionCompareWidgetState extends TbContextState<VersionCompareWidget>
    with SingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 2, vsync: this);
  late String releaseNotes = widget.minVersionNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: Text(S.of(context).updateRequired),
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
                    releaseNotes = widget.minVersionNotes;
                  } else {
                    releaseNotes = widget.latestVersionNotes;
                  }

                  setState(() {});
                },
                tabs: [
                  Tab(text: widget.minVersion),
                  Tab(text: widget.latestVersion),
                ],
              ),
              Expanded(
                child: HtmlWidget(
                  releaseNotes,
                  onTapUrl: (link) => Utils.onWebViewLinkPressed(link)
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: widget.storeLink?.isNotEmpty == true,
                  child: ElevatedButton(
                    onPressed: () {
                      launchUrlString(
                        widget.storeLink!,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Text(
                      S.of(context).updateTo(widget.latestVersion),
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
