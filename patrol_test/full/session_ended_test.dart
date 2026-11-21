// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';

/// Journey 5: when the server ends the session (here by a password change
/// elsewhere), the app's next request takes the user back to the login page
/// instead of looping, crashing or keeping the old data on screen.
void main() {
  patrolTest(
    'app returns to login after the server ends the session',
    config: e2eConfig,
    ($) async {
      final server = await E2eServer.signIn();
      await server.deleteStaleCustomers();
      final user = await server.createCustomerUser();
      try {
        await $.startApp();
        await $.logIn(user.email, user.password);
        await $.expectHome();

        await E2eServer.endSessions(user);
        // Opening Alarms sends a request with the old token.
        await $.openAlarms();
        await $.expectLoginPage();
      } finally {
        await server.cleanUpCustomer(user.customerId);
      }
    },
  );
}
