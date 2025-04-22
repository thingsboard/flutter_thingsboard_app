import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';

class AlarmTypeFilter<T> implements IAlarmFilter {
  AlarmTypeFilter({required this.logger, T? initiallySelected}) {
    if (initiallySelected != null) {
      alarmTypeSelected.add(initiallySelected);
    }
  }

  final alarmTypeSelected = <T>{};
  final ILoggerService logger;

  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmTypeFilter::getSelectedFilterData() -> $alarmTypeSelected',
    );

    return Set<T>.of(alarmTypeSelected);
  }

  @override
  void updateSelectedData(data) {
    logger.debug(
      'AlarmTypeFilter::updateSelectedData($data)',
    );

    alarmTypeSelected
      ..clear()
      ..addAll(data);
  }

  @override
  void reset() {
    alarmTypeSelected.clear();
  }
}
