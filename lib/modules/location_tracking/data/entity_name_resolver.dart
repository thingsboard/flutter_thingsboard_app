// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/location_tracking/data/i_entity_name_resolver.dart';
import 'package:thingsboard_app/utils/services/entity_query_api.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';

class EntityNameResolver implements IEntityNameResolver {
  EntityNameResolver({required this._clientService, required TbLogger logger})
    : _log = logger;

  final ITbClientService _clientService;
  final TbLogger _log;

  @override
  Future<String?> resolveName(String entityType, String id) async {
    try {
      final query = EntityQueryApi.createEntityNameQuery(entityType, id);
      final response = await _clientService.client
          .getEntityQueryControllerApi()
          .findEntityDataByQuery(
            entityDataQuery: query,
            extra: silentRequestExtra(),
          );
      final data = response.data?.data;
      if (data == null || data.isEmpty) {
        return null;
      }
      return data.first.field('name');
    } catch (e, s) {
      _log.error('EntityNameResolver.resolveName failed', e, s);
      return null;
    }
  }
}
