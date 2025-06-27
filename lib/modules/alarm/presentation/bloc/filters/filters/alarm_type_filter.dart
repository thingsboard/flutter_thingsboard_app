import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';

class AlarmTypeFilter<T> implements IAlarmFilter {
  AlarmTypeFilter({required this.logger, T? initiallySelected}) {
    if (initiallySelected != null) {
      alarmTypeSelected.add(initiallySelected);
    }
  }

  final alarmTypeSelected = <T>{};
  final TbLogger logger;

  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmTypeFilter::getSelectedFilterData() -> $alarmTypeSelected',
    );

    return Set<T>.of(alarmTypeSelected);
  }

  @override
  void updateSelectedData(dynamic data) {
    logger.debug(
      'AlarmTypeFilter::updateSelectedData($data)',
    );

    alarmTypeSelected
      ..clear()
      ..addAll(data as Set<T>);
  }

  @override
  void reset() {
    alarmTypeSelected.clear();
  }
}
