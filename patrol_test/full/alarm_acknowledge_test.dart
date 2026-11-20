// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';

/// Journey 6: a user acknowledges an alarm in its details, goes back (the app
/// bar arrow on Android, the edge swipe on iOS), and the list shows the new
/// status.
void main() {
  patrolTest(
    'customer administrator acknowledges an alarm',
    config: e2eConfig,
    ($) async {
      final server = await E2eServer.signIn();
      await server.deleteStaleCustomers();
      // Customer Users can only read; acknowledging needs a write permission.
      final user = await server.createCustomerUser(
        userGroup: E2eServer.customerAdministratorsGroup,
      );
      try {
        await server.createCustomerAlarm(user.customerId);

        await $.startApp();
        await $.logIn(user.email, user.password);
        await $.expectHome();
        await $.openAlarms();
        await $.expectAlarmStatus(acknowledged: false);
        await $.openAlarmDetails(E2eServer.alarmType);
        await $.acknowledgeAlarm();
        await $.expectAlarmStatus(acknowledged: true);
        await $.goBack();
        await $(E2eServer.alarmType).waitUntilVisible();
        await $.expectAlarmStatus(acknowledged: true);
        await $.logOut();
      } finally {
        await server.deleteCustomer(user.customerId);
      }
    },
  );
}
