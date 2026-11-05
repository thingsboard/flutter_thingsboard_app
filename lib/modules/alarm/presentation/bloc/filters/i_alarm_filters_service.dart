import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

enum Filters { status, severity, type, assignee }

abstract interface class IAlarmFiltersService {
  Set<FilterDataEntity<AlarmSearchStatus>> get statuses;

  Set<FilterDataEntity<AlarmSeverity>> get severities;

  AlarmFiltersEntity getCommittedFilters();

  void commitChanges();

  void reset();

  void resetUnCommittedChanges();

  T getSelectedFilter<T>(Filters type);

  void setSelectedFilter<T>(Filters type, {required T data});
}
