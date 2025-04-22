import 'package:flutter/material.dart';
import 'package:thingsboard_app/features/dashboard/di/dashboards_di.dart';
import 'package:thingsboard_app/features/dashboard/main_dashboard_page.dart';
import 'package:thingsboard_app/features/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/features/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/features/dashboard/presentation/widgets/dashboards_grid.dart';
import 'package:thingsboard_app/widgets/two_page_view.dart';

class DashboardsPage extends StatefulWidget {
  const DashboardsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardsPageState();
}

class _DashboardsPageState extends State<DashboardsPage> {
  final pageViewCtrl = TwoPageViewController();
  late final DashboardPageController dashboardPageCtrl;

  late final String diKey;

  @override
  Widget build(BuildContext context) {
    return TwoPageView(
      controller: pageViewCtrl,
      first: DashboardsAppbar(
        body: DashboardsGridWidget(
          dashboardPageCtrl: dashboardPageCtrl,
        ),
      ),
      second: MainDashboardPage(
        controller: dashboardPageCtrl,
      ),
    );
  }

  @override
  void initState() {
    diKey = UniqueKey().toString();
    DashboardsDi.init(diKey);
    dashboardPageCtrl = DashboardPageController(pageCtrl: pageViewCtrl);
    super.initState();
  }

  @override
  void dispose() {
    DashboardsDi.dispose(diKey);
    super.dispose();
  }
}
