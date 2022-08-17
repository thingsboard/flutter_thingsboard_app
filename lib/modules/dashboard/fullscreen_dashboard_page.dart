import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class FullscreenDashboardPage extends TbPageWidget {
  final String fullscreenDashboardId;
  final String? _dashboardTitle;

  FullscreenDashboardPage(TbContext tbContext, this.fullscreenDashboardId,
      {String? dashboardTitle})
      : _dashboardTitle = dashboardTitle,
        super(tbContext);

  @override
  _FullscreenDashboardPageState createState() =>
      _FullscreenDashboardPageState();
}

class _FullscreenDashboardPageState
    extends TbPageState<FullscreenDashboardPage> {
  late ValueNotifier<String> dashboardTitleValue;
  final ValueNotifier<bool> showBackValue = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    dashboardTitleValue = ValueNotifier(widget._dashboardTitle ?? 'Dashboard');
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onCanGoBack(bool canGoBack) {
    showBackValue.value = canGoBack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<bool>(
              valueListenable: showBackValue,
              builder: (context, canGoBack, widget) {
                return TbAppBar(tbContext,
                    leading: canGoBack
                        ? BackButton(onPressed: () {
                            maybePop();
                          })
                        : null,
                    showLoadingIndicator: false,
                    elevation: 1,
                    shadowColor: Colors.transparent,
                    title: ValueListenableBuilder<String>(
                      valueListenable: dashboardTitleValue,
                      builder: (context, title, widget) {
                        return FittedBox(
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.centerLeft,
                            child: Text(title));
                      },
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () =>
                              navigateTo('/profile?fullscreen=true'))
                    ]);
              }),
        ),
        body: Dashboard(tbContext, titleCallback: (title) {
          dashboardTitleValue.value = title;
        }, controllerCallback: (controller) {
          controller.canGoBack.addListener(() {
            _onCanGoBack(controller.canGoBack.value);
          });
          controller.openDashboard(widget.fullscreenDashboardId,
              fullscreen: true);
        }));
  }
}
