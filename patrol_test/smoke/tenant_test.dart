// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:patrol/patrol.dart';

import '../common/app_steps.dart';
import '../common/e2e_env.dart';
import '../common/e2e_server.dart';

void main() {
  patrolTest(
    'tenant administrator opens a dashboard and logs out',
    config: e2eConfig,
    ($) async {
      final server = await E2eServer.signIn();
      await server.ensureDashboard();

      await $.startApp();
      await $.logIn(E2eEnv.tenantEmail, E2eEnv.tenantPassword);
      await $.expectHome();
      await $.openDashboard(E2eServer.dashboardTitle);
      await $.expectDashboardText(E2eServer.dashboardMarker);
      await $.closeDashboard();
      await $.logOut();
    },
  );
}
