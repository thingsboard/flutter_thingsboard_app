// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DeviceDetailsPage extends EntityDetailsPage<Device> {
  DeviceDetailsPage(String deviceId, {super.key})
    : super(entityId: deviceId, defaultTitle: (s) => s.devices(1));
  final tbClient = getIt<ITbClientService>().client;

  @override
  Future<Device?> fetchEntity(String id) async {
    final r = await nullIfNotFound(
      () => tbClient.getDeviceControllerApi().getDeviceById(
        deviceId: id,
        extra: InterceptorConfig(ignoreErrors: true).toExtra(),
      ),
    );
    return r?.data;
  }

  @override
  Widget buildEntityDetails(BuildContext context, Device entity) {
    return ListTile(
      title: Text(getIt<ICustomTranslationService>().translate(entity.name)),
      subtitle: Text(entity.type ?? ''),
    );
  }
}
