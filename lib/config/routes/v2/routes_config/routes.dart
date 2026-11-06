// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler_widget.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/main_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/more_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/noauth_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/register_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/root_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/select_region_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/tenant_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/version_routes.dart';

List<RouteBase> getRoutes() {
  return [
    ShellRoute(
      parentNavigatorKey: globalNavigatorKey,
      builder: (context, state, child) => RouteHanlderWidget(child: child),
      routes: [
        ...getMainRoutes(),
        ...loginRoutes,
        ...noAuthRoutes,
        ...versionRoutes,
        ...tenantRoutes,
        ...uiUtilsRoutes,
        ...rootRoutes,
        ...moreRoutes,
        ...selectRegionRoutes,
        ...registerRoutes,
      ],
    ),
  ];
}
