import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/widgets/app_bar_painter.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'alarms_list.dart';

class AlarmsPage extends TbContextWidget {
  final bool searchMode;

  AlarmsPage(TbContext tbContext, {this.searchMode = false}) : super(tbContext);

  @override
  _AlarmsPageState createState() => _AlarmsPageState();
}

class _AlarmsPageState extends TbContextState<AlarmsPage>
    with AutomaticKeepAliveClientMixin<AlarmsPage> {
  final AlarmQueryController _alarmQueryController = AlarmQueryController();

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var alarmsList = AlarmsList(tbContext, _alarmQueryController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) =>
            _alarmQueryController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(tbContext, title: Text(alarmsList.title), actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            navigateTo('/alarms?search=true');
          },
        )
      ]);
    }
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color(0xfff1f2fa),
      body: Stack(
        children: [
          alarmsList,
          CustomPaint(
            painter: AppBarPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _alarmQueryController.dispose();
    super.dispose();
  }
}
