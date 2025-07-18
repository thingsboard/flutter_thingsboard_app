import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

class LocalDatabaseService implements ILocalDatabaseService {
  const LocalDatabaseService({
    required this.storage,
    required this.logger,
  });

  final TbStorage storage;
  final TbLogger logger;

  @override
  Future<String?> getSelectedEndpoint() async {
    return await storage.getItem(DatabaseKeys.thingsBoardApiEndpointKey)
        as String?;
  }

  @override
  Future<Region?> getSelectedRegion() async {
    return await storage.getItem(DatabaseKeys.selectedRegion) as Region?;
  }

  @override
  Future<void> saveSelectedRegion(Region region)  {
    return storage.setItem(DatabaseKeys.selectedRegion, region);
  }

  @override
  Future<void> setSelectedEndpoint(String endpoint)  {
    return storage.setItem(DatabaseKeys.thingsBoardApiEndpointKey, endpoint);
  }

  @override
  Future<String?> getInitialAppLink() async {
    return await storage.getItem(DatabaseKeys.initialAppLink) as String?;
  }

  @override
  Future<void> setInitialAppLink(String appLink)  {
    return storage.setItem(DatabaseKeys.initialAppLink, appLink);
  }

  @override
  Future<void> deleteInitialAppLink()  {
    return storage.deleteItem(DatabaseKeys.initialAppLink);
  }
}
