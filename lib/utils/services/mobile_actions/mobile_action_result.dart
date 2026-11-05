// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/mobile_actions/results/device_provisioning_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/image_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/launch_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/location_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/qr_code_result.dart';

abstract class MobileActionResult {
  MobileActionResult();

  factory MobileActionResult.launched(bool launched) {
    return LaunchResult(launched);
  }

  factory MobileActionResult.image(String imageUrl) {
    return ImageResult(imageUrl);
  }

  factory MobileActionResult.qrCode(String code, String format) {
    return QrCodeResult(code, format);
  }

  factory MobileActionResult.location(
    num latitude,
    num longitude, {
    num? accuracy,
    int? ts,
  }) {
    return LocationResult(latitude, longitude, accuracy: accuracy, ts: ts);
  }

  factory MobileActionResult.provisioning(String deviceName) {
    return DeviceProvisioningResult(deviceName);
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    return json;
  }
}
