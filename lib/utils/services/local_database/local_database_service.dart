import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/core/auth/login/region.dart';
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
  String? getSelectedEndpoint() {
    return storage.getItem(DatabaseKeys.thingsBoardApiEndpointKey);
  }

  @override
  Region? getSelectedRegion() {
    return storage.getItem(DatabaseKeys.selectedRegion);
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
  String? getInitialAppLink() {
    return storage.getItem(DatabaseKeys.initialAppLink);
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
