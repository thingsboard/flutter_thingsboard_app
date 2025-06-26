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
  final router = FluroRouter();
  final IOverlayService overlayService;
  late final _tbContext = TbContext(router);
  final TbLogger log= getIt<TbLogger>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
    closeDashboard = true,
    TransitionType? transition,
    Duration? transitionDuration,
    bool restoreDashboard = true,
    RouteSettings? routeSettings,
  }) async {
    if (transition != TransitionType.nativeModal) {
      transition = TransitionType.none;
    } else if (transition == null) {
      if (replace) {
        transition = TransitionType.fadeIn;
      } else {
        transition = TransitionType.native;
      }
    }
    overlayService.hideNotification();
    if (navigatorKey.currentContext == null) {
      return;
    }

      return router.navigateTo(
        navigatorKey.currentContext!,
        path,
        transition: transition,
        transitionDuration: transitionDuration,
        replace: replace,
        clearStack: clearStack,
        routeSettings: routeSettings,
      );
    
  }
void pop<T>([T? result, BuildContext? context]) async {
    var targetContext = context ?? navigatorKey.currentContext;
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
  }) async {
    return router.navigateTo(
      navigatorKey.currentContext!,
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
  ThingsboardAppRouter({required this.overlayService}) {
    router.notFoundHandler = notFoundHandler;
    _initRoutes();
  }
  final notFoundHandler = Handler(
    handlerFunc: (context, params) {
      final settings = context!.settings;
      return RouteNotFoundWidget(settings: settings);
    },
  );
  void _initRoutes() {
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
    EspProvisioningRoute(tbContext).registerRoutes();
  }

  TbContext get tbContext => _tbContext;
}
