import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/modules/device/provisioning/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class BleDevicesEmptyView extends StatelessWidget {
  const BleDevicesEmptyView({
    required this.onTryAgain,
    required this.message,
    super.key,
  });

  final VoidCallback onTryAgain;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ThingsboardImage.deviceNotFound,
          width: 140,
          height: 140,
        ),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withOpacity(.54),
          ),
        ),
        const Spacer(),
        TryAgainButton(onTryAgain: onTryAgain),
      ],
    );
  }
}
