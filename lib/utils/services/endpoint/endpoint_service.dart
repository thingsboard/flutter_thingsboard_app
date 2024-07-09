import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

class EndpointService implements IEndpointService {
  EndpointService({required this.databaseService});

  final ILocalDatabaseService databaseService;
  String? _cachedEndpoint;
  final _notifierValue = ValueNotifier<String?>(UniqueKey().toString());

  @override
  ValueListenable<String?> get listenEndpointChanges => _notifierValue;

  @override
  Future<void> setEndpoint(String endpoint) async {
    print('setEndpoint');

    _cachedEndpoint = endpoint;
    _notifierValue.value = UniqueKey().toString();

    await databaseService.setItem(
      DatabaseKeys.thingsBoardApiEndpointKey,
      endpoint,
    );
  }

  @override
  Future<String> getEndpoint() async {
    _cachedEndpoint ??= await databaseService.getItem(
      DatabaseKeys.thingsBoardApiEndpointKey,
    );

    return _cachedEndpoint ?? ThingsboardAppConstants.thingsBoardApiEndpoint;
  }

  @override
  Future<bool> isCustomEndpoint() async {
    _cachedEndpoint ??= await getEndpoint();
    return _cachedEndpoint != ThingsboardAppConstants.thingsBoardApiEndpoint;
  }

  @override
  String getCachedEndpoint() {
    return _cachedEndpoint ?? ThingsboardAppConstants.thingsBoardApiEndpoint;
  }
}
