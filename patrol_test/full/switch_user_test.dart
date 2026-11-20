// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_env.dart';
import '../common/e2e_server.dart';

/// Journey 4: after the tenant administrator signs out, a customer user who
/// signs in sees only their own account and menu. The server builds a
/// different menu for each role, so state left over from the tenant shows.
void main() {
  patrolTest(
    'customer user sees nothing of the previous tenant session',
    config: e2eConfig,
    ($) async {
      final server = await E2eServer.signIn();
      await server.deleteStaleCustomers();
      final user = await server.createCustomerUser();
      try {
        await $.startApp();
        await $.logIn(E2eEnv.tenantEmail, E2eEnv.tenantPassword);
        await $.expectHome();
        await $.openMore();
        await $(s.tenantAdministrator).waitUntilVisible();
        await $(s.customers).waitUntilVisible();
        await $.logOut();

        await $.logIn(user.email, user.password);
        await $.expectHome();
        await $.openMore();
        await $(s.customer).waitUntilVisible();
        await $(user.email).waitUntilVisible();
        expect($(s.tenantAdministrator), findsNothing);
        expect($(s.customers), findsNothing);
        expect($(s.auditLogs), findsNothing);
        expect($(E2eEnv.tenantEmail), findsNothing);
        await $.logOut();
      } finally {
        await server.cleanUpCustomer(user.customerId);
      }
    },
  );
}
