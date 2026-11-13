// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmsRepository implements IAlarmsRepository {
  const AlarmsRepository({required this.datasource});

  final IAlarmsDatasource datasource;

  @override
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query) {
    return datasource.fetchAlarms(query);
  }

  @override
  Future<AlarmInfo?> getAlarmInfo(String id) {
    return datasource.getAlarmInfo(id);
  }
}
