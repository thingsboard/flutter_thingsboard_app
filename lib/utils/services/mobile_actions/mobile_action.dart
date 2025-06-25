import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logger/logger.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_action_handler.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

abstract class MobileAction {
  final TbLogger log = TbLogger();
WidgetMobileActionType get type;
  Future<WidgetMobileActionResult> execute(  List<dynamic> args,
    InAppWebViewController controller);
     WidgetMobileActionResult handleError(e) {
    String error;
    if (e is PlatformException) {
      error = e.message ?? e.code;
    } else {
      error = e.toString();
    }
    return WidgetMobileActionResult.errorResult(error);
  }
}