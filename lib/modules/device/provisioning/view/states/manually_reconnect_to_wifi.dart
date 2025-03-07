import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/dotted_point_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class ManuallyReconnectToWifi extends StatelessWidget {
  const ManuallyReconnectToWifi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Please follow the next steps to reconnect '
          'your phone to your regular Wi-Fi',
          textAlign: TextAlign.center,
          style: TbTextStyles.bodyMedium.copyWith(
            color: Colors.black.withOpacity(.54),
          ),
        ),
        const SizedBox(height: 16),
        const DottedPointWidget('Open Wi-Fi settings'),
        const SizedBox(height: 16),
        const DottedPointWidget(
          'Connect to the Wi-Fi you usually use',
        ),
        const SizedBox(height: 16),
        const DottedPointWidget(
          'Return to the app and tap Ready button',
        ),
      ],
    );
  }
}
