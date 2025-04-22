import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/features/alarm/alarms_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/build_context_extension.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmCard extends StatelessWidget {
  AlarmCard({required this.alarm, super.key});

  final AlarmInfo alarm;
  late final entityDateFormat = DateFormat('yyyy-MM-dd');

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
            color: alarmSeverityColors[alarm.severity]!,
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
                                    alarm.type,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TbTextStyles.labelLarge,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  entityDateFormat.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      alarm.createdTime!,
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
                                    alarm.originatorName != null
                                        ? alarm.originatorName!
                                        : '',
                                    style: TbTextStyles.bodyMedium.copyWith(
                                      color: Colors.black.withOpacity(.54),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  alarmSeverityTranslations[alarm.severity]!,
                                  style: TbTextStyles.labelMedium.copyWith(
                                    color: alarmSeverityColors[alarm.severity]!,
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
                  color: Colors.black.withValues(alpha: .05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          alarmStatusTranslations[alarm.status]!,
                          style: TbTextStyles.bodyMedium.copyWith(
                            color: Colors.black.withValues(alpha: .76),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: .06),
                        child: IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: const EdgeInsets.all(7.0),
                          onPressed: () => context.navigateTo(
                            '/alarmDetails/${alarm.id?.id}',
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
