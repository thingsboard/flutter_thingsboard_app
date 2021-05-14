import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard.dart' as dashboardUi;
import 'package:thingsboard_app/modules/dashboard/dashboards_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class HomePage extends TbContextWidget<HomePage, _HomePageState> {

  HomePage(TbContext tbContext) : super(tbContext);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends TbContextState<HomePage, _HomePageState> {

  final EntitiesListWidgetController _entitiesWidgetController = EntitiesListWidgetController();

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
    if (tbClient.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else {
      return DashboardsGrid(tbContext);
    }
  }

/*  List<Widget> _buildUserHome(BuildContext context) {
    if (tbClient.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else if (tbClient.isTenantAdmin()) {
      return _buildTenantAdminHome(context);
    } else {
      return _buildCustomerUserHome(context);
    }
  } */

  Widget _buildSysAdminHome(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => _entitiesWidgetController.refresh(),
        child: ListView(
            children: [Container(child: Text('TODO: Implement'))]
        )
    );
  }

/*  List<Widget> _buildTenantAdminHome(BuildContext context) {
    return [
      AssetsListWidget(tbContext, controller: _entitiesWidgetController),
      DevicesListWidget(tbContext, controller: _entitiesWidgetController),
      DashboardsListWidget(tbContext, controller: _entitiesWidgetController)
    ];
  }

  List<Widget> _buildCustomerUserHome(BuildContext context) {
    return [
      AssetsListWidget(tbContext, controller: _entitiesWidgetController),
      DevicesListWidget(tbContext, controller: _entitiesWidgetController),
      DashboardsListWidget(tbContext, controller: _entitiesWidgetController)
    ];
  } */
}
