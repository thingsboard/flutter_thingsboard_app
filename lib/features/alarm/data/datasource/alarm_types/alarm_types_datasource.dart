import 'package:thingsboard_app/features/alarm/data/datasource/alarm_types/i_alarm_types_datasource.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmTypesDatasource implements IAlarmTypesDatasource {
  const AlarmTypesDatasource({required this.tbClient});

  final ITbClientService tbClient;

  @override
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey) {
    return tbClient.alarmService.fetchAlarmTypes(pageKey);
  }
}
