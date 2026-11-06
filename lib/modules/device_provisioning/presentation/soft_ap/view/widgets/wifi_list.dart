// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/soft_ap/bloc/bloc.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/widgets/enter_password_dialog.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/widgets/help_message_widget.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/widgets/scan_list_widget.dart';
import 'package:thingsboard_app/utils/ui/full_screen_dialog.dart';

class WifiList extends StatelessWidget {
  const WifiList({required this.wifi, super.key});

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
              final String? networkPass = await showFullScreenDialog(
                PasswordDialog(
                  helpMessage: S.of(context).wifiPasswordMessage(network),
                  textFieldLabel: S.of(context).wifiPassword,
                ),
                context,
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
