import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/di/dashboards_di.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_back_handler.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage(this.dashboard, {super.key});
  final HomeDashboardInfo dashboard;

  @override
  State<StatefulWidget> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboardPage> {
  final key = UniqueKey().toString();
  @override
  void initState() {
    super.initState();

    DashboardsDi.init(key, tbClient: getIt<ITbClientService>().client);
  }

  @override
  void dispose() {
    DashboardsDi.dispose(key);
    super.dispose();
  }

  bool _loaded = false;
  DashboardController? _dashboardController;
  ValueNotifier<bool> canGoback = ValueNotifier<bool>(false);
  late final home =
      '${getIt<IEndpointService>().getCachedEndpoint()}/dashboards/${widget.dashboard.dashboardId!}${(widget.dashboard.hideDashboardToolbar ?? false) ? '?hideToolbar=true' : ''}';

  Future<void> _handleBack() async {
    if (await DashboardBackHandler.tryNavigateBack(_dashboardController)) {
      return;
    }
    await SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return DashboardsAppbar(
          leading:
              value
                  ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _handleBack,
                  )
                  : null,

          dashboardState: true,
          body: DashboardBackHandler(
            onBack: _handleBack,
            child: DashboardWidget(
              onUrlChanged: () async {
                final url = await _dashboardController?.controller?.getUrl();
                if (url.toString() == home) {
                  canGoback.value = false;
                  return;
                }
                final newVal =
                    await _dashboardController?.controller?.canGoBack() ?? false;
                canGoback.value = newVal;
              },
              controllerCallback: (controller, loadingCtrl) async {
                _dashboardController = controller;

                if (_loaded) {
                  final canGoBack =
                      await _dashboardController?.controller?.canGoBack();
                  canGoback.value = canGoBack ?? false;
                  return;
                }
                await controller.openDashboard(
                  widget.dashboard.dashboardId!.id!,
                  hideToolbar: widget.dashboard.hideDashboardToolbar,
                );

                setState(() {
                  _loaded = true;
                });
              },
            ),
          ),
        );
      },
      valueListenable: canGoback,
    );
  }
}
