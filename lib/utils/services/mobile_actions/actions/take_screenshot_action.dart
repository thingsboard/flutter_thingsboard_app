import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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

  WidgetMobileActionType get type => WidgetMobileActionType.takeScreenshot;
   Future<WidgetMobileActionResult> _takeScreenshot(
    InAppWebViewController controller,
  ) async {
    try {
      final List<int>? imageBytes = await controller.takeScreenshot();
      if (imageBytes != null) {
        final String imageUrl =
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