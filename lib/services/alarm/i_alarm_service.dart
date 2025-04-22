import 'package:thingsboard_app/thingsboard_client.dart'
    show
        AlarmCommentInfo,
        AlarmCommentsQuery,
        AlarmId,
        AlarmInfo,
        AlarmQueryV2,
        AlarmType,
        PageData,
        PageLink;

abstract interface class IAlarmService {
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey);

  Future<PageData<AlarmInfo>> getAllAlarmsV2(AlarmQueryV2 query);

  Future<AlarmInfo?> getAlarmInfo(String id);

  Future<PageData<AlarmCommentInfo>> getAlarmComments(AlarmCommentsQuery query);

  Future<AlarmInfo> acknowledgeAlarm(AlarmId id);

  Future<AlarmInfo> clearAlarm(AlarmId id);

  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  });

  Future<void> deleteComment(AlarmId id, {required String commentId});

  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  });

  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId);

  Future<AlarmInfo> unassignAlarm(String alarmId);
}
