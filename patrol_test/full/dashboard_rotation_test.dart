// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_server.dart';

/// Journey 1: the home dashboard loads although the screen rotates while it
/// is loading, and still shows after rotating back.
void main() {
  patrolTest('home dashboard survives rotation', config: e2eConfig, ($) async {
    final server = await E2eServer.signIn();
    await server.deleteStaleCustomers();
    final user = await server.createCustomerUser();
    try {
      await server.setCustomerHomeDashboard(user.customerId);

      await $.startApp();
      await $.logIn(user.email, user.password);
      await $.expectHome();
      await $.rotateToLandscape();
      await $.expectDashboardText(E2eServer.dashboardMarker);
      await $.resetOrientation();
      await $.expectDashboardText(E2eServer.dashboardMarker);
      await $.logOut();
    } finally {
      await $.lockPortrait();
      await server.cleanUpCustomer(user.customerId);
    }
  });
}
