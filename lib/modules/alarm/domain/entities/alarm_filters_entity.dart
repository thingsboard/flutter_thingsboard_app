// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmFiltersEntity extends Equatable {
  const AlarmFiltersEntity({
    this.typeList,
    this.statusList = const [AlarmSearchStatus.ACTIVE],
    this.severityList,
    this.assigneeId,
    this.selfAssignee,
  });

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
      assigneeId:
          userId != null
              ? UserId((b) => b..id = userId)
              : null,
    );
  }

  final List<String>? typeList;
  final List<AlarmSearchStatus>? statusList;
  final List<AlarmSeverity>? severityList;
  final UserId? assigneeId;
  final bool? selfAssignee;

  @override
  String toString() {
    return 'AlarmFiltersEntity(typeList: $typeList, statusList: $statusList, '
        'severityList: $severityList, assigneeId: $assigneeId)';
  }

  @override
  List<Object?> get props => [typeList, statusList, severityList, assigneeId];
}
