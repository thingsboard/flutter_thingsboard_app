import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/alarm_assignee_filter.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/alarm_severity_filter.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/alarm_status_filter.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/filters/alarm_type_filter.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
///TODO: Refactor this
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

  static  final _alarmStatus = <FilterDataEntity>[
    FilterDataEntity( data: AlarmSearchStatus.ACTIVE, getLocalizedLabel: (BuildContext context) => S.of(context).active),
    FilterDataEntity( data: AlarmSearchStatus.CLEARED , getLocalizedLabel: (BuildContext context) => S.of(context).cleared),
    FilterDataEntity( data: AlarmSearchStatus.ACK, getLocalizedLabel: (BuildContext context) => S.of(context).acknowledged),
    FilterDataEntity( data: AlarmSearchStatus.UNACK, getLocalizedLabel: (BuildContext context) => S.of(context).unacknowledged),
  ];

  static final _alarmSeverity = <FilterDataEntity>[
    FilterDataEntity( data: AlarmSeverity.CRITICAL, getLocalizedLabel: (BuildContext context) => S.of(context).critical),
    FilterDataEntity( data: AlarmSeverity.MAJOR, getLocalizedLabel: (BuildContext context) => S.of(context).major),
    FilterDataEntity( data: AlarmSeverity.MINOR, getLocalizedLabel: (BuildContext context) => S.of(context).minor),
    FilterDataEntity( data: AlarmSeverity.WARNING, getLocalizedLabel: (BuildContext context) => S.of(context).warning),
    FilterDataEntity( data: AlarmSeverity.INDETERMINATE, getLocalizedLabel: (BuildContext context) => S.of(context).indeterminate),
  ];

  @override
  List<FilterDataEntity> get statuses => _alarmStatus;

  @override
  List<FilterDataEntity> get severities => _alarmSeverity;

  AlarmFiltersEntity _activeFilters = AlarmFiltersEntity.defaultFilters();

  final TbLogger logger;
  late final AlarmStatusFilter<FilterDataEntity> statusFilter;
  late final AlarmSeverityFilter<FilterDataEntity> severityFilter;
  late final AlarmTypeFilter<String> typeFilter;
  late final AlarmAssigneeFilter<String?> assigneeFilter;

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
        return statusFilter.getSelectedFilterData() as T;

      case Filters.severity:
        return severityFilter.getSelectedFilterData()  as T;

      case Filters.type:
        return typeFilter.getSelectedFilterData()  as T;

      case Filters.assignee:
        return assigneeFilter.getSelectedFilterData() as T;
    }
  }

  @override
  void setSelectedFilter<T>(Filters type, {required dynamic data}) {
    switch (type) {
      case Filters.status:
        statusFilter.updateSelectedData(data);

      case Filters.severity:
        severityFilter.updateSelectedData(data);

      case Filters.type:
        typeFilter.updateSelectedData(data);

      case Filters.assignee:
        assigneeFilter.updateSelectedData(data);
    }
  }
}
