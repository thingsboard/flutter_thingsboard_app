import 'package:thingsboard_app/features/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

final class DeleteAlarmCommentUseCase
    extends UseCase<Future<void>, DeleteCommentParams> {
  DeleteAlarmCommentUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<void> call(DeleteCommentParams params) async {
    return repository.deleteComment(
      params.alarmId,
      commentId: params.commentId,
    );
  }
}

final class DeleteCommentParams {
  const DeleteCommentParams({required this.alarmId, required this.commentId});

  final String commentId;
  final AlarmId alarmId;
}
