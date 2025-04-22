import 'package:flutter/material.dart';
import 'package:thingsboard_app/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class SingleDashboardView extends StatefulWidget {
  const SingleDashboardView({
    required this.id,
    this.title,
    this.state,
    this.hideToolbar,
    super.key,
  });

  final String id;
  final String? title;
  final String? state;
  final bool? hideToolbar;

  @override
  State<StatefulWidget> createState() => _SingleDashboardViewState();
}

class _SingleDashboardViewState extends State<SingleDashboardView>
    with TickerProviderStateMixin {
  final dashboardTitleValue = ValueNotifier<String>('Dashboard');
  final hasRightLayout = ValueNotifier(false);
  bool canGoBack = false;

  late final Animation<double> rightLayoutMenuAnimation;
  late final AnimationController rightLayoutMenuController;

  DashboardController? _dashboardController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
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
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
        ),
        elevation: 1,
        shadowColor: Colors.transparent,
        title: ValueListenableBuilder<String>(
          valueListenable: dashboardTitleValue,
          builder: (context, title, widget) {
            return Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
        canGoBack: canGoBack,
      ),
      body: SafeArea(
        child: DashboardWidget(
          titleCallback: (title) {
            dashboardTitleValue.value = widget.title ?? title;
          },
          controllerCallback: (controller, _) {
            _dashboardController = controller;
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

            controller.canGoBack.addListener(() {
              setState(() {
                canGoBack = controller.canGoBack.value;
              });
            });

            controller.openDashboard(
              widget.id,
              state: widget.state,
              hideToolbar: widget.hideToolbar,
            );
          },
        ),
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

    if (widget.title != null) {
      dashboardTitleValue.value = widget.title!;
    }
  }

  @override
  void dispose() {
    rightLayoutMenuController.dispose();
    _dashboardController?.canGoBack.dispose();
    super.dispose();
  }
}
