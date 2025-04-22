import 'package:thingsboard_app/features/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchAlarmsUseCase
    extends UseCase<Future<PageData<AlarmInfo>>, AlarmQueryV2> {
  const FetchAlarmsUseCase({required this.repository});

  final IAlarmsRepository repository;

  @override
  Future<PageData<AlarmInfo>> call(AlarmQueryV2 params) {
    return repository.fetchAlarms(params);
  }
}
