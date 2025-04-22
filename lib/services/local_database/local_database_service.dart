import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/features/authentication/entities/region.dart';
import 'package:thingsboard_app/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class LocalDatabaseService implements ILocalDatabaseService {
  const LocalDatabaseService({
    required this.storage,
    required this.logger,
  });

  final TbStorage storage;
  final ILoggerService logger;

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
  Future<void> saveSelectedRegion(Region region) async {
    return storage.setItem(DatabaseKeys.selectedRegion, region);
  }

  @override
  Future<void> setSelectedEndpoint(String endpoint) async {
    return storage.setItem(DatabaseKeys.thingsBoardApiEndpointKey, endpoint);
  }

  @override
  Future<String?> getInitialAppLink() async {
    return await storage.getItem(DatabaseKeys.initialAppLink) as String?;
  }

  @override
  Future<void> setInitialAppLink(String appLink) async {
    return storage.setItem(DatabaseKeys.initialAppLink, appLink);
  }

  @override
  Future<void> deleteInitialAppLink() async {
    return storage.deleteItem(DatabaseKeys.initialAppLink);
  }
}
