import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';


const Map<AlarmSeverity, Color> alarmSeverityColors = {
  AlarmSeverity.CRITICAL: Color(0xFFFF0000),
  AlarmSeverity.MAJOR: Color(0xFFFFA500),
  AlarmSeverity.MINOR: Color(0xFFFFCA3D),
  AlarmSeverity.WARNING: Color(0xFFABAB00),
  AlarmSeverity.INDETERMINATE: Color(0xFF00FF00),
};

const Map<AlarmSeverity, String> alarmSeverityTranslations = {
  AlarmSeverity.CRITICAL: 'Critical',
  AlarmSeverity.MAJOR: 'Major',
  AlarmSeverity.MINOR: 'Minor',
  AlarmSeverity.WARNING: 'Warning',
  AlarmSeverity.INDETERMINATE: 'Indeterminate',
};

const Map<AlarmStatus, String> alarmStatusTranslations = {
  AlarmStatus.ACTIVE_ACK: 'Active Acknowledged',
  AlarmStatus.ACTIVE_UNACK: 'Active Unacknowledged',
  AlarmStatus.CLEARED_ACK: 'Cleared Acknowledged',
  AlarmStatus.CLEARED_UNACK: 'Cleared Unacknowledged',
};

mixin AlarmsBase on EntitiesBase<AlarmInfo, AlarmQuery> {

  @override
  String get title => 'Alarms';

  @override
  String get noItemsFoundText => 'No alarms found';

  @override
  Future<PageData<AlarmInfo>> fetchEntities(AlarmQuery query) {
    return tbClient.getAlarmService().getAllAlarms(query);
  }

  @override
  void onEntityTap(AlarmInfo alarm) {
    showErrorNotification('Balalai: alarm tap not implemented!');
  }

  @override
  Widget buildEntityListCard(BuildContext context, AlarmInfo alarm) {
    return _buildEntityListCard(context, alarm);
  }

  Widget _buildEntityListCard(BuildContext context, AlarmInfo alarm) {
    return AlarmCard(tbContext, alarm: alarm);
  }
}

class AlarmQueryController extends PageKeyController<AlarmQuery> {

  AlarmQueryController({int pageSize = 20, String? searchText}) : super(AlarmQuery(TimePageLink(pageSize, 0, searchText, SortOrder('createdTime', Direction.DESC)), fetchOriginator: true));

  @override
  AlarmQuery nextPageKey(AlarmQuery pageKey) {
    return AlarmQuery(pageKey.pageLink.nextPageLink());
  }

  onSearchText(String searchText) {
    var query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;
    notifyListeners();
  }

}

class AlarmCard extends TbContextWidget<AlarmCard, _AlarmCardState> {

  final AlarmInfo alarm;

  AlarmCard(TbContext tbContext, {required this.alarm}) : super(tbContext);

  @override
  _AlarmCardState createState() => _AlarmCardState(alarm);

}

class _AlarmCardState extends TbContextState<AlarmCard, _AlarmCardState> {

  bool loading = false;
  AlarmInfo alarm;

  final entityDateFormat = DateFormat('yyyy-MM-dd');

  _AlarmCardState(this.alarm): super();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(AlarmCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.loading = false;
    this.alarm = widget.alarm;
  }

  @override
  Widget build(BuildContext context) {
    if (this.loading) {
      return Container( height: 134, alignment: Alignment.center, child: RefreshProgressIndicator());
    } else {
      return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child:
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: AutoSizeText(alarm.type,
                                        maxLines: 2,
                                        minFontSize: 8,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color(0xFF282828),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 20 / 14)
                                    )
                                ),
                                Text(alarmSeverityTranslations[alarm.severity]!,
                                    style: TextStyle(
                                        color: alarmSeverityColors[alarm.severity]!,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 16 / 12)
                                )
                              ]
                          ),
                          SizedBox(height: 4),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(alarm.originatorName != null ? alarm.originatorName! : '',
                                        style: TextStyle(
                                            color: Color(0xFFAFAFAF),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            height: 16 / 12)
                                    )
                                ),
                                Text(entityDateFormat.format(DateTime.fromMillisecondsSinceEpoch(alarm.createdTime!)),
                                    style: TextStyle(
                                        color: Color(0xFFAFAFAF),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        height: 16 / 12)
                                )
                              ]
                          ),
                          SizedBox(height: 22),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(alarmStatusTranslations[alarm.status]!,
                                      style: TextStyle(
                                          color: Color(0xFF282828),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          height: 20 / 14)
                                  )
                              ),
                              Row(
                                children: [
                                  if ([AlarmStatus.CLEARED_UNACK, AlarmStatus.ACTIVE_UNACK].contains(alarm.status))
                                    CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Color(0xffF0F4F9),
                                        child: IconButton(icon: Icon(Icons.done), padding: EdgeInsets.all(6.0), onPressed: () => _ackAlarm(alarm))
                                    ),
                                  if ([AlarmStatus.ACTIVE_UNACK, AlarmStatus.ACTIVE_ACK].contains(alarm.status))
                                    Row(
                                        children: [
                                          SizedBox(width: 4),
                                          CircleAvatar(
                                              radius: 24,
                                              backgroundColor: Color(0xffF0F4F9),
                                              child: IconButton(icon: Icon(Icons.clear), padding: EdgeInsets.all(6.0), onPressed: () => _clearAlarm(alarm))
                                          )
                                        ]
                                    )
                                ],
                              )
                            ],
                          )

                        ]
                    )
                )

            )
          ]
      );
    }
  }

  _clearAlarm(AlarmInfo alarm) async {
    var res = await confirm(title: 'Clear Alarm', message: 'Are you sure you want to clear Alarm?', cancel: 'No', ok: 'Yes');
    if (res != null && res) {
      setState(() {
        loading = true;
      });
      await tbClient.getAlarmService().clearAlarm(alarm.id!.id!);
      var newAlarm = await tbClient.getAlarmService().getAlarmInfo(
          alarm.id!.id!);
      setState(() {
        loading = false;
        this.alarm = newAlarm;
      });
    }
  }

  _ackAlarm(AlarmInfo alarm) async {
    var res = await confirm(title: 'Acknowledge Alarm', message: 'Are you sure you want to acknowledge Alarm?', cancel: 'No', ok: 'Yes');
    if (res != null && res) {
      setState(() {
        loading = true;
      });
      await tbClient.getAlarmService().ackAlarm(alarm.id!.id!);
      var newAlarm = await tbClient.getAlarmService().getAlarmInfo(
          alarm.id!.id!);
      setState(() {
        loading = false;
        this.alarm = newAlarm;
      });
    }
  }

}
