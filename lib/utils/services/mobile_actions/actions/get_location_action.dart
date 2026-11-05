// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/location/i_location_service.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/location_action_result_mapper.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class GetLocationAction extends MobileAction with LocationActionResultMapper {
  @override
  Future<WidgetMobileActionResult> execute(
    List args,
    InAppWebViewController controller,
  ) async {
    try {
      final fix = await getIt<ILocationService>().getCurrentPosition();
      return mapLocationFixToResult(fix);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.getLocation;
}
