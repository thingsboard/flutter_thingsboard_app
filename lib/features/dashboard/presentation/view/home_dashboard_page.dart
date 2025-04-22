import 'package:flutter/material.dart';
import 'package:thingsboard_app/features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/features/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage(
    this.dashboard, {
    required this.isSysAdmin,
    super.key,
  });

  final HomeDashboardInfo dashboard;
  final bool isSysAdmin;

  @override
  Widget build(BuildContext context) {
    return DashboardsAppbar(
      dashboardState: true,
      isSysAdmin: isSysAdmin,
      body: DashboardWidget(
        home: true,
        controllerCallback: (controller, _) {
          controller.openDashboard(
            dashboard.dashboardId!.id!,
            hideToolbar: dashboard.hideDashboardToolbar,
            home: true,
          );
        },
      ),
    );
  }
}
