// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarms_base.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_details_content_widget.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmDetailsWidget extends StatefulWidget {
  AlarmDetailsWidget({
    required this.alarmInfo,
    required this.alamDashboardId,

    super.key,
  });

  final AlarmInfo alarmInfo;
  final startTimeDateFormat = DateFormat.yMd().add_jms();
  final String? alamDashboardId;

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
                    details: widget.alarmInfo.status.getTranslatedAlarmStatus(
                      context,
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).type,
                    details: getIt<ICustomTranslationService>().translate(
                      widget.alarmInfo.type,
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).severity,
                    details: widget.alarmInfo.severity
                        .getTranslatedAlarmSeverity(context),
                    detailsStyle: TbTextStyles.labelLarge.copyWith(
                      color: widget.alarmInfo.severity.toColor(),
                    ),
                  ),
                  AlarmDetailsContentWidget(
                    title: S.of(context).originator,
                    details: getIt<ICustomTranslationService>().translate(
                      widget.alarmInfo.originatorName,
                    ),
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
                          backgroundColor: Theme.of(context).primaryColor
                              .withValues(alpha: .1),
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

  String _alarmDuration(BuildContext context) => alarmDurationText(
    DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(widget.alarmInfo.startTs!),
    ),
    S.of(context),
  );
}

/// "1 day 2 hours 3 minutes 4 seconds", leaving out leading zero units, with
/// the digits of the start time above it.
@visibleForTesting
String alarmDurationText(Duration duration, S s) {
  // The date symbols' digits, not NumberFormat's: for Arabic they differ.
  final zero = DateFormat().dateSymbols.ZERODIGIT?.codeUnitAt(0);
  String digits(int n) => zero == null
      ? '$n'
      : String.fromCharCodes('$n'.codeUnits.map((c) => zero + c - 0x30));
  final days = duration.inDays;
  final hours = duration.inHours % 24;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;
  return [
    if (days > 0) s.durationDays(days, digits(days)),
    if (duration.inHours > 0) s.durationHours(hours, digits(hours)),
    if (duration.inMinutes > 0) s.durationMinutes(minutes, digits(minutes)),
    s.durationSeconds(seconds, digits(seconds)),
  ].join(' ');
}
