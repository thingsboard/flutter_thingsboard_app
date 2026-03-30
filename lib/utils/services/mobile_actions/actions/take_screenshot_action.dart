import 'dart:typed_data';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';
import 'package:thingsboard_app/utils/services/tb_image_gallery_service/i_tb_image_gallery_service.dart';

class TakeScreenshotAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
    List args,
    InAppWebViewController controller,
  ) {
    final saveToGallery = args.length > 1 && args[1] == true;
    return _takeScreenshot(controller, saveToGallery: saveToGallery);
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.takeScreenshot;

  Future<WidgetMobileActionResult> _takeScreenshot(
    InAppWebViewController controller, {
    required bool saveToGallery,
  }) async {
    try {
      final List<int>? imageBytes = await controller.takeScreenshot();
      if (imageBytes != null) {
        if (saveToGallery) {
          getIt<ITbImageGalleryService>().uploadImage(
            Uint8List.fromList(imageBytes),
            title: 'tb_screenshot_${DateTime.now().millisecondsSinceEpoch}.png',
          );
        }

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
