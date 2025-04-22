import 'package:thingsboard_app/features/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

final class PostAlarmCommentsUseCase
    extends UseCase<Future<AlarmCommentInfo>, PostAlarmCommentParams> {
  const PostAlarmCommentsUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmCommentInfo> call(PostAlarmCommentParams params) {
    final comment = params.comment.trimLeft().trimRight();
    if (comment.isEmpty) {
      throw Exception('An empty comment was rejected to be posted.');
    }

    if (params.id != null) {
      return repository.updateComment(
        params.alarmId,
        id: params.id!,
        comment: comment,
      );
    }

    return repository.postComment(params.alarmId, comment: comment);
  }
}

final class PostAlarmCommentParams {
  const PostAlarmCommentParams({
    required this.alarmId,
    required this.comment,
    this.id,
  });

  final AlarmId alarmId;
  final String? id;
  final String comment;
}
