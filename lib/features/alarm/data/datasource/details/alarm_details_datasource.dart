import 'package:thingsboard_app/features/alarm/data/datasource/details/i_alarm_details_datasource.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmDetailsDatasource implements IAlarmDetailsDatasource {
  const AlarmDetailsDatasource(this.thingsboardClient);

  final ITbClientService thingsboardClient;

  @override
  Future<PageData<AlarmCommentInfo>> fetchAlarmComments(
    AlarmCommentsQuery query,
  ) async {
    return thingsboardClient.alarmService.getAlarmComments(query);
  }

  @override
  Future<AlarmInfo> acknowledgeAlarm(AlarmId id) async {
    return thingsboardClient.alarmService.acknowledgeAlarm(id);
  }

  @override
  Future<AlarmInfo> clearAlarm(AlarmId id) async {
    return thingsboardClient.alarmService.clearAlarm(id);
  }

  @override
  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  }) async {
    return thingsboardClient.alarmService
        .postComment(alarmId, comment: comment);
  }

  @override
  Future<void> deleteComment(AlarmId id, {required String commentId}) {
    return thingsboardClient.alarmService
        .deleteComment(id, commentId: commentId);
  }

  @override
  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  }) {
    return thingsboardClient.alarmService.updateComment(
      alarmId,
      id: id,
      comment: comment,
    );
  }

  @override
  Future<PageData<UserInfo>> fetchAssignee(UsersAssignQuery query) {
    return thingsboardClient.userService.getUsersAssign(query);
  }

  @override
  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId) {
    return thingsboardClient.alarmService.assignAlarm(alarmId, assigneeId);
  }

  @override
  Future<AlarmInfo> unassignAlarm(String alarmId) {
    return thingsboardClient.alarmService.unassignAlarm(alarmId);
  }
}
