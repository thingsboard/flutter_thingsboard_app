import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class TakeScreenshotAction  extends MobileAction {
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(List args, InAppWebViewController controller) {
    return _takeScreenshot(controller);
  }

  @override

  WidgetMobileActionType get type => throw UnimplementedError();
   Future<WidgetMobileActionResult> _takeScreenshot(
    InAppWebViewController controller,
  ) async {
    try {
      List<int>? imageBytes = await controller.takeScreenshot();
      if (imageBytes != null) {
        String imageUrl =
            UriData.fromBytes(imageBytes, mimeType: 'image/png').toString();
        return WidgetMobileActionResult.successResult(
          MobileActionResult.image(imageUrl),
        );
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return handleError(e);
    }
  }
  
}