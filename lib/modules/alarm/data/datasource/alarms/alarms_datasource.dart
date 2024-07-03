import 'package:thingsboard_app/modules/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmsDatasource implements IAlarmsDatasource {
  const AlarmsDatasource({required this.thingsboardClient});

  final ThingsboardClient thingsboardClient;

  @override
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query) {
    return thingsboardClient.getAlarmService().getAllAlarmsV2(query);
  }
}
