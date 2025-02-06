import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/device/provisioning/enter_device_pop_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/help_message_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/scan_list.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/bloc/bloc.dart';

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
          child: ScanList(
            devices,
            icon: Icons.bluetooth_outlined,
            onTap: (device) async {
              final pop = await tbContext.showFullScreenDialog(
                DevicePopDialog(
                  helpMessage: S.of(context).popTitle(device),
                  textFieldLabel: 'PIN',
                ),
              );

              if (pop != null && context.mounted) {
                context.read<EspWifiProvisioningBloc>().add(
                      EspWifiScanNetworksEvent(
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
