// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LocationResult extends MobileActionResult {
  LocationResult(this.latitude, this.longitude, {this.accuracy, this.ts});
  num latitude;
  num longitude;
  num? accuracy;
  int? ts;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    if (accuracy != null) {
      json['accuracy'] = accuracy;
    }
    if (ts != null) {
      json['ts'] = ts;
    }
    return json;
  }
}
