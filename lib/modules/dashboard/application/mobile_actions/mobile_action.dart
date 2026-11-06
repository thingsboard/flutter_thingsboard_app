// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_type.dart';

abstract class MobileAction {
  final TbLogger log = TbLogger();
  WidgetMobileActionType get type;
  Future<WidgetMobileActionResult> execute(
    List<dynamic> args,
    InAppWebViewController controller,
  );
  WidgetMobileActionResult handleError(Object e) {
    String error;
    if (e is PlatformException) {
      error = e.message ?? e.code;
    } else {
      error = e.toString();
    }
    return WidgetMobileActionResult.errorResult(error);
  }
}
