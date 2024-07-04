import 'package:thingsboard_app/modules/alarm/data/datasource/alarm_types/i_alarm_types_datasource.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmTypesDatasource implements IAlarmTypesDatasource {
  const AlarmTypesDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey) {
    return tbClient.getAlarmService().getAlarmTypes(pageKey);
  }
}
