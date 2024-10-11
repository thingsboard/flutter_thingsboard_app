import 'package:thingsboard_app/modules/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/alarms/i_alarms_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmsRepository implements IAlarmsRepository {
  const AlarmsRepository({required this.datasource});

  final IAlarmsDatasource datasource;

  @override
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query) {
    return datasource.fetchAlarms(query);
  }

  @override
  Future<AlarmInfo?> getAlarmInfo(String id) {
    return datasource.getAlarmInfo(id);
  }
}
