import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/dotted_point_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

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
