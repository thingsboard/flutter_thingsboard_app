import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';

class AlarmStatusFilter<T> implements IAlarmFilter {
  AlarmStatusFilter({required this.logger, this.initiallySelected}) {
    if (initiallySelected != null) {
      alarmStatusSelected.add(initiallySelected as T);
    }
  }

  final alarmStatusSelected = <T>{};
  final ILoggerService logger;
  T? initiallySelected;

  @override
  Set<T> getSelectedFilterData() {
    logger.debug(
      'AlarmStatusFilter::getSelectedFilterData() -> $alarmStatusSelected',
    );

    return Set<T>.of(alarmStatusSelected);
  }

  @override
  void updateSelectedData(data) {
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
