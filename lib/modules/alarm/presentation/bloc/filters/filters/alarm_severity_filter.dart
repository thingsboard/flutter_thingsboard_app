// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';

class AlarmSeverityFilter<T> implements IAlarmFilter<Set<T>> {
  AlarmSeverityFilter({required this.logger, T? initiallySelected}) {
    if (initiallySelected != null) {
      alarmSeveritySelected.add(initiallySelected);
    }
  }

  final alarmSeveritySelected = <T>{};
  final TbLogger logger;
  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmSeverityFilter::getSelectedFilterData() -> $alarmSeveritySelected',
    );

    return Set<T>.of(alarmSeveritySelected);
  }

  @override
  void updateSelectedData(Set<T> data) {
    logger.debug(
      'AlarmStatusFilter::updateSelectedData($data)',
    );

    alarmSeveritySelected
      ..clear()
      ..addAll(data);
  }

  @override
  void reset() {
    alarmSeveritySelected.clear();
  }
}
