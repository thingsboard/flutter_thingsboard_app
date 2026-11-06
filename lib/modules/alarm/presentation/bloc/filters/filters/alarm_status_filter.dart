// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';

class AlarmStatusFilter<T> implements IAlarmFilter<Set<T>> {
  AlarmStatusFilter({required this.logger, this.initiallySelected}) {
    if (initiallySelected != null) {
      alarmStatusSelected.add(initiallySelected as T);
    }
  }

  final alarmStatusSelected = <T>{};
  final TbLogger logger;
  T? initiallySelected;
  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmStatusFilter::getSelectedFilterData() -> $alarmStatusSelected',
    );

    return Set<T>.of(alarmStatusSelected);
  }

  @override
  void updateSelectedData(Set<T> data) {
    logger.debug('AlarmStatusFilter::updateSelectedData($data)');

    alarmStatusSelected
      ..clear()
      ..addAll(data);
  }

  @override
  void reset() {
    alarmStatusSelected.clear();
    if (initiallySelected != null) {
      alarmStatusSelected.add(initiallySelected as T);
    }
  }
}
