import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';

/// This service provides information about the current active endpoint.
/// Since we have a feature that allows for changing endpoints, there is some
/// logic associated with the active endpoint, such as dashboard loading and OAuth2A.
abstract interface class IEndpointService {
  Future<void> setEndpoint(String endpoint);

  Future<String> getEndpoint();

  Future<bool> isCustomEndpoint();

  /// At times, we need to retrieve the endpoint synchronously.
  /// We might consider using Hive in the future.
  String getCachedEndpoint();

  Future<void> setRegion(Region region);

  Future<Region?> getSelectedRegion();

  ValueListenable<String?> get listenEndpointChanges;
}
