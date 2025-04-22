import 'package:thingsboard_app/features/alarm/domain/repository/alarm_types/i_alarm_types_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class FetchAlarmTypesUseCase
    extends UseCase<Future<PageData<AlarmType>>, PageLink> {
  const FetchAlarmTypesUseCase({required this.repository});

  final IAlarmTypesRepository repository;

  @override
  Future<PageData<AlarmType>> call(PageLink params) async {
    return repository.fetchAlarmTypes(params);
  }
}
