import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmCard extends TbContextWidget {
  final AlarmInfo alarm;

  AlarmCard(TbContext tbContext, {super.key, required this.alarm})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _AlarmCardState();
}

class _AlarmCardState extends TbContextState<AlarmCard> {
  final entityDateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
        border: Border(
          left: BorderSide(
            color: alarmSeverityColors[widget.alarm.severity]!,
            width: 4,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    widget.alarm.type,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TbTextStyles.labelLarge,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  entityDateFormat.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      widget.alarm.createdTime!,
                                    ),
                                  ),
                                  style: TbTextStyles.bodyMedium.copyWith(
                                    color: Colors.black.withOpacity(.54),
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
                                    widget.alarm.originatorName != null
                                        ? widget.alarm.originatorName!
                                        : '',
                                    style: TbTextStyles.bodyMedium.copyWith(
                                      color: Colors.black.withOpacity(.54),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  alarmSeverityTranslations[
                                      widget.alarm.severity]!,
                                  style: TbTextStyles.labelMedium.copyWith(
                                    color: alarmSeverityColors[
                                        widget.alarm.severity]!,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 1,
                  color: Colors.black.withOpacity(.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          alarmStatusTranslations[widget.alarm.status]!,
                          style: TbTextStyles.bodyMedium.copyWith(
                            color: Colors.black.withOpacity(.76),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.06),
                        child: IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: const EdgeInsets.all(7.0),
                          onPressed: () => navigateTo(
                            '/alarmDetails/${widget.alarm.id?.id}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
