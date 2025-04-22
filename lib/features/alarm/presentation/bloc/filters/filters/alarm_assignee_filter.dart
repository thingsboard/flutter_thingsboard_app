import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';

class AlarmAssigneeFilter<T> implements IAlarmFilter {
  AlarmAssigneeFilter({required this.logger, T? initiallySelected}) {
    selectedUsed = initiallySelected;
  }

  T? selectedUsed;
  final ILoggerService logger;

  @override
  T? getSelectedFilterData() {
    logger.debug(
      'AlarmAssigneeFilter::getSelectedFilterData() -> $selectedUsed',
    );

    return selectedUsed;
  }

  @override
  void updateSelectedData(data) {
    logger.debug(
      'AlarmAssigneeFilter::updateSelectedData($data)',
    );

    selectedUsed = data;
  }

  @override
  void reset() {
    selectedUsed = null;
  }
}
