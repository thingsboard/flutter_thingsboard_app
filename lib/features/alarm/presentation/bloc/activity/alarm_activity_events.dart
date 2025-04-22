import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

sealed class AlarmActivityEvent extends Equatable {
  const AlarmActivityEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmActivityFetchEvent extends AlarmActivityEvent {
  const AlarmActivityFetchEvent();
}

final class PostAlarmCommentEvent extends AlarmActivityEvent {
  const PostAlarmCommentEvent(
    this.alarmId, {
    required this.comment,
  });

  final AlarmId alarmId;
  final String comment;

  @override
  List<Object?> get props => [alarmId, comment];
}

final class UpdateAlarmCommentEvent extends AlarmActivityEvent {
  const UpdateAlarmCommentEvent(
    this.id, {
    required this.alarmId,
    required this.comment,
  });

  final String id;
  final AlarmId alarmId;
  final String comment;

  @override
  List<Object?> get props => [id, alarmId, comment];
}

final class AlarmEditCommentEvent extends AlarmActivityEvent {
  const AlarmEditCommentEvent(
    this.commentId, {
    required this.alarmId,
    required this.comment,
  });

  final AlarmId alarmId;
  final String commentId;
  final AlarmComment comment;

  @override
  List<Object?> get props => [alarmId, commentId, comment];
}

final class DeleteAlarmCommentEvent extends AlarmActivityEvent {
  const DeleteAlarmCommentEvent({
    required this.commentId,
    required this.alarmId,
  });

  final String commentId;
  final AlarmId alarmId;

  @override
  List<Object?> get props => [commentId, alarmId];
}

final class CancelAlarmCommentEditing extends AlarmActivityEvent {
  const CancelAlarmCommentEditing();
}

final class AlarmActivityRefreshEvent extends AlarmActivityEvent {
  const AlarmActivityRefreshEvent();
}
