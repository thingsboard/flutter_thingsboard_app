import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/fullscreen_dashboard_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';

class DashboardRoutes {
  static const dashboards = '/dashboards';
  static const dashboard = '/dashboard';
  static const fullscreenDashboard = '/fullscreenDashboard';
}

// Dashboard routes
final dashboardRoutes = [
  GoRoute(
    path: DashboardRoutes.dashboards,
    builder: (context, state) => const DashboardsPage(),
  ),

  GoRoute(
    path: DashboardRoutes.dashboard,
    builder: (context, state) {
      final args = state.extra! as DashboardArgumentsEntity;
   
      return SingleDashboardView(
        id: args.id,
        title: args.title,
        state: args.state,
        hideToolbar: args.hideToolbar,
        
      );
    },
  ),

  GoRoute(
    path: '${DashboardRoutes.dashboard}/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;

      return SingleDashboardView(id: id);
    },
  ),

  GoRoute(
    path: '${DashboardRoutes.fullscreenDashboard}/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;

      return FullscreenDashboardPage(id);
    },
  ),
];
