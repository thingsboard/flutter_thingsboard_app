import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_details_content_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/utils.dart';

class AlarmDetailsWidget extends StatelessWidget {
  AlarmDetailsWidget({
    required this.alarmInfo,
    required this.alamDashboardId,
    required this.tbContext,
    super.key,
  });

  final AlarmInfo alarmInfo;
  final startTimeDateFormat = DateFormat.yMd().add_jms();
  final String? alamDashboardId;
  final TbContext tbContext;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: true,
      child: ScrollOnExpand(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(.12),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ExpandablePanel(
            header: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                S.of(context).details,
                style: TbTextStyles.labelLarge.copyWith(
                  color: Colors.black.withOpacity(.76),
                ),
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AlarmDetailsContentWidget(
                    title: S.of(context).status,
                    details: alarmStatusTranslations[alarmInfo.status] ?? '',
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).type,
                    details: alarmInfo.type,
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).severity,
                    details:
                        alarmSeverityTranslations[alarmInfo.severity] ?? '',
                    detailsStyle: TbTextStyles.labelLarge.copyWith(
                      color: alarmSeverityColors[alarmInfo.severity],
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).originator,
                    details: alarmInfo.originatorName ?? '',
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).startTime,
                    details: startTimeDateFormat.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        alarmInfo.startTs!,
                      ),
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).duration,
                    details: _alarmDuration(context),
                    showDivider: alamDashboardId != null,
                  ),
                  Visibility(
                    visible: alamDashboardId != null,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          tbContext.navigateToDashboard(
                            alamDashboardId!,
                            dashboardTitle: alarmInfo.originatorName,
                            state: Utils.createDashboardEntityState(
                              alarmInfo.originator,
                              entityName: alarmInfo.originatorName,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(.1),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          S.of(context).viewDashboard,
                          style: TbTextStyles.titleXs.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _alarmDuration(BuildContext context) {
    final now = DateTime.now();
    final startDateTime = DateTime.fromMillisecondsSinceEpoch(
      alarmInfo.startTs!,
    );
    final difference = now.difference(startDateTime);

    String result = '';
    if (difference.inDays > 0) {
      result += '${difference.inDays} ${S.of(context).days} ';
    }
    if (difference.inHours > 0) {
      result += '${difference.inHours % 24} ${S.of(context).hours} ';
    }
    if (difference.inMinutes > 0) {
      result += '${difference.inMinutes % 60} ${S.of(context).minutes} ';
    }

    return result += '${difference.inSeconds % 60} ${S.of(context).seconds}';
  }
}
