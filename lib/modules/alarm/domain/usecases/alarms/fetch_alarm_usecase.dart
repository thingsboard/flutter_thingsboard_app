// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class FetchAlarmUseCase extends UseCase<Future<AlarmInfo?>, String> {
  const FetchAlarmUseCase({required this.repository});

  final IAlarmsRepository repository;

  @override
  Future<AlarmInfo?> call(String params) {
    return repository.getAlarmInfo(params);
  }
}
