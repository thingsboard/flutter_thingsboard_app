import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class AcknowledgeAlarmUseCase
    extends UseCase<Future<AlarmInfo>, AlarmId> {
  const AcknowledgeAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AlarmId params) {
    return repository.acknowledgeAlarm(params);
  }
}
