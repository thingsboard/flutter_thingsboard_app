import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class HomeDashboardPage extends TbContextWidget {
  final HomeDashboardInfo dashboard;

  HomeDashboardPage(TbContext tbContext, this.dashboard, {super.key})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends TbContextState<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DashboardsAppbar(
      tbContext: tbContext,
      dashboardState: true,
      body: DashboardWidget(
        tbContext,
        home: true,
        controllerCallback: (controller, _) {
          controller.openDashboard(
            widget.dashboard.dashboardId!.id!,
            hideToolbar: widget.dashboard.hideDashboardToolbar,
            home: true,
          );
        },
      ),
    );
  }
}
