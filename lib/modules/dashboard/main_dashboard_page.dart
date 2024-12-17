import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class MainDashboardPage extends TbContextWidget {
  MainDashboardPage(
    TbContext tbContext, {
    required this.controller,
    super.key,
  }) : super(tbContext);

  final DashboardPageController controller;

  @override
  State<StatefulWidget> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends TbContextState<MainDashboardPage>
    with TickerProviderStateMixin {
  final dashboardTitleValue = ValueNotifier('Dashboard');
  final hasRightLayout = ValueNotifier(false);

  late final Animation<double> rightLayoutMenuAnimation;
  late final AnimationController rightLayoutMenuController;

  DashboardController? _dashboardController;
  ValueNotifier<bool>? _dashboardLoadingCtrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
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
            } else {
              widget.controller.closeDashboard().then(
                    (_) => _dashboardLoadingCtrl?.value = true,
                  );
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
          ValueListenableBuilder<bool>(
            valueListenable: hasRightLayout,
            builder: (context, hasRightLayout, widget) {
              if (hasRightLayout) {
                return IconButton(
                  onPressed: () => _dashboardController?.toggleRightLayout(),
                  icon: AnimatedIcon(
                    progress: rightLayoutMenuAnimation,
                    icon: AnimatedIcons.menu_close,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
        canGoBack: true,
      ),
      body: ValueListenableBuilder<String?>(
        valueListenable: getIt<IEndpointService>().listenEndpointChanges,
        builder: (context, value, _) {
          return SafeArea(
            bottom: false,
            child: DashboardWidget(
              tbContext,
              titleCallback: (title) {
                dashboardTitleValue.value = title;
              },
              pageController: widget.controller,
              controllerCallback: (controller, loadingCtrl) {
                _dashboardController = controller;
                _dashboardLoadingCtrl = loadingCtrl;
                widget.controller.setDashboardController(controller);

                controller.hasRightLayout.addListener(() {
                  hasRightLayout.value = controller.hasRightLayout.value;
                });
                controller.rightLayoutOpened.addListener(() {
                  if (controller.rightLayoutOpened.value) {
                    rightLayoutMenuController.forward();
                  } else {
                    rightLayoutMenuController.reverse();
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    rightLayoutMenuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    rightLayoutMenuAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: rightLayoutMenuController,
    );

    widget.controller.setDashboardTitleNotifier(dashboardTitleValue);
  }

  @override
  void dispose() {
    rightLayoutMenuController.dispose();
    super.dispose();
  }
}
