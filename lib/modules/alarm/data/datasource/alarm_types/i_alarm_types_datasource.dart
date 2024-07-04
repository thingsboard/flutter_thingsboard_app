import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class IAlarmTypesDatasource {
  Future<PageData<AlarmType>> fetchAlarmTypes(PageLink pageKey);
}
