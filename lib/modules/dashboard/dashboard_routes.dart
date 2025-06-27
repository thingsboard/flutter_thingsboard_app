import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/fullscreen_dashboard_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';

class DashboardRoutes extends TbRoutes {
  DashboardRoutes(super.tbContext);

  late final dashboardsHandler = Handler(
    handlerFunc: (context, params) {
      return DashboardsPage(tbContext);
    },
  );

  late final dashboardHandler = Handler(
    handlerFunc: (context, params) {
      final args = context!.settings!.arguments! as DashboardArgumentsEntity;

      return SingleDashboardView(
        tbContext,
        id: args.id,
        title: args.title,
        state: args.state,
        hideToolbar: args.hideToolbar,
      );
    },
  );

  late final fullscreenDashboardHandler = Handler(
    handlerFunc: (context, params) {
      return FullscreenDashboardPage(tbContext, params['id']!.first);
    },
  );

  late final singleDashboard = Handler(
    handlerFunc: (context, parameters) {
      return SingleDashboardView(tbContext, id: parameters['id']![0]);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router
      ..define(
        '/dashboards',
        handler: dashboardsHandler,
      )
      ..define(
        '/dashboard',
        handler: dashboardHandler,
      )
      ..define(
        '/fullscreenDashboard/:id',
        handler: fullscreenDashboardHandler,
      )
      ..define(
        '/dashboard/:id',
        handler: singleDashboard,
      );
  }
}
