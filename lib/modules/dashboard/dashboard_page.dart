import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DashboardPage extends TbPageWidget {
  final String? _dashboardTitle;
  // final String? _dashboardId;
  // final String? _state;
  // final bool? _fullscreen;

  DashboardPage(TbContext tbContext,
      {String? dashboardId,
      bool? fullscreen,
      String? dashboardTitle,
      String? state})
      :
        //    _dashboardId = dashboardId,
        //    _fullscreen = fullscreen,
        _dashboardTitle = dashboardTitle,
        //    _state = state,
        super(tbContext);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends TbPageState<DashboardPage> {
  late ValueNotifier<String> dashboardTitleValue;

  @override
  void initState() {
    super.initState();
    dashboardTitleValue = ValueNotifier(widget._dashboardTitle ?? 'Dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TbAppBar(
          tbContext,
          showLoadingIndicator: false,
          elevation: 0,
          title: ValueListenableBuilder<String>(
            valueListenable: dashboardTitleValue,
            builder: (context, title, widget) {
              return FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.centerLeft,
                  child: Text(title));
            },
          ),
        ),
        body: Text(
            'Deprecated') //Dashboard(tbContext, dashboardId: widget._dashboardId, state: widget._state,
        //fullscreen: widget._fullscreen, titleCallback: (title) {
        //dashboardTitleValue.value =  title;
        //}
        //),
        );
  }
}
