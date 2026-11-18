// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';

void main() {
  patrolTest('customer user logs in and out', config: e2eConfig, ($) async {
    final server = await E2eServer.signIn();
    await server.deleteStaleCustomers();
    final user = await server.createCustomerUser();
    try {
      await $.startApp();
      await $.logIn(user.email, user.password);
      await $.expectHome();
      await $.logOut();
    } finally {
      await server.deleteCustomer(user.customerId);
    }
  });
}
