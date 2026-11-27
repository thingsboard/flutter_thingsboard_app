// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_type.dart';
import 'package:thingsboard_app/utils/services/location/i_location_service.dart';
import 'package:thingsboard_app/utils/services/location/model/location_fix.dart';

class GetLocationAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult> execute(
    List args,
    InAppWebViewController controller,
  ) async {
    try {
      final fix = await getIt<ILocationService>().getCurrentPosition();
      return _toResult(fix);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.getLocation;

  WidgetMobileActionResult _toResult(LocationFix fix) {
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
