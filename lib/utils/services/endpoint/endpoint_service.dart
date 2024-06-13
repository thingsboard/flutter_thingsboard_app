import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

class EndpointService implements IEndpointService {
  EndpointService({required this.databaseService});

  final ILocalDatabaseService databaseService;
  final _cachedEndpoint = ValueNotifier<String?>(null);

  @override
  ValueListenable<String?> get listenEndpointChanges => _cachedEndpoint;

  @override
  Future<void> setEndpoint(String endpoint) async {
    _cachedEndpoint.value = endpoint;

    await databaseService.setItem(
      DatabaseKeys.thingsBoardApiEndpointKey,
      endpoint,
    );
  }

  @override
  Future<String> getEndpoint() async {
    _cachedEndpoint.value ??= await databaseService.getItem(
      DatabaseKeys.thingsBoardApiEndpointKey,
    );

    return _cachedEndpoint.value ??
        ThingsboardAppConstants.thingsBoardApiEndpoint;
  }

  @override
  Future<bool> isCustomEndpoint() async {
    _cachedEndpoint.value ??= await getEndpoint();
    return _cachedEndpoint.value !=
        ThingsboardAppConstants.thingsBoardApiEndpoint;
  }

  @override
  String getCachedEndpoint() {
    return _cachedEndpoint.value ??
        ThingsboardAppConstants.thingsBoardApiEndpoint;
  }
}
