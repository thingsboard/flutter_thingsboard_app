import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/connection_state_row.dart';

class ConfirmingWifiConnection extends StatelessWidget {
  const ConfirmingWifiConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConnectionStateRow(
          S.of(context).sendingWifiCredentials,
          inProgress: false,
        ),
        ConnectionStateRow(
          S.of(context).confirmingWifiConnection,
          inProgress: true,
        ),
      ],
    );
  }
}
