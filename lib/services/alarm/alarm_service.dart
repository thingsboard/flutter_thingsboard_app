import 'package:thingsboard_app/services/alarm/i_alarm_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show
        AlarmCommentInfo,
        AlarmCommentsQuery,
        AlarmId,
        AlarmInfo,
        AlarmQueryV2,
        AlarmType,
        PageData,
        PageLink,
        ThingsboardClient;

class AlarmService implements IAlarmService {
  const AlarmService({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey) {
    return tbClient.getAlarmService().getAlarmTypes(pageKey);
  }

  @override
  Future<AlarmInfo?> getAlarmInfo(String id) {
    return tbClient.getAlarmService().getAlarmInfo(id);
  }

  @override
  Future<PageData<AlarmInfo>> getAllAlarmsV2(AlarmQueryV2 query) {
    return tbClient.getAlarmService().getAllAlarmsV2(query);
  }

  @override
  Future<AlarmInfo> acknowledgeAlarm(AlarmId id) {
    return tbClient.getAlarmService().ackAlarm(id.id!);
  }

  @override
  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId) {
    return tbClient.getAlarmService().assignAlarm(alarmId, assigneeId);
  }

  @override
  Future<AlarmInfo> clearAlarm(AlarmId id) {
    return tbClient.getAlarmService().clearAlarm(id.id!);
  }

  @override
  Future<void> deleteComment(AlarmId id, {required String commentId}) {
    return tbClient.getAlarmService().deleteAlarmComment(
          commentId,
          alarmId: id,
        );
  }

  @override
  Future<PageData<AlarmCommentInfo>> getAlarmComments(
    AlarmCommentsQuery query,
  ) {
    return tbClient.getAlarmService().getAlarmComments(query);
  }

  @override
  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  }) {
    return tbClient
        .getAlarmService()
        .postAlarmComment(comment, alarmId: alarmId);
  }

  @override
  Future<AlarmInfo> unassignAlarm(String alarmId) {
    return tbClient.getAlarmService().unassignAlarm(alarmId);
  }

  @override
  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  }) {
    return tbClient.getAlarmService().updatedAlarmComment(
          comment,
          alarmId: alarmId,
          commentId: id,
        );
  }
}
