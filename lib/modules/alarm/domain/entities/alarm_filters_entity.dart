import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmFiltersEntity {
  AlarmFiltersEntity({
    this.typeList,
    this.statusList = const [AlarmSearchStatus.ANY],
    this.severityList,
    this.assigneeId,
  });

  final List<String>? typeList;
  final List<AlarmSearchStatus>? statusList;
  final List<AlarmSeverity>? severityList;
  final UserId? assigneeId;

  factory AlarmFiltersEntity.defaultFilters() {
    return AlarmFiltersEntity();
  }

  factory AlarmFiltersEntity.fromUiFilters({
    required List<String> typeList,
    required List<AlarmSearchStatus> status,
    required List<AlarmSeverity> severity,
    required String? userId,
  }) {
    return AlarmFiltersEntity(
      typeList: typeList.isNotEmpty ? typeList : null,
      statusList: status.isNotEmpty ? status : null,
      severityList: severity.isNotEmpty ? severity : null,
      assigneeId: userId != null ? UserId(userId) : null,
    );
  }
}
