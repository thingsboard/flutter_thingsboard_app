import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/enter_password_dialog.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/help_message_widget.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/scan_list_widget.dart';

class WifiList extends TbContextStatelessWidget {
  WifiList(super.tbContext, {required this.wifi, super.key});

  final List<String> wifi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HelpTextWidget(S.of(context).wifiHelpMessage('')),
        const SizedBox(height: 8),
        Expanded(
          child: ScanListWidget(
            wifi,
            icon: Icons.wifi_outlined,
            onTap: (network) async {
              final String? networkPass = await tbContext.showFullScreenDialog(
                PasswordDialog(
                  helpMessage: S.of(context).wifiPasswordMessage(network),
                  textFieldLabel: S.of(context).wifiPassword,
                ),
                context: context,
              );

              if (networkPass != null && context.mounted) {
                context.read<EspSoftApBloc>().add(
                      EspSoftApStartProvisioningEvent(
                        ssid: network,
                        password: networkPass,
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
