import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/try_again_button.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class EspSoftApConnectionErrorView extends StatelessWidget {
  const EspSoftApConnectionErrorView({
    required this.assetPath,
    required this.message,
    this.onTryAgain,
    super.key,
  });

  final String assetPath;
  final String message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          assetPath,
          width: 140,
          height: 140,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TbTextStyles.bodyMedium.copyWith(
                color: Colors.black.withOpacity(.54),
              ),
            ),
          ),
        ),
        const Spacer(),
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
              'Open app settings',
              style: TbTextStyles.labelMedium.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () => openAppSettings(),
          ),
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: onTryAgain != null,
          child: TryAgainButton(onTryAgain: onTryAgain!),
        ),
      ],
    );
  }
}
