import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class IAlarmDetailsRepository {
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
