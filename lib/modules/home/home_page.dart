import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/home_dashboard_page.dart';
import 'package:thingsboard_app/modules/tenant/tenants_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class HomePage extends TbContextWidget {
  HomePage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends TbContextState<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeDashboard = tbContext.homeDashboard;
    if (homeDashboard != null) {
      return _buildDashboardHome(context, homeDashboard);
    } else {
      return _buildDefaultHome(context);
    }
  }

  Widget _buildDashboardHome(
    BuildContext context,
    HomeDashboardInfo dashboard,
  ) {
    return HomeDashboardPage(tbContext, dashboard);
  }

  Widget _buildDefaultHome(BuildContext context) {
    if (tbClient.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else {
      return DashboardsPage(tbContext);
    }
  }

  Widget _buildSysAdminHome(BuildContext context) {
    return TenantsWidget(tbContext);
  }

  @override
  bool get wantKeepAlive => true;
}
