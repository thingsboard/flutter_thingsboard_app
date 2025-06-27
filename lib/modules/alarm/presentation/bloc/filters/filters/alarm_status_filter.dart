import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';

class AlarmStatusFilter<T> implements IAlarmFilter {
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
  void updateSelectedData(dynamic data) {
    logger.debug(
      'AlarmStatusFilter::updateSelectedData($data)',
    );

    alarmStatusSelected
      ..clear()
      ..addAll(data as Set<T>);
  }

  @override
  void reset() {
    alarmStatusSelected.clear();
    if (initiallySelected != null) {
      alarmStatusSelected.add(initiallySelected as T);
    }
  }
}
