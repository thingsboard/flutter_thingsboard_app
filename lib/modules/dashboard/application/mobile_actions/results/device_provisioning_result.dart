// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action_result.dart';

class DeviceProvisioningResult extends MobileActionResult {
  DeviceProvisioningResult(this.deviceName);

  final String deviceName;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['deviceName'] = deviceName;
    return json;
  }
}
