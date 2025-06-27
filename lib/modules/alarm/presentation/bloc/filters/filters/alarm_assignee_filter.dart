import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';

class AlarmAssigneeFilter<T> implements IAlarmFilter {
  AlarmAssigneeFilter({required this.logger, T? initiallySelected}) {
    selectedUsed = initiallySelected;
  }

  T? selectedUsed;
  final TbLogger logger;

  @override
  T? getSelectedFilterData() {
    logger.debug(
      'AlarmAssigneeFilter::getSelectedFilterData() -> $selectedUsed',
    );

    return selectedUsed;
  }

  @override
  void updateSelectedData(dynamic data) {
    logger.debug(
      'AlarmAssigneeFilter::updateSelectedData($data)',
    );

    selectedUsed = data as T;
  }

  @override
  void reset() {
    selectedUsed = null;
  }
}
