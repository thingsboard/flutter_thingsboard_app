// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

/// Starts a live tracking session from a fully-resolved dashboard config
/// (see the phase 1c wire protocol). Replaces any active session.
class StartLiveLocationAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult> execute(
    List args,
    InAppWebViewController controller,
  ) async {
    try {
      if (args.length < 2 || args[1] is! Map) {
        return WidgetMobileActionResult.errorResult(
          'Live tracking config is missing.',
        );
      }
      final config = LiveTrackingConfig.fromJson(
        Map<String, dynamic>.from(args[1] as Map),
      );
      await getIt<ILiveLocationTrackingService>().start(config);
      return WidgetMobileActionResult.successResult(
        MobileActionResult.launched(true),
      );
    } on FormatException catch (e) {
      return WidgetMobileActionResult.errorResult(e.message);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.startLiveLocation;
}
