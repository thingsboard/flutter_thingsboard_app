import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/fullscreen_dashboard_page.dart';

import 'dashboard_page.dart';

class DashboardRoutes extends TbRoutes {
  late var dashboardsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DashboardsPage(tbContext);
  });

  late var dashboardDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    var fullscreen = params['fullscreen']?.first == 'true';
    var dashboardTitle = params['title']?.first;
    var state = params['state']?.first;
    return DashboardPage(tbContext,
        dashboardId: params["id"]![0],
        fullscreen: fullscreen,
        dashboardTitle: dashboardTitle,
        state: state);
  });

  late var fullscreenDashboardHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return FullscreenDashboardPage(tbContext, params["id"]![0]);
  });

  DashboardRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/dashboards", handler: dashboardsHandler);
    router.define("/dashboard/:id", handler: dashboardDetailsHandler);
    router.define("/fullscreenDashboard/:id",
        handler: fullscreenDashboardHandler);
  }
}
