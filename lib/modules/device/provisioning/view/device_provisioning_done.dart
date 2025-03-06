import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class DeviceProvisioningDone extends StatelessWidget {
  const DeviceProvisioningDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            ThingsboardImage.deviceProvisioningDone,
            width: 140,
            height: 140,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Center(
            child: Text(
              S.of(context).claimingMessageSuccess,
              textAlign: TextAlign.center,
              style: TbTextStyles.titleSmallSb.copyWith(
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
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              S.of(context).returnToDashboard,
              style: TbTextStyles.labelMedium.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
