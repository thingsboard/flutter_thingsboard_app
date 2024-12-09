import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class FullscreenDashboardPage extends TbPageWidget {
  final String fullscreenDashboardId;
  final String? _dashboardTitle;

  FullscreenDashboardPage(
    super.tbContext,
    this.fullscreenDashboardId, {
    super.key,
    String? dashboardTitle,
  }) : _dashboardTitle = dashboardTitle;

  @override
  State<StatefulWidget> createState() => _FullscreenDashboardPageState();
}

class _FullscreenDashboardPageState
    extends TbPageState<FullscreenDashboardPage> {
  late ValueNotifier<String> dashboardTitleValue;
  final showBackValue = ValueNotifier<bool>(false);

  DashboardController? _dashboardController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<bool>(
          valueListenable: showBackValue,
          builder: (context, canGoBack, widget) {
            return TbAppBar(
              tbContext,
              leading: BackButton(
                onPressed: () async {
                  if (_dashboardController?.rightLayoutOpened.value == true) {
                    await _dashboardController?.toggleRightLayout();
                    return;
                  }

                  final controller = _dashboardController?.controller;
                  if (await controller?.canGoBack() == true) {
                    await controller?.goBack();
                  }
                },
              ),
              showLoadingIndicator: false,
              elevation: 1,
              shadowColor: Colors.transparent,
              title: ValueListenableBuilder<String>(
                valueListenable: dashboardTitleValue,
                builder: (context, title, widget) {
                  return FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(title),
                  );
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => navigateTo('/profile?fullscreen=true'),
                ),
              ],
              canGoBack: canGoBack,
            );
          },
        ),
      ),
      body: ValueListenableBuilder<String?>(
        valueListenable: getIt<IEndpointService>().listenEndpointChanges,
        builder: (context, _, __) => DashboardWidget(
          tbContext,
          titleCallback: (title) {
            dashboardTitleValue.value = title;
          },
          controllerCallback: (controller, _) {
            _dashboardController = controller;

            controller.canGoBack.addListener(() {
              _onCanGoBack(controller.canGoBack.value);
            });
            controller.openDashboard(
              widget.fullscreenDashboardId,
              fullscreen: true,
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dashboardTitleValue = ValueNotifier(widget._dashboardTitle ?? 'Dashboard');
  }

  @override
  void dispose() {
    dashboardTitleValue.dispose();
    showBackValue.dispose();
    super.dispose();
  }

  _onCanGoBack(bool canGoBack) {
    showBackValue.value = canGoBack;
  }
}
