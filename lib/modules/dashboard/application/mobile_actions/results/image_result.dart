// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action_result.dart';

class ImageResult extends MobileActionResult {

  ImageResult(this.imageUrl);
  String imageUrl;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['imageUrl'] = imageUrl;
    return json;
  }
}
