import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
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
          'Please follow the next steps to connect your phone to device',
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withOpacity(.54),
          ),
        ),
        const SizedBox(height: 16),
        const DottedPointWidget('Open Wi-Fi settings'),
        const SizedBox(height: 16),
        DottedPointWidget(
          'Connect to Wi-Fi similar to $wifiName',
        ),
        const SizedBox(height: 16),
        const DottedPointWidget(
          'Return to the app and tap Ready button',
        ),
        const Spacer(),
        TryAgainButton(
          label: 'Open Wi-Fi settings',
          onTryAgain: () => Platform.isAndroid
              ? const OpenSettingsPlusAndroid().wifi()
              : const OpenSettingsPlusIOS().wifi(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
            child: Text(
              'Ready',
              style: TbTextStyles.labelMedium.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              context
                  .read<EspSoftApBloc>()
                  .add(const EspSoftApConnectToDeviceEvent());
            },
          ),
        ),
      ],
    );
  }
}
