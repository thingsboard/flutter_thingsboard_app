// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssignAlarmUseCase extends UseCase<Future<AlarmInfo>, AssignAlarmParams> {
  const AssignAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AssignAlarmParams params) {
    return repository.assignAlarm(params.id, params.userId);
  }
}

final class AssignAlarmParams {
  const AssignAlarmParams({required this.id, required this.userId});

  final String id;
  final String userId;
}
