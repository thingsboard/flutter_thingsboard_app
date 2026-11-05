// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class LaunchResult extends MobileActionResult {
  LaunchResult(this.launched);
  bool launched;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['launched'] = launched;
    return json;
  }
}
