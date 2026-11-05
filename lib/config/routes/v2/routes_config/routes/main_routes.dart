// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/alarm_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/asset_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/audit_log_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/customer_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/device_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/esp_provisioning_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/home_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/location_tracking_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/more_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/notification_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/profile_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/url_routes.dart';
import 'package:thingsboard_app/modules/main/navigation_page.dart';

final allMainPages = [
  ...homeRoutes,
  ...alarmRoutes,
  ...deviceRoutes,
  ...dashboardRoutes,
  ...moreRoutes,
  ...assetRoutes,
  ...auditLogRoutes,
  ...customerRoutes,
  ...notificationRoutes,
  ...urlRoutes,
  ...espProvisioningRoutes,
  ...profileRoutes,
  ...locationTrackingRoutes,
];
List<RouteBase> getMainRoutes() {
  return [
    ShellRoute(
      routes: allMainPages,
      pageBuilder:
          (context, state, child) =>
              MaterialPage(child: NavigationPage(child: child)),
    ),
  ];
}
