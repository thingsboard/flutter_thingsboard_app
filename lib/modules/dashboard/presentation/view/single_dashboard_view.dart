import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class SingleDashboardView extends TbContextWidget {
  SingleDashboardView(
    TbContext tbContext, {
    required this.id,
    this.title,
    this.state,
    this.hideToolbar,
    super.key,
  }) : super(tbContext);

  final String id;
  final String? title;
  final String? state;
  final bool? hideToolbar;

  @override
  State<StatefulWidget> createState() => _SingleDashboardViewState();
}

class _SingleDashboardViewState extends TbContextState<SingleDashboardView>
    with TickerProviderStateMixin {
  final dashboardTitleValue = ValueNotifier<String>('Dashboard');
  final hasRightLayout = ValueNotifier(false);

  late final Animation<double> rightLayoutMenuAnimation;
  late final AnimationController rightLayoutMenuController;

  DashboardController? _dashboardController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        leading: BackButton(onPressed: maybePop),
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
      ),
      body: DashboardWidget(
        tbContext,
        titleCallback: (title) {
          dashboardTitleValue.value = widget.title ?? title;
        },
        controllerCallback: (controller) {
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

          controller.openDashboard(
            widget.id,
            state: widget.state,
            hideToolbar: widget.hideToolbar,
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

    if (widget.title != null) {
      dashboardTitleValue.value = widget.title!;
    }
  }

  @override
  void dispose() {
    rightLayoutMenuController.dispose();
    super.dispose();
  }
}
