import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmCard extends TbContextWidget {
  final AlarmInfo alarm;

  AlarmCard(TbContext tbContext, {super.key, required this.alarm})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _AlarmCardState();
}

class _AlarmCardState extends TbContextState<AlarmCard> {
  bool loading = false;
  late AlarmInfo alarm;

  final entityDateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    alarm = widget.alarm;
    super.initState();
  }

  @override
  void didUpdateWidget(AlarmCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    loading = false;
    alarm = widget.alarm;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        height: 134,
        alignment: Alignment.center,
        child: const RefreshProgressIndicator(),
      );
    } else {
      bool hasDashboard = alarm.details?['dashboardId'] != null;
      return Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: alarmSeverityColors[alarm.severity]!,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 4),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 16),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: AutoSizeText(
                                      alarm.type,
                                      maxLines: 2,
                                      minFontSize: 8,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF282828),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 20 / 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    entityDateFormat.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        alarm.createdTime!,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFFAFAFAF),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      height: 16 / 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      alarm.originatorName != null
                                          ? alarm.originatorName!
                                          : '',
                                      style: const TextStyle(
                                        color: Color(0xFFAFAFAF),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        height: 16 / 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    alarmSeverityTranslations[alarm.severity]!,
                                    style: TextStyle(
                                      color:
                                          alarmSeverityColors[alarm.severity]!,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      height: 16 / 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (hasDashboard)
                          const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFACACAC),
                          ),
                        if (hasDashboard) const SizedBox(width: 16),
                      ],
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 16),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            alarmStatusTranslations[alarm.status]!,
                            style: const TextStyle(
                              color: Color(0xFF282828),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 20 / 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            if ([
                              AlarmStatus.CLEARED_UNACK,
                              AlarmStatus.ACTIVE_UNACK,
                            ].contains(alarm.status))
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: const Color(0xffF0F4F9),
                                child: IconButton(
                                  icon: const Icon(Icons.done, size: 18),
                                  padding: const EdgeInsets.all(7.0),
                                  onPressed: () => _ackAlarm(alarm, context),
                                ),
                              ),
                            if ([
                              AlarmStatus.ACTIVE_UNACK,
                              AlarmStatus.ACTIVE_ACK,
                            ].contains(alarm.status))
                              Row(
                                children: [
                                  const SizedBox(width: 4),
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: const Color(0xffF0F4F9),
                                    child: IconButton(
                                      icon: const Icon(Icons.clear, size: 18),
                                      padding: const EdgeInsets.all(7.0),
                                      onPressed: () =>
                                          _clearAlarm(alarm, context),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  _clearAlarm(AlarmInfo alarm, BuildContext context) async {
    var res = await confirm(
      title: S.of(context).alarmClearTitle,
      message: S.of(context).alarmClearText,
      cancel: S.of(context).no,
      ok: S.of(context).yes,
    );
    if (res != null && res) {
      setState(() {
        loading = true;
      });
      await tbClient.getAlarmService().clearAlarm(alarm.id!.id!);
      var newAlarm =
          await tbClient.getAlarmService().getAlarmInfo(alarm.id!.id!);
      setState(() {
        loading = false;
        this.alarm = newAlarm!;
      });
    }
  }

  _ackAlarm(AlarmInfo alarm, BuildContext context) async {
    var res = await confirm(
      title: S.of(context).alarmAcknowledgeTitle,
      message: S.of(context).alarmAcknowledgeText,
      cancel: S.of(context).no,
      ok: S.of(context).yes,
    );
    if (res != null && res) {
      setState(() {
        loading = true;
      });
      await tbClient.getAlarmService().ackAlarm(alarm.id!.id!);
      var newAlarm =
          await tbClient.getAlarmService().getAlarmInfo(alarm.id!.id!);
      setState(() {
        loading = false;
        this.alarm = newAlarm!;
      });
    }
  }
}
