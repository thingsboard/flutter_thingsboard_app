import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class IAlarmsDatasource {
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query);

  Future<AlarmInfo?> getAlarmInfo(String id);
}
