// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/widgets/dotted_point_widget.dart';

class ManuallyReconnectToWifi extends StatelessWidget {
  const ManuallyReconnectToWifi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).pleaseFollowTheNextStepsToReconnectnyourPhoneToYour,
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withValues(alpha: .54),
          ),
        ),
        const SizedBox(height: 16),
         DottedPointWidget(S.of(context).openWifiSettings),
        const SizedBox(height: 16),
         DottedPointWidget(S.of(context).connectToTheWifiYouUsuallyUse),
        const SizedBox(height: 16),
         DottedPointWidget(S.of(context).returnToTheAppAndTapReadyButton),
      ],
    );
  }
}
