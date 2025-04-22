import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/auth/noauth/routes/noauth_routes.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/features/alarm/alarm_routes.dart';
import 'package:thingsboard_app/features/authentication/auth_routes.dart';
import 'package:thingsboard_app/features/dashboard/dashboard_routes.dart';
import 'package:thingsboard_app/features/home/home_routes.dart';
import 'package:thingsboard_app/modules/asset/asset_routes.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_routes.dart';
import 'package:thingsboard_app/modules/customer/customer_routes.dart';
import 'package:thingsboard_app/modules/device/device_routes.dart';
import 'package:thingsboard_app/modules/device/provisioning/route/esp_provisioning_route.dart';
import 'package:thingsboard_app/modules/main/main_routes.dart';
import 'package:thingsboard_app/modules/more/more_routes.dart';
import 'package:thingsboard_app/modules/notification/routes/notification_routes.dart';
import 'package:thingsboard_app/modules/profile/profile_routes.dart';
import 'package:thingsboard_app/modules/tenant/tenant_routes.dart';
import 'package:thingsboard_app/modules/url/url_routes.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart';
import 'package:thingsboard_app/utils/ui_utils_routes.dart';

class ThingsboardAppRouter {
  ThingsboardAppRouter() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        final settings = context!.settings;

        return Scaffold(
          appBar: AppBar(title: const Text('Not Found')),
          body: Center(
            child: Text('Route not defined: ${settings!.name}'),
          ),
        );
      },
    );

    AuthRoutes().registerRoutes(router);
    UiUtilsRoutes().registerRoutes(router);
    MainRoutes().registerRoutes(router);
    HomeRoutes().registerRoutes(router);
    AlarmRoutes().registerRoutes(router);

    // Deprecated
    ProfileRoutes(_tbContext).registerRoutes();
    AssetRoutes(_tbContext).registerRoutes();
    DeviceRoutes(_tbContext).registerRoutes();
    DashboardRoutes().registerRoutes(router);
    AuditLogsRoutes(_tbContext).registerRoutes();
    CustomerRoutes(_tbContext).registerRoutes();
    TenantRoutes(_tbContext).registerRoutes();
    NotificationRoutes(_tbContext).registerRoutes();
    UrlPageRoutes(_tbContext).registerRoutes();
    NoAuthRoutes(_tbContext).registerRoutes();
    MoreRoutes(_tbContext).registerRoutes();
    VersionRoutes(_tbContext).registerRoutes();
    EspProvisioningRoute(tbContext).registerRoutes();
  }

  final router = FluroRouter.appRouter;

  late final _tbContext = TbContext(router);

  TbContext get tbContext => _tbContext;
}

abstract class TbRoutes {
  TbRoutes(this._tbContext);

  final TbContext _tbContext;

  void registerRoutes() {
    doRegisterRoutes(_tbContext.router);
  }

  void doRegisterRoutes(FluroRouter router);

  TbContext get tbContext => _tbContext;
}
