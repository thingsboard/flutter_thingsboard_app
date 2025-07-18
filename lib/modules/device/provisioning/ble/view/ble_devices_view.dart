import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/enter_password_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/help_message_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/scan_list_widget.dart';

class BleDevicesView extends StatelessWidget {
  const BleDevicesView({
    required this.devices,
    required this.tbContext,
    super.key,
  });

  final List<String> devices;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HelpTextWidget(S.of(context).bleHelpMessage),
        const SizedBox(height: 8),
        Expanded(
          child: ScanListWidget(
            devices,
            icon: Icons.bluetooth_outlined,
            onTap: (device) async {
              final String? pop = await tbContext.showFullScreenDialog(
                PasswordDialog(
                  helpMessage: S.of(context).popTitle(device),
                  textFieldLabel: 'PIN',
                ),
              );

              if (pop != null && context.mounted) {
                context.read<EspBleProvisioningBloc>().add(
                      EspBleScanNetworksEvent(
                        deviceName: device,
                        pop: pop,
                      ),
                    );
              }
            },
          ),
        ),
      ],
    );
  }
}
