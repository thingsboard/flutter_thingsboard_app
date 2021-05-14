import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'alarms_list.dart';

class AlarmsPage extends TbContextWidget<AlarmsPage, _AlarmsPageState> {

  AlarmsPage(TbContext tbContext) : super(tbContext);

  @override
  _AlarmsPageState createState() => _AlarmsPageState();

}

class _AlarmsPageState extends TbContextState<AlarmsPage, _AlarmsPageState> {

  @override
  Widget build(BuildContext context) {
    var alarmsList = AlarmsList(tbContext);
    return Scaffold(
        appBar: TbAppBar(
            tbContext,
            title: Text(alarmsList.title)
        ),
        body: alarmsList
    );
  }

}
