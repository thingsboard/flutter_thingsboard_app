import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Future<void> openDashboard(String dashboardId, {String? dashboardTitle, String? state, bool? hideToolbar}) async {
    if (dashboardTitle != null) {
      _mainDashboardPageState?._updateTitle(dashboardTitle);
    }
    await _dashboardController?.openDashboard(dashboardId, state: state, hideToolbar: hideToolbar);
  }
}

class MainDashboardPage extends TbContextWidget<MainDashboardPage, _MainDashboardPageState> {

  final String? _dashboardTitle;
  final MainDashboardPageController? _controller;

  MainDashboardPage(TbContext tbContext,
      {MainDashboardPageController? controller,
        String? dashboardTitle}):
        _controller = controller,
        _dashboardTitle = dashboardTitle,
        super(tbContext);

  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();

}

class _MainDashboardPageState extends TbContextState<MainDashboardPage, _MainDashboardPageState> {

  late ValueNotifier<String> dashboardTitleValue;

  @override
  void initState() {
    super.initState();
    if (widget._controller != null) {
      widget._controller!._setMainDashboardPageState(this);
    }
    dashboardTitleValue = ValueNotifier(widget._dashboardTitle ?? 'Dashboard');
  }

  @override
  void dispose() {
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
            leading: BackButton(
                onPressed: () {
                  maybePop();
                }
            ),
            showLoadingIndicator: false,
            elevation: 0,
            title: ValueListenableBuilder<String>(
              valueListenable: dashboardTitleValue,
              builder: (context, title, widget) {
                return FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(title)
                );
              },
            )
        ),
        body: Dashboard(
            tbContext,
            titleCallback: (title) {
              dashboardTitleValue.value =  title;
            },
            controllerCallback: (controller) {
              if (widget._controller != null) {
                widget._controller!._setDashboardController(controller);
              }
            }
        )
    );
  }

}
