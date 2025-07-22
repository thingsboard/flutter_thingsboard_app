import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/alarms_base.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_details_content_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/utils.dart';

class AlarmDetailsWidget extends StatefulWidget {
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
  State<StatefulWidget> createState() => _AlarmDetailsWidgetState();
}

class _AlarmDetailsWidgetState extends State<AlarmDetailsWidget>
    with SingleTickerProviderStateMixin {
  late final ExpandableController expandableController;
  late final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: ScrollOnExpand(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withValues(alpha: .12)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(hasIcon: false),
            header: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).details,
                    style: TbTextStyles.labelLarge.copyWith(
                      color: Colors.black.withValues(alpha: .76),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(
                      begin: .0,
                      end: .5,
                    ).animate(animationController),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Icon(
                        Icons.arrow_left_outlined,
                        color: Colors.black.withValues(alpha: .38),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AlarmDetailsContentWidget(
                    title: S.of(context).status,
                    details:
                        widget.alarmInfo.status?.getTranslatedAlarmStatus(context) ?? '',
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).type,
                    details: widget.alarmInfo.type,
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).severity,
                    details:
                       widget.alarmInfo.severity.getTranslatedAlarmSeverity(context),
                    detailsStyle: TbTextStyles.labelLarge.copyWith(
                      color: widget.alarmInfo.severity.toColor(),
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).originator,
                    details: widget.alarmInfo.originatorName ?? '',
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).startTime,
                    details: widget.startTimeDateFormat.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        widget.alarmInfo.startTs!,
                      ),
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).duration,
                    details: _alarmDuration(context),
                    showDivider: widget.alamDashboardId != null,
                  ),
                  Visibility(
                    visible: widget.alamDashboardId != null,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          getIt<ThingsboardAppRouter>().navigateToDashboard(
                            widget.alamDashboardId!,
                            dashboardTitle: widget.alarmInfo.originatorName,
                            state: Utils.createDashboardEntityState(
                              widget.alarmInfo.originator,
                              entityName: widget.alarmInfo.originatorName,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: .1),
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

  @override
  void initState() {
    expandableController = ExpandableController(initialExpanded: true);
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    expandableController.addListener(() {
      if (expandableController.expanded) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    expandableController.dispose();
    animationController.dispose();
    super.dispose();
  }

  String _alarmDuration(BuildContext context) {
    final now = DateTime.now();
    final startDateTime = DateTime.fromMillisecondsSinceEpoch(
      widget.alarmInfo.startTs!,
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
