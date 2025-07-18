import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class CannotEstablishSessionView extends StatelessWidget {
  const CannotEstablishSessionView({
    required this.onTryAgain,
    required this.deviceName,
    super.key,
  });

  final VoidCallback onTryAgain;
  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ThingsboardImage.provisioningError,
          width: 140,
          height: 140,
        ),
        const SizedBox(height: 16),
        Text(
          deviceName,
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withValues(alpha: .54),
          ),
        ),
        const Spacer(),
        TryAgainButton(onTryAgain: onTryAgain),
      ],
    );
  }
}
