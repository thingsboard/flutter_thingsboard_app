import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class ClearAlarmUseCase extends UseCase<Future<AlarmInfo>, AlarmId> {
  const ClearAlarmUseCase(this.repository);

  final IAlarmDetailsRepository repository;

  @override
  Future<AlarmInfo> call(AlarmId params) {
    return repository.clearAlarm(params);
  }
}
