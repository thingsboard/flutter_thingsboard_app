import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IAlarmTypesRepository {
  Future<PageData<EntitySubtype>> fetchAlarmTypes(PageLink pageKey);
}
