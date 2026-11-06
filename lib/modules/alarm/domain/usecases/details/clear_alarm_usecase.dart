// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class ClearAlarmUseCase extends UseCase<Future<AlarmInfo>, AlarmId> {
  const ClearAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AlarmId params) {
    return repository.clearAlarm(params);
  }
}
