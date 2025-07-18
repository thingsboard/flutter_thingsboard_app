import 'package:thingsboard_app/modules/alarm/data/datasource/details/i_alarm_details_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmDetailsRepository implements IAlarmDetailsRepository {
  const AlarmDetailsRepository(this.datasource);

  final IAlarmDetailsDatasource datasource;

  @override
  Future<PageData<AlarmCommentInfo>> fetchAlarmComments(
    AlarmCommentsQuery query,
  ) {
    return datasource.fetchAlarmComments(query);
  }

  @override
  Future<AlarmInfo> acknowledgeAlarm(AlarmId id)  {
    return datasource.acknowledgeAlarm(id);
  }

  @override
  Future<AlarmInfo> clearAlarm(AlarmId id) {
    return datasource.clearAlarm(id);
  }

  @override
  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  }) {
    return datasource.postComment(alarmId, comment: comment);
  }

  @override
  Future<void> deleteComment(AlarmId id, {required String commentId}) {
    return datasource.deleteComment(id, commentId: commentId);
  }

  @override
  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  }) {
    return datasource.updateComment(alarmId, id: id, comment: comment);
  }

  @override
  Future<PageData<UserInfo>> fetchAssignee(UsersAssignQuery query) {
    return datasource.fetchAssignee(query);
  }

  @override
  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId) {
    return datasource.assignAlarm(alarmId, assigneeId);
  }

  @override
  Future<AlarmInfo> unassignAlarm(String alarmId) {
    return datasource.unassignAlarm(alarmId);
  }
}
