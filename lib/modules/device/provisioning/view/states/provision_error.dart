import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/connection_state_row.dart';

class ProvisionError extends StatelessWidget {
  const ProvisionError({super.key});

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
          inProgress: false,
          error: true,
        ),
      ],
    );
  }
}
