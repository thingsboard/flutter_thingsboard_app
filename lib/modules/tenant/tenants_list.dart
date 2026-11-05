// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/tenant/tenants_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TenantsList extends BaseEntitiesWidget<Tenant, PageLink>
    with TenantsBase, ContactBasedBase, EntitiesListStateBase {
  TenantsList(super.pageKeyController, {super.searchMode, super.key});
}
