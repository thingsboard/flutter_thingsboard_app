import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/dotted_point_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class ManuallyConnectToWifi extends StatelessWidget {
  const ManuallyConnectToWifi({
    required this.wifiName,
    required this.poofOfPossession,
    super.key,
  });

  final String wifiName;
  final String poofOfPossession;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ThingsboardImage.connectMobile,
          width: 140,
          height: 140,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).pleaseFollowTheNextStepsToConnectYourPhoneTo,
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withValues(alpha: .54),
          ),
        ),
        const SizedBox(height: 16),
        DottedPointWidget(S.of(context).openWifiSettings),
        const SizedBox(height: 16),
        DottedPointWidget(S.of(context).connectToWifiSimilarToWifiname(wifiName)),
        const SizedBox(height: 16),
        DottedPointWidget(S.of(context).returnToTheAppAndTapReadyButton),
        const Spacer(),
        TryAgainButton(
          label: S.of(context).openWifiSettings,
          onTryAgain:
              () =>
                  Platform.isAndroid
                      ? const OpenSettingsPlusAndroid().wifi()
                      : const OpenSettingsPlusIOS().wifi(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            child: Text(
              S.of(context).ready,
              style: TbTextStyles.labelMedium.copyWith(color: Colors.white),
            ),
            onPressed: () {
              context.read<EspSoftApBloc>().add(
                const EspSoftApConnectToDeviceEvent(),
              );
            },
          ),
        ),
      ],
    );
  }
}
