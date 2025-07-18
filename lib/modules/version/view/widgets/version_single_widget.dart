import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VersionSingleWidget extends TbContextWidget {
  VersionSingleWidget(
    super.tbContext, {
    required this.version,
    required this.notes,
    required this.storeLink,
    required this.latestVersion,
    super.key,
  });

  final String version;
  final String notes;
  final String? storeLink;
  final String latestVersion;

  @override
  State<StatefulWidget> createState() => _VersionSingleState();
}

class _VersionSingleState extends TbContextState<VersionSingleWidget>
    with SingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 1, vsync: this);

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
                tabs: [
                  Tab(text: widget.version),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Html(
                    data: widget.notes,
                    onLinkTap: (link, _, _) {
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
}
