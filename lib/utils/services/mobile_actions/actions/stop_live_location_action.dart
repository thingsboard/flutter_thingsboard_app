// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class StopLiveLocationAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult> execute(
    List args,
    InAppWebViewController controller,
  ) async {
    try {
      final service = getIt<ILiveLocationTrackingService>();
      if (service.session == null) {
        return WidgetMobileActionResult.emptyResult();
      }
      await service.stop();
      return WidgetMobileActionResult.successResult(
        MobileActionResult.launched(true),
      );
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.stopLiveLocation;
}
