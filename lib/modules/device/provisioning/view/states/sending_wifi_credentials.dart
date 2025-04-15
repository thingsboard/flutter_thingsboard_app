import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/modules/device/provisioning/view/states/connection_state_row.dart';

class SendingWifiCredentials extends StatelessWidget {
  const SendingWifiCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectionStateRow(
      S.of(context).sendingWifiCredentials,
      inProgress: true,
    );
  }
}
