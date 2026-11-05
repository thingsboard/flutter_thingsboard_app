import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmStatusFilter<T> implements IAlarmFilter<Set<T>> {
  AlarmStatusFilter({required this.logger, this.initiallySelected}) {
    if (initiallySelected != null) {
      alarmStatusSelected.add(initiallySelected as T);
    }
  }

  final alarmStatusSelected = <T>{};
  final TbLogger logger;
  T? initiallySelected;
  static final _alarmStatus = <FilterDataEntity<AlarmSearchStatus>>{
    FilterDataEntity(
      data: AlarmSearchStatus.ACTIVE,
      getLocalizedLabel: (BuildContext context) => S.of(context).active,
    ),
    FilterDataEntity(
      data: AlarmSearchStatus.CLEARED,
      getLocalizedLabel: (BuildContext context) => S.of(context).cleared,
    ),
    FilterDataEntity(
      data: AlarmSearchStatus.ACK,
      getLocalizedLabel: (BuildContext context) => S.of(context).acknowledged,
    ),
    FilterDataEntity(
      data: AlarmSearchStatus.UNACK,
      getLocalizedLabel: (BuildContext context) => S.of(context).unacknowledged,
    ),
  };
  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmStatusFilter::getSelectedFilterData() -> $alarmStatusSelected',
    );

    return Set<T>.of(alarmStatusSelected);
  }

  @override
  void updateSelectedData(Set<T> data) {
    logger.debug(
      'AlarmStatusFilter::updateSelectedData($data)',
    );

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
