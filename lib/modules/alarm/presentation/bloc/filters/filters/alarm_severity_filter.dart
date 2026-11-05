import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmSeverityFilter<T> implements IAlarmFilter<Set<T>> {
  AlarmSeverityFilter({required this.logger, T? initiallySelected}) {
    if (initiallySelected != null) {
      alarmSeveritySelected.add(initiallySelected);
    }
  }

  final alarmSeveritySelected = <T>{};
  final TbLogger logger;
  static final _alarmSeverity = <FilterDataEntity<AlarmSeverity>>{
    FilterDataEntity(
      data: AlarmSeverity.CRITICAL,
      getLocalizedLabel: (BuildContext context) => S.of(context).critical,
    ),
    FilterDataEntity(
      data: AlarmSeverity.MAJOR,
      getLocalizedLabel: (BuildContext context) => S.of(context).major,
    ),
    FilterDataEntity(
      data: AlarmSeverity.MINOR,
      getLocalizedLabel: (BuildContext context) => S.of(context).minor,
    ),
    FilterDataEntity(
      data: AlarmSeverity.WARNING,
      getLocalizedLabel: (BuildContext context) => S.of(context).warning,
    ),
    FilterDataEntity(
      data: AlarmSeverity.INDETERMINATE,
      getLocalizedLabel: (BuildContext context) => S.of(context).indeterminate,
    ),
  };
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
