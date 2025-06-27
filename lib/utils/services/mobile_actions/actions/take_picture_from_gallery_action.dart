import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class TakePictureFromGalleryAction extends MobileAction {
  ImageSource get imageSource => ImageSource.gallery;
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller,) {
    return _takePicture(imageSource);
  }

  Future<WidgetMobileActionResult> _takePicture(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final mimeType = lookupMimeType(pickedFile.path);
        if (mimeType != null) {
          final image = File(pickedFile.path);
          final List<int> imageBytes = await image.readAsBytes();
          final String imageUrl =
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
