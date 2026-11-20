// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/device/presentation/widgets/devices_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DevicesList extends BaseEntitiesWidget<EntityData, EntityDataQuery>
    with DevicesBase, EntitiesListStateBase {
  DevicesList(
    super.pageKeyController, {
    super.key,
    super.searchMode,
    this.displayDeviceImage = false,
  });
  final bool displayDeviceImage;

  @override
  bool displayCardImage(bool listWidgetCard) => displayDeviceImage;
}
