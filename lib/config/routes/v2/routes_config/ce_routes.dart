// ignore_for_file: unused_import

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler_widget.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/alarm_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/asset_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/audit_log_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/customer_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/device_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/esp_provisioning_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/home_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/main_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/more_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/noauth_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/notification_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/profile_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/root_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/tenant_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/url_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/version_routes.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

final shellKey = GlobalKey<NavigatorState>();
// Combine all routes
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
      ],
    ),
  ];
}
