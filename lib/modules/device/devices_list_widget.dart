// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DevicesListWidget extends EntitiesListWidget<EntityData, EntityDataQuery>
    with DevicesBase {
  DevicesListWidget({super.key, super.controller});

  @override
  void onViewAll() {
    getIt<ThingsboardAppRouter>().navigateTo('/devices');
  }

  @override
  PageKeyController<EntityDataQuery> createPageKeyController() =>
      DeviceQueryController(pageSize: 5);
}
