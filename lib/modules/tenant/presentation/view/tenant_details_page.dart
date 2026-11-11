// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entity_details_page.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TenantDetailsPage extends ContactBasedDetailsPage<Tenant> {
  TenantDetailsPage(String tenantId, {super.key})
    : super(
        entityId: tenantId,
        defaultTitle: (s) => s.tenant,
        subTitle: (s) => s.tenantDetails,
      );
  final tbClient = getIt<ITbClientService>().client;
  @override
  Future<Tenant?> fetchEntity(String id) async {
    final r = await nullIfNotFound(
      () => tbClient.getTenantControllerApi().getTenantById(
        tenantId: id,
        extra: InterceptorConfig(ignoreErrors: true).toExtra(),
      ),
    );
    return r?.data;
  }
}
