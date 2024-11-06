import 'package:thingsboard_app/core/auth/login/region.dart';

/// The aim of this service is to consolidate operations with
/// the local database provider into one centralized location.

abstract interface class ILocalDatabaseService {
  Region? getSelectedRegion();

  Future<void> saveSelectedRegion(Region region);

  String? getSelectedEndpoint();

  Future<void> setSelectedEndpoint(String endpoint);

  Future<void> setInitialAppLink(String appLink);

  String? getInitialAppLink();

  Future<void> deleteInitialAppLink();
}
