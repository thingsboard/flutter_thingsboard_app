import 'package:thingsboard_app/features/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmsDatasource implements IAlarmsDatasource {
  const AlarmsDatasource({required this.thingsboardClient});

  final ITbClientService thingsboardClient;

  @override
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query) {
    return thingsboardClient.alarmService.getAllAlarmsV2(query);
  }

  @override
  Future<AlarmInfo?> getAlarmInfo(String id) {
    return thingsboardClient.alarmService.getAlarmInfo(id);
  }
}
