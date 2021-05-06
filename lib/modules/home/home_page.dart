import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/entity/entities_widget.dart';
import 'package:thingsboard_app/modules/asset/assets_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_widget.dart';
import 'package:thingsboard_app/modules/device/devices_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard.dart' as dashboardUi;

class HomePage extends TbContextWidget<HomePage, _HomePageState> {

  HomePage(TbContext tbContext) : super(tbContext);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends TbContextState<HomePage, _HomePageState> {

  final EntitiesWidgetController _entitiesWidgetController = EntitiesWidgetController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _entitiesWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeDashboard = tbContext.homeDashboard;
    var dashboardState = homeDashboard != null;
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        showLoadingIndicator: !dashboardState,
        elevation: dashboardState ? 0 : null,
        title: const Text('Home'),
      ),
      body: Builder(
          builder: (context) {
            if (dashboardState) {
              return _buildDashboardHome(context, homeDashboard!);
            } else {
              return _buildDefaultHome(context);
            }
          }
      ),
    );
  }

  Widget _buildDashboardHome(BuildContext context, HomeDashboardInfo dashboard) {
    return dashboardUi.Dashboard(tbContext, dashboardId: dashboard.dashboardId!.id!,
        fullscreen: false, home: true, hideToolbar: dashboard.hideDashboardToolbar);
  }

  Widget _buildDefaultHome(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => _entitiesWidgetController.refresh(),
        child: ListView(
          children: _buildUserHome(context)
        )
    );
  }

  List<Widget> _buildUserHome(BuildContext context) {
    if (tbClient.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else if (tbClient.isTenantAdmin()) {
      return _buildTenantAdminHome(context);
    } else {
      return _buildCustomerUserHome(context);
    }
  }

  List<Widget> _buildSysAdminHome(BuildContext context) {
    return [Container(child: Text('TODO: Implement'))];
  }

  List<Widget> _buildTenantAdminHome(BuildContext context) {
    return [
      AssetsWidget(tbContext, controller: _entitiesWidgetController),
      DevicesWidget(tbContext, controller: _entitiesWidgetController),
      DashboardsWidget(tbContext, controller: _entitiesWidgetController)
    ];
  }

  List<Widget> _buildCustomerUserHome(BuildContext context) {
    return [
      AssetsWidget(tbContext, controller: _entitiesWidgetController),
      DevicesWidget(tbContext, controller: _entitiesWidgetController),
      DashboardsWidget(tbContext, controller: _entitiesWidgetController)
    ];
  }
}
