import 'package:thingsboard_app/features/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

final class AcknowledgeAlarmUseCase
    extends UseCase<Future<AlarmInfo>, AlarmId> {
  const AcknowledgeAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AlarmId params) {
    return repository.acknowledgeAlarm(params);
  }
}
