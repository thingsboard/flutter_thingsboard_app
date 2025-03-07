import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/enter_password_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/help_message_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/scan_list_widget.dart';

class EspWifiNetworkView extends StatelessWidget {
  const EspWifiNetworkView({
    required this.device,
    required this.pop,
    required this.networks,
    required this.tbContext,
    super.key,
  });

  final String device;
  final String pop;
  final List<String> networks;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HelpTextWidget(S.of(context).wifiHelpMessage(device)),
        const SizedBox(height: 8),
        Expanded(
          child: ScanListWidget(
            networks,
            icon: Icons.wifi_outlined,
            onTap: (network) async {
              final networkPass = await tbContext.showFullScreenDialog(
                PasswordDialog(
                  helpMessage: S.of(context).wifiPasswordMessage(network),
                  textFieldLabel: S.of(context).wifiPassword,
                ),
                context: context,
              );

              if (networkPass != null && context.mounted) {
                context.read<EspBleProvisioningBloc>().add(
                      EspBleProvisionDeviceEvent(
                        device: device,
                        pop: pop,
                        ssid: network,
                        pass: networkPass,
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
