import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/dashboard.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class MainDashboardPageController {
  DashboardController? _dashboardController;
  _MainDashboardPageState? _mainDashboardPageState;

  _setMainDashboardPageState(_MainDashboardPageState state) {
    _mainDashboardPageState = state;
  }

  _setDashboardController(DashboardController controller) {
    _dashboardController = controller;
  }

  Future<bool> dashboardGoBack() {
    if (_dashboardController != null) {
      return _dashboardController!.goBack();
    } else {
      return Future.value(true);
    }
  }

  Future<void> openDashboard(String dashboardId,
      {String? dashboardTitle, String? state, bool? hideToolbar}) async {
    if (dashboardTitle != null) {
      _mainDashboardPageState?._updateTitle(dashboardTitle);
    }
    await _dashboardController?.openDashboard(dashboardId,
        state: state, hideToolbar: hideToolbar);
  }

  Future<void> activateDashboard() async {
    await _dashboardController?.activateDashboard();
  }

  Future<void> deactivateDashboard() async {
    await _dashboardController?.deactivateDashboard();
  }
}

class MainDashboardPage extends TbContextWidget {
  final String? _dashboardTitle;
  final MainDashboardPageController? _controller;

  MainDashboardPage(TbContext tbContext,
      {MainDashboardPageController? controller, String? dashboardTitle})
      : _controller = controller,
        _dashboardTitle = dashboardTitle,
        super(tbContext);

  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends TbContextState<MainDashboardPage>
    with TickerProviderStateMixin {
  late ValueNotifier<String> dashboardTitleValue;
  final ValueNotifier<bool> hasRightLayout = ValueNotifier(false);
  DashboardController? _dashboardController;
  late final Animation<double> rightLayoutMenuAnimation;
  late final AnimationController rightLayoutMenuController;

  @override
  void initState() {
    super.initState();
    rightLayoutMenuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    rightLayoutMenuAnimation = CurvedAnimation(
        curve: Curves.linear, parent: rightLayoutMenuController);
    if (widget._controller != null) {
      widget._controller!._setMainDashboardPageState(this);
    }
    dashboardTitleValue = ValueNotifier(widget._dashboardTitle ?? 'Dashboard');
  }

  @override
  void dispose() {
    rightLayoutMenuController.dispose();
    super.dispose();
  }

  _updateTitle(String newTitle) {
    dashboardTitleValue.value = newTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TbAppBar(
          tbContext,
          leading: BackButton(onPressed: () {
            maybePop();
          }),
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
            ValueListenableBuilder<bool>(
                valueListenable: hasRightLayout,
                builder: (context, _hasRightLayout, widget) {
                  if (_hasRightLayout) {
                    return IconButton(
                        onPressed: () =>
                            _dashboardController?.toggleRightLayout(),
                        icon: AnimatedIcon(
                            progress: rightLayoutMenuAnimation,
                            icon: AnimatedIcons.menu_close));
                  } else {
                    return SizedBox.shrink();
                  }
                })
          ],
        ),
        body: Dashboard(tbContext, activeByDefault: false,
            titleCallback: (title) {
          dashboardTitleValue.value = title;
        }, controllerCallback: (controller) {
          _dashboardController = controller;
          if (widget._controller != null) {
            widget._controller!._setDashboardController(controller);
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
          }
        }));
  }
}
