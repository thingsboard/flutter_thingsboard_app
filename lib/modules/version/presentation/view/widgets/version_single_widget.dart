// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class VersionSingleWidget extends StatefulWidget {
  const VersionSingleWidget({
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

class _VersionSingleState extends State<VersionSingleWidget>
    with SingleTickerProviderStateMixin {
  late final tabCtrl = TabController(length: 1, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        canGoBack: false,
        title: Text(S.of(context).updateRequired),
        actions: [
          IconButton(
            onPressed: () {
              context.push(UiUtilsRoutes.qrCodeScan);
            },
            icon: SvgPicture.asset(
              ThingsboardImage.oauth2Logos['qr-code']!,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: tabCtrl,
                tabs: [Tab(text: widget.version)],
              ),
              Expanded(
                child: SingleChildScrollView(
                  // Keeps the 8px body margin flutter_html used to add.
                  padding: const EdgeInsets.all(8),
                  child: HtmlWidget(
                    widget.notes,
                    onTapUrl: Utils.openReleaseNotesLink,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Visibility(
                  visible: widget.storeLink?.isNotEmpty == true,
                  child: ElevatedButton(
                    onPressed: () {
                      Utils.openStoreLink(widget.storeLink!);
                    },
                    child: Text(S.of(context).updateTo(widget.latestVersion)),
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
