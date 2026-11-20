// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';

/// Journey 2: the home dashboard still shows after the app spent some time in
/// the background, when the system may end the web content.
void main() {
  patrolTest('home dashboard survives the background', config: e2eConfig, (
    $,
  ) async {
    final server = await E2eServer.signIn();
    await server.deleteStaleCustomers();
    final user = await server.createCustomerUser();
    try {
      await server.setCustomerHomeDashboard(user.customerId);

      await $.startApp();
      await $.logIn(user.email, user.password);
      await $.expectHome();
      await $.expectDashboardText(E2eServer.dashboardMarker);
      await $.backgroundFor(const Duration(seconds: 30));
      await $.expectDashboardText(E2eServer.dashboardMarker);
      await $.logOut();
    } finally {
      await server.deleteCustomer(user.customerId);
    }
  });
}
