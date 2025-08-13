import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/route_not_found_widget.dart';
import 'package:thingsboard_app/core/auth/auth_routes.dart';
import 'package:thingsboard_app/core/auth/noauth/routes/noauth_routes.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/init/init_routes.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/alarm_routes.dart';
import 'package:thingsboard_app/modules/asset/asset_routes.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_routes.dart';
import 'package:thingsboard_app/modules/customer/customer_routes.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard_routes.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/modules/device/device_routes.dart';
import 'package:thingsboard_app/modules/device/provisioning/route/esp_provisioning_route.dart';
import 'package:thingsboard_app/modules/home/home_routes.dart';
import 'package:thingsboard_app/modules/main/main_routes.dart';
import 'package:thingsboard_app/modules/more/more_routes.dart';
import 'package:thingsboard_app/modules/notification/routes/notification_routes.dart';
import 'package:thingsboard_app/modules/profile/profile_routes.dart';
import 'package:thingsboard_app/modules/tenant/tenant_routes.dart';
import 'package:thingsboard_app/modules/url/url_routes.dart';
import 'package:thingsboard_app/modules/version/route/version_route.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/ui_utils_routes.dart';

class ThingsboardAppRouter {
  ThingsboardAppRouter({
    required this.overlayService,
    required TbContext tbContext,
  }) : _tbContext = tbContext {
    router.notFoundHandler = notFoundHandler;
    _initRoutes();
  }
  final router = FluroRouter();
  final IOverlayService overlayService;
  final TbLogger log = getIt<TbLogger>();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final TbContext _tbContext;
  Future<T?> navigateTo<T>(
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool closeDashboard = true,
    TransitionType? transition,
    Duration? transitionDuration,
    bool restoreDashboard = true,
    RouteSettings? routeSettings,
  }) async {
    TransitionType transitionToUse = TransitionType.none;
    if (transition != TransitionType.nativeModal) {
      transitionToUse = TransitionType.none;
    }
    if (transition == null) {
      if (replace) {
        transitionToUse = TransitionType.fadeIn;
      } else {
        transitionToUse = TransitionType.native;
      }
    }
    overlayService.hideNotification();
    if (navigatorKey.currentContext == null) {
      return null;
    }

    final result = await router.navigateTo(
      navigatorKey.currentContext!,
      path,
      transition: transitionToUse,
      transitionDuration: transitionDuration,
      replace: replace,
      clearStack: clearStack,
      routeSettings: routeSettings,
    );
    return result as T?;
  }

 

  Future<void> pop<T>([T? result, BuildContext? context]) async {
    final targetContext = context ?? _navigatorKey.currentContext;
    if (targetContext != null) {
      router.pop<T>(targetContext, result);
    }
  }

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  })  {
    return router.navigateTo(
      _navigatorKey.currentContext!,
      '/dashboard',
      routeSettings: RouteSettings(
        arguments: DashboardArgumentsEntity(
          dashboardId,
          title: dashboardTitle,
          state: state,
          hideToolbar: hideToolbar,
          animate: animate,
        ),
      ),
    );
  }

  Future<void> navigateByAppLink(String? link) async {
    if (link != null) {
      final uri = Uri.parse(link);
      await getIt<ILocalDatabaseService>().deleteInitialAppLink();
      log.debug('TbContext: navigate by appLink $uri');
      navigateTo(
        uri.path,
        routeSettings: RouteSettings(
          arguments: {...uri.queryParameters, 'uri': uri},
        ),
      );
    }
  }

  final notFoundHandler = Handler(
    handlerFunc: (context, params) {
      final settings = context!.settings;
      return RouteNotFoundWidget(settings: settings);
    },
  );
  void _initRoutes() {
    InitRoutes(_tbContext).doRegisterRoutes(router);
    AuthRoutes(_tbContext).doRegisterRoutes(router);
    UiUtilsRoutes(_tbContext).doRegisterRoutes(router);
    MainRoutes(_tbContext).doRegisterRoutes(router);
    HomeRoutes(_tbContext).doRegisterRoutes(router);
    ProfileRoutes(_tbContext).doRegisterRoutes(router);
    AssetRoutes(_tbContext).doRegisterRoutes(router);
    DeviceRoutes(_tbContext).doRegisterRoutes(router);
    AlarmRoutes(_tbContext).doRegisterRoutes(router);
    DashboardRoutes(_tbContext).doRegisterRoutes(router);
    AuditLogsRoutes(_tbContext).doRegisterRoutes(router);
    CustomerRoutes(_tbContext).doRegisterRoutes(router);
    TenantRoutes(_tbContext).doRegisterRoutes(router);
    NotificationRoutes(_tbContext).doRegisterRoutes(router);
    UrlPageRoutes(_tbContext).doRegisterRoutes(router);
    NoAuthRoutes(_tbContext).doRegisterRoutes(router);
    MoreRoutes(_tbContext).doRegisterRoutes(router);
    VersionRoutes(_tbContext).doRegisterRoutes(router);
    EspProvisioningRoute(_tbContext).doRegisterRoutes(router);
  }

  TbContext get tbContext => _tbContext;
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
