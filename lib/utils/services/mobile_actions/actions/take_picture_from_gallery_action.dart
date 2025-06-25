import 'dart:io';

import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class TakePictureFromGalleryAction extends MobileAction {
  ImageSource get imageSource => ImageSource.gallery;
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller) {
    return _takePicture(imageSource);
  }

  Future<WidgetMobileActionResult> _takePicture(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        var mimeType = lookupMimeType(pickedFile.path);
        if (mimeType != null) {
          var image = File(pickedFile.path);
          List<int> imageBytes = await image.readAsBytes();
          String imageUrl =
              UriData.fromBytes(imageBytes, mimeType: mimeType).toString();
          return WidgetMobileActionResult.successResult(
            MobileActionResult.image(imageUrl),
          );
        } else {
          return WidgetMobileActionResult.errorResult(
            'Unknown picture mime type',
          );
        }
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  WidgetMobileActionType get type =>
      WidgetMobileActionType.takePictureFromGallery;
}
