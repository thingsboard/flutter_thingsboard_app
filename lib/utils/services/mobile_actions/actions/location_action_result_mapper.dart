// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/location/model/location_fix.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';

/// Shared mapping of a [LocationFix] to a [WidgetMobileActionResult], used by
/// the one-shot `GetLocationAction` so its success/failure result contract
/// stays in one place.
mixin LocationActionResultMapper {
  WidgetMobileActionResult mapLocationFixToResult(LocationFix fix) {
    return switch (fix) {
      LocationSuccess(:final position) =>
        WidgetMobileActionResult.successResult(
          MobileActionResult.location(
            position.latitude,
            position.longitude,
            accuracy: position.accuracy,
            ts: position.timestamp.millisecondsSinceEpoch,
          ),
        ),
      LocationServicesDisabled() => WidgetMobileActionResult.errorResult(
        'Location services are disabled.',
      ),
      LocationPermissionDenied() => WidgetMobileActionResult.errorResult(
        'Location permissions are denied.',
      ),
      LocationPermissionDeniedForever() => WidgetMobileActionResult.errorResult(
        'Location permissions are permanently denied, we cannot request permissions.',
      ),
      LocationFixError(:final message) => WidgetMobileActionResult.errorResult(
        message,
      ),
    };
  }
}
