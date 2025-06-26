import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class UnknownAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller,) async{
    return WidgetMobileActionResult.errorResult(
      'Unknown actionType: ${args[0]}',
    );
    
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.unknown;
}
