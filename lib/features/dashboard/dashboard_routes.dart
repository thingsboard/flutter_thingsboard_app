import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/features/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/features/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/features/dashboard/presentation/view/fullscreen_dashboard_page.dart';
import 'package:thingsboard_app/features/dashboard/presentation/view/single_dashboard_view.dart';

class DashboardRoutes implements ITbRoutes {
  late final dashboardsHandler = Handler(
    handlerFunc: (context, params) {
      return const DashboardsPage();
    },
  );

  late final dashboardHandler = Handler(
    handlerFunc: (context, params) {
      final args = context?.settings?.arguments as DashboardArgumentsEntity;

      return SingleDashboardView(
        id: args.id,
        title: args.title,
        state: args.state,
        hideToolbar: args.hideToolbar,
      );
    },
  );

  late final fullscreenDashboardHandler = Handler(
    handlerFunc: (context, params) {
      return FullscreenDashboardPage(params['id']![0]);
    },
  );

  late final singleDashboard = Handler(
    handlerFunc: (context, parameters) {
      return SingleDashboardView(id: parameters['id']![0]);
    },
  );

  @override
  void registerRoutes(FluroRouter router) {
    router
      ..define('/dashboards', handler: dashboardsHandler)
      ..define('/dashboard', handler: dashboardHandler)
      ..define('/fullscreenDashboard/:id', handler: fullscreenDashboardHandler)
      ..define('/dashboard/:id', handler: singleDashboard);
  }
}
