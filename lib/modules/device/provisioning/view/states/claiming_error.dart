import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/connection_state_row.dart';

class ClaimingError extends StatelessWidget {
  const ClaimingError({super.key});

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
        ),
        ConnectionStateRow(
          S.of(context).provisionedSuccessfully,
          inProgress: false,
        ),
        ConnectionStateRow(
          S.of(context).claimingDevice,
          inProgress: false,
          error: true,
        ),
      ],
    );
  }
}
