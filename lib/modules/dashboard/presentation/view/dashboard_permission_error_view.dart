// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DashboardPermissionErrorView extends StatefulWidget {
  const DashboardPermissionErrorView({
    this.fullScreen = false,
    this.home = false,
    super.key,
  });

  final bool fullScreen;
  final bool home;

  @override
  State<StatefulWidget> createState() => _DashboardPermissionErrorViewState();
}

class _DashboardPermissionErrorViewState
    extends State<DashboardPermissionErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        leading: !widget.fullScreen && !widget.home
            ? BackButton(onPressed: () => Navigator.of(context).pop())
            : null,
        elevation: 1,
        shadowColor: Colors.transparent,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.centerLeft,
          child: Text(S.of(context).dashboards(1)),
        ),
        actions: widget.fullScreen && !widget.home
            ? [
                IconButton(
                  icon: const Icon(Icons.settings),
                  // translate-me-ignore-next-line
                  onPressed: () => getIt<ThingsboardAppRouter>().navigateTo(
                    '/profile?fullscreen=true',
                  ),
                ),
              ]
            : null,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ThingsboardImage.dashboardPermissionError,
              width: 101,
              height: 82,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                S
                    .of(context)
                    .itLooksLikeYourPermissionsArentSufficientToCompleteThis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25,
                ),
              ),
            ),
            const SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
