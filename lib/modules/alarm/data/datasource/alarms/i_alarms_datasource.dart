import 'package:thingsboard_pe_client/thingsboard_client.dart';

abstract interface class IAlarmsDatasource {
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query);
}
