// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAlarmDetailsDatasource {
  Future<PageData<AlarmCommentInfo>> fetchAlarmComments(
    AlarmCommentsQuery query,
  );

  Future<AlarmInfo> acknowledgeAlarm(AlarmId id);

  Future<AlarmInfo> clearAlarm(AlarmId id);

  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  });

  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  });

  Future<void> deleteComment(AlarmId id, {required String commentId});

  Future<PageData<UserInfo>> fetchAssignee(UsersAssignQuery query);

  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId);

  Future<AlarmInfo> unassignAlarm(String alarmId);
}
