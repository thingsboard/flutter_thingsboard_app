import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmFiltersEntity extends Equatable {
  const AlarmFiltersEntity({
    this.typeList,
    this.statusList = const [AlarmSearchStatus.ACTIVE],
    this.severityList,
    this.assigneeId,
    this.selfAssignee,
  });

  final List<String>? typeList;
  final List<AlarmSearchStatus>? statusList;
  final List<AlarmSeverity>? severityList;
  final UserId? assigneeId;
  final bool? selfAssignee;

  factory AlarmFiltersEntity.defaultFilters() {
    return const AlarmFiltersEntity();
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

  @override
  String toString() {
    return 'AlarmFiltersEntity(typeList: $typeList, statusList: $statusList, '
        'severityList: $severityList, assigneeId: $assigneeId)';
  }

  @override
  List<Object?> get props => [typeList, statusList, severityList, assigneeId];
}
