// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAlarmsRepository {
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query);

  Future<AlarmInfo?> getAlarmInfo(String id);
}
