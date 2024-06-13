import 'package:thingsboard_pe_client/thingsboard_client.dart';

abstract interface class IAlarmTypesDatasource {
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey);
}
