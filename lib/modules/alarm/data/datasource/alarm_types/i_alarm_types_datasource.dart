import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAlarmTypesDatasource {
  Future<PageData<EntitySubtype>> fetchAlarmTypes(PageLink pageKey);
}
