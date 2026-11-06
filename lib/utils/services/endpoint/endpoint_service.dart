// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/normalize_endpoint.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';

class EndpointService implements IEndpointService {
  EndpointService({required this.databaseService});

  static const northAmericaHost = 'https://thingsboard.cloud';
  static const europeHost = 'https://eu.thingsboard.cloud';
  static final _defaultEndpoint = normalizeEndpoint(
    ThingsboardAppConstants.thingsBoardApiEndpoint,
  );

  final ILocalDatabaseService databaseService;
  String? _cachedEndpoint;
  final _notifierValue = ValueNotifier<String?>(UniqueKey().toString());
  final _defaultEndpoints = <String>{_defaultEndpoint};

  @override
  ValueListenable<String?> get listenEndpointChanges => _notifierValue;

  @override
  Future<void> setEndpoint(String endpoint) async {
    final normalized = normalizeEndpoint(endpoint);
    _cachedEndpoint = normalized;
    _notifierValue.value = UniqueKey().toString();

    if (normalized == northAmericaHost) {
      databaseService.saveSelectedRegion(Region.northAmerica);
    } else if (normalized == europeHost) {
      databaseService.saveSelectedRegion(Region.europe);
    } else {
      databaseService.saveSelectedRegion(Region.custom);
    }

    await databaseService.setSelectedEndpoint(normalized);
  }

  @override
  Future<String> getEndpoint() async {
    if (_cachedEndpoint == null) {
      final storedEndpoint = await databaseService.getSelectedEndpoint();
      if (storedEndpoint != null) {
        _cachedEndpoint = normalizeEndpoint(storedEndpoint);
      }
    }

    return _cachedEndpoint ?? _defaultEndpoint;
  }

  @override
  Future<bool> isCustomEndpoint() async {
    _cachedEndpoint ??= await getEndpoint();
    final host = Uri.parse(_cachedEndpoint!).host;
    final defaultHosts = _defaultEndpoints
        .map((e) => Uri.parse(e).host)
        .toSet();
    final isCustom = !defaultHosts.contains(host);
    return isCustom;
  }

  @override
  String getCachedEndpoint() {
    return _cachedEndpoint ?? _defaultEndpoint;
  }

  @override
  Future<Region?> getSelectedRegion() {
    return databaseService.getSelectedRegion();
  }

  @override
  Future<void> setRegion(Region region) async {
    if (region == Region.northAmerica) {
      await setEndpoint(northAmericaHost);
    } else if (region == Region.europe) {
      await setEndpoint(europeHost);
    }

    return await databaseService.saveSelectedRegion(region);
  }
}
