import 'package:thingsboard_app/modules/alarm/data/datasource/alarm_types/i_alarm_types_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/alarm_types/i_alarm_types_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmTypesRepository implements IAlarmTypesRepository {
  const AlarmTypesRepository({required this.datasource});

  final IAlarmTypesDatasource datasource;

  @override
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey)  {
    return datasource.fetchAlarmTypes(pageKey);
  }
}
