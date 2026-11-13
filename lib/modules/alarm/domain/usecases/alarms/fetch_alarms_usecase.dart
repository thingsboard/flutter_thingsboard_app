// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class FetchAlarmsUseCase
    extends UseCase<Future<PageData<AlarmInfo>>, AlarmQueryV2> {
  const FetchAlarmsUseCase({required this.repository});

  final IAlarmsRepository repository;

  @override
  Future<PageData<AlarmInfo>> call(AlarmQueryV2 params) {
    return repository.fetchAlarms(params);
  }
}
