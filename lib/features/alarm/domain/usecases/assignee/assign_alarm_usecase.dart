import 'package:thingsboard_app/features/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class AssignAlarmUseCase extends UseCase<Future<AlarmInfo>, AssignAlarmParams> {
  const AssignAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AssignAlarmParams params) {
    return repository.assignAlarm(params.id, params.userId);
  }
}

final class AssignAlarmParams {
  const AssignAlarmParams({
    required this.id,
    required this.userId,
  });

  final String id;
  final String userId;
}
