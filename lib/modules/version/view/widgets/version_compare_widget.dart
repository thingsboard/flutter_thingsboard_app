import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
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
        title: Text(S.of(context).updateRequired),
        leading: null,
        canGoBack: false,
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
