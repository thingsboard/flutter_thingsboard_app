import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/auth/auth_routes.dart';
import 'package:thingsboard_app/core/auth/noauth/routes/noauth_routes.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/init/init_routes.dart';
import 'package:thingsboard_app/modules/alarm/alarm_routes.dart';
import 'package:thingsboard_app/modules/asset/asset_routes.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_routes.dart';
import 'package:thingsboard_app/modules/customer/customer_routes.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard_routes.dart';
import 'package:thingsboard_app/modules/device/device_routes.dart';
import 'package:thingsboard_app/modules/home/home_routes.dart';
import 'package:thingsboard_app/modules/main/main_routes.dart';
import 'package:thingsboard_app/modules/more/more_routes.dart';
import 'package:thingsboard_app/modules/notification/routes/notification_routes.dart';
import 'package:thingsboard_app/modules/profile/profile_routes.dart';
import 'package:thingsboard_app/modules/tenant/tenant_routes.dart';
import 'package:thingsboard_app/modules/url/url_routes.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart';
import 'package:thingsboard_app/utils/ui_utils_routes.dart';

class ThingsboardAppRouter {
  final router = FluroRouter();
  late final _tbContext = TbContext(router);

  ThingsboardAppRouter() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        final settings = context!.settings;

        return Scaffold(
          appBar: AppBar(title: const Text('Not Found')),
          body: Center(child: Text('Route not defined: ${settings!.name}')),
        );
      },
    );

    InitRoutes(_tbContext).registerRoutes();
    AuthRoutes(_tbContext).registerRoutes();
    UiUtilsRoutes(_tbContext).registerRoutes();
    MainRoutes(_tbContext).registerRoutes();
    HomeRoutes(_tbContext).registerRoutes();
    ProfileRoutes(_tbContext).registerRoutes();
    AssetRoutes(_tbContext).registerRoutes();
    DeviceRoutes(_tbContext).registerRoutes();
    AlarmRoutes(_tbContext).registerRoutes();
    DashboardRoutes(_tbContext).registerRoutes();
    AuditLogsRoutes(_tbContext).registerRoutes();
    CustomerRoutes(_tbContext).registerRoutes();
    TenantRoutes(_tbContext).registerRoutes();
    NotificationRoutes(_tbContext).registerRoutes();
    UrlPageRoutes(_tbContext).registerRoutes();
    NoAuthRoutes(_tbContext).registerRoutes();
    MoreRoutes(_tbContext).registerRoutes();
    VersionRoutes(_tbContext).registerRoutes();
  }

  TbContext get tbContext => _tbContext;
}

abstract class TbRoutes {
  final TbContext _tbContext;

  TbRoutes(this._tbContext);

  void registerRoutes() {
    doRegisterRoutes(_tbContext.router);
  }

  void doRegisterRoutes(FluroRouter router);

  TbContext get tbContext => _tbContext;
}
