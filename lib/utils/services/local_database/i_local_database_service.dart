import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';

/// The aim of this service is to consolidate operations with
/// the local database provider into one centralized location.

abstract interface class ILocalDatabaseService {
  Future<Region?> getSelectedRegion();

  Future<void> saveSelectedRegion(Region region);

  Future<String?> getSelectedEndpoint();

  Future<void> setSelectedEndpoint(String endpoint);

  Future<void> setInitialAppLink(String appLink);

  Future<String?> getInitialAppLink();

  Future<void> deleteInitialAppLink();
}
