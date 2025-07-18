import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/return_to_dashboard_button.dart';
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
                color: Colors.black.withValues(alpha: .54),
              ),
            ),
          ),
        ),
        const Spacer(),
        ReturnToDashboardButton(onTap: () => Navigator.of(context).pop(true)),
      ],
    );
  }
}
