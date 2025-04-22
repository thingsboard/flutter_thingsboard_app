import 'package:thingsboard_app/features/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/alarm_assignee_filter.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/alarm_severity_filter.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/alarm_status_filter.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/alarm_type_filter.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/filters/i_alarm_filter.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmFiltersService implements IAlarmFiltersService {
  AlarmFiltersService({required this.logger})
      : statusFilter = AlarmStatusFilter<FilterDataEntity>(
          logger: logger,
          initiallySelected: _alarmStatus.first,
        ),
        severityFilter = AlarmSeverityFilter<FilterDataEntity>(
          logger: logger,
        ),
        typeFilter = AlarmTypeFilter<String>(
          logger: logger,
        ),
        assigneeFilter = AlarmAssigneeFilter<String?>(
          logger: logger,
        );

  static const _alarmStatus = <FilterDataEntity>[
    FilterDataEntity(label: 'Active', data: AlarmSearchStatus.ACTIVE),
    FilterDataEntity(label: 'Cleared', data: AlarmSearchStatus.CLEARED),
    FilterDataEntity(label: 'Acknowledged', data: AlarmSearchStatus.ACK),
    FilterDataEntity(label: 'Unacknowledged', data: AlarmSearchStatus.UNACK),
  ];

  static const _alarmSeverity = <FilterDataEntity>[
    FilterDataEntity(label: 'Critical', data: AlarmSeverity.CRITICAL),
    FilterDataEntity(label: 'Major', data: AlarmSeverity.MAJOR),
    FilterDataEntity(label: 'Minor', data: AlarmSeverity.MINOR),
    FilterDataEntity(label: 'Warning', data: AlarmSeverity.WARNING),
    FilterDataEntity(label: 'Indeterminate', data: AlarmSeverity.INDETERMINATE),
  ];

  @override
  List<FilterDataEntity> get statuses => _alarmStatus;

  @override
  List<FilterDataEntity> get severities => _alarmSeverity;

  AlarmFiltersEntity _activeFilters = AlarmFiltersEntity.defaultFilters();

  final ILoggerService logger;
  late final IAlarmFilter statusFilter;
  late final IAlarmFilter severityFilter;
  late final IAlarmFilter typeFilter;
  late final IAlarmFilter assigneeFilter;

  @override
  AlarmFiltersEntity getCommittedFilters() {
    logger.debug(
      'AlarmFiltersService::getCommittedFilterOrNull() -> $_activeFilters',
    );

    return _activeFilters;
  }

  @override
  void reset() {
    logger.debug('AlarmFiltersService::reset()');
    _activeFilters = AlarmFiltersEntity.defaultFilters();

    statusFilter.reset();
    severityFilter.reset();
    typeFilter.reset();
    assigneeFilter.reset();
  }

  @override
  void commitChanges() {
    logger.debug('AlarmFiltersService::commitChanges()');

    final filters = AlarmFiltersEntity.fromUiFilters(
      typeList: typeFilter.getSelectedFilterData().toList(),
      status: statusFilter
          .getSelectedFilterData()
          .map((e) => e.data)
          .toList()
          .cast<AlarmSearchStatus>(),
      severity: severityFilter
          .getSelectedFilterData()
          .map((e) => e.data)
          .toList()
          .cast<AlarmSeverity>(),
      userId: assigneeFilter.getSelectedFilterData(),
    );

    _activeFilters = filters;
  }

  @override
  void resetUnCommittedChanges() {
    logger.debug('AlarmFiltersService::resetUnCommittedChanges()');

    final committedStatus = _activeFilters.statusList
        ?.map((e) => statuses.firstWhere((s) => e == s.data))
        .toSet();
    final committedSeverity = _activeFilters.severityList
        ?.map((e) => severities.firstWhere((s) => e == s.data))
        .toSet();
    final committedAssignee = _activeFilters.assigneeId;
    final committedTypes = _activeFilters.typeList;

    setSelectedFilter(Filters.status, data: committedStatus ?? {});
    setSelectedFilter(Filters.severity, data: committedSeverity ?? {});
    setSelectedFilter(Filters.assignee, data: committedAssignee?.id);
    setSelectedFilter(Filters.type, data: committedTypes ?? []);
  }

  @override
  T getSelectedFilter<T>(Filters type) {
    switch (type) {
      case Filters.status:
        return statusFilter.getSelectedFilterData();

      case Filters.severity:
        return severityFilter.getSelectedFilterData();

      case Filters.type:
        return typeFilter.getSelectedFilterData();

      case Filters.assignee:
        return assigneeFilter.getSelectedFilterData();
    }
  }

  @override
  void setSelectedFilter<T>(Filters type, {required data}) {
    switch (type) {
      case Filters.status:
        statusFilter.updateSelectedData(data);
        break;

      case Filters.severity:
        severityFilter.updateSelectedData(data);
        break;

      case Filters.type:
        typeFilter.updateSelectedData(data);
        break;

      case Filters.assignee:
        assigneeFilter.updateSelectedData(data);
        break;
    }
  }
}
