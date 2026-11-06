// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/details/i_alarm_details_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmDetailsDatasource implements IAlarmDetailsDatasource {
  const AlarmDetailsDatasource(this.thingsboardClient);

  final ThingsboardClient thingsboardClient;

  @override
  Future<PageData<AlarmCommentInfo>> fetchAlarmComments(
    AlarmCommentsQuery query,
  ) async {
    final res = await thingsboardClient
        .getAlarmCommentControllerApi()
        .getAlarmComments(
          alarmId: query.id.id,
          pageSize: query.pageLink.pageSize,
          page: query.pageLink.page,
          sortProperty: query.pageLink.sortOrder?.property,
          sortOrder: query.pageLink.sortOrder?.direction.name,
        );
    final pd = res.data!;
    return toPageData(pd.data, pd.totalPages, pd.totalElements, pd.hasNext);
  }

  @override
  Future<AlarmInfo> acknowledgeAlarm(AlarmId id) async {
    final res = await thingsboardClient.getAlarmControllerApi().ackAlarm(
      alarmId: id.id,
    );
    return res.data!;
  }

  @override
  Future<AlarmInfo> clearAlarm(AlarmId id) async {
    final res = await thingsboardClient.getAlarmControllerApi().clearAlarm(
      alarmId: id.id,
    );
    return res.data!;
  }

  @override
  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  }) async {
    final body = AlarmComment(
      (b) =>
          b
            ..type = AlarmCommentType.OTHER
            ..comment = JsonObject(<String, dynamic>{'text': comment}),
    );
    final res = await thingsboardClient
        .getAlarmCommentControllerApi()
        .saveAlarmComment(alarmId: alarmId.id, alarmComment: body);
    return _alarmCommentToInfo(res.data!);
  }

  @override
  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  }) async {
    final body = AlarmComment(
      (b) =>
          b
            // The server upserts based on the presence of `id`: setting it
            // updates the existing comment, omitting it creates a new one.
            ..id = AlarmCommentId((idb) => idb..id = id).toBuilder()
            ..type = AlarmCommentType.OTHER
            ..comment = JsonObject(<String, dynamic>{
              'text': comment,
              'edited': 'true',
            }),
    );
    final res = await thingsboardClient
        .getAlarmCommentControllerApi()
        .saveAlarmComment(alarmId: alarmId.id, alarmComment: body);
    return _alarmCommentToInfo(res.data!);
  }

  @override
  Future<void> deleteComment(AlarmId id, {required String commentId}) async {
    await thingsboardClient.getAlarmCommentControllerApi().deleteAlarmComment(
      alarmId: id.id,
      commentId: commentId,
    );
  }

  @override
  Future<PageData<UserInfo>> fetchAssignee(UsersAssignQuery query) async {
    final res = await thingsboardClient
        .getUserControllerApi()
        .getUsersForAssign(
          alarmId: query.id.id,
          pageSize: query.pageLink.pageSize,
          page: query.pageLink.page,
          textSearch: query.pageLink.textSearch,
          sortProperty: query.pageLink.sortOrder?.property,
          sortOrder: query.pageLink.sortOrder?.direction.name,
        );
    final pd = res.data!;
    final users =
        pd.data?.map(_userEmailInfoToUserInfo).toList() ?? <UserInfo>[];
    return toPageData(users, pd.totalPages, pd.totalElements, pd.hasNext);
  }

  @override
  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId) async {
    final res = await thingsboardClient.getAlarmControllerApi().assignAlarm(
      alarmId: alarmId,
      assigneeId: assigneeId,
    );
    return res.data!;
  }

  @override
  Future<AlarmInfo> unassignAlarm(String alarmId) async {
    final res = await thingsboardClient.getAlarmControllerApi().unassignAlarm(
      alarmId: alarmId,
    );
    return res.data!;
  }
}

AlarmCommentInfo _alarmCommentToInfo(AlarmComment c) => AlarmCommentInfo(
  (b) =>
      b
        ..id = c.id?.toBuilder()
        ..createdTime = c.createdTime
        ..alarmId = c.alarmId?.toBuilder()
        ..userId = c.userId?.toBuilder()
        ..type = c.type
        ..comment = c.comment,
);

/// Maps the assignee endpoint's [UserEmailInfo] onto the app's [UserInfo]
/// carrier. [UserInfo] requires a non-nullable `authority`/`email` that
/// [UserEmailInfo] doesn't provide; neither is used for assignee display, so we
/// fill a neutral [Authority.CUSTOMER_USER] and an empty-string email fallback
/// to satisfy the built_value `.build()` null checks.
UserInfo _userEmailInfoToUserInfo(UserEmailInfo e) => UserInfo(
  (b) =>
      b
        ..id = e.id?.toBuilder()
        ..authority = Authority.CUSTOMER_USER
        ..email = e.email ?? ''
        ..firstName = e.firstName
        ..lastName = e.lastName,
);
