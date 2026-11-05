import 'package:thingsboard_app/modules/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class FetchAlarmUseCase extends UseCase<Future<AlarmInfo?>, String> {
  const FetchAlarmUseCase({required this.repository});

  final IAlarmsRepository repository;

  @override
  Future<AlarmInfo?> call(String params) {
    return repository.getAlarmInfo(params);
  }
}
