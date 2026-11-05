// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
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
