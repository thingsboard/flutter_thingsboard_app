// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_type.dart';
import 'package:thingsboard_app/modules/dashboard/application/tb_image_gallery_service/i_tb_image_gallery_service.dart';

class TakePictureFromGalleryAction extends MobileAction {
  ImageSource get imageSource => ImageSource.gallery;

  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
    List args,
    InAppWebViewController controller,
  ) {
    final saveToGallery = args.length > 1 && args[1] == true;
    return _takePicture(imageSource, saveToGallery: saveToGallery);
  }

  Future<WidgetMobileActionResult> _takePicture(
    ImageSource source, {
    required bool saveToGallery,
  }) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final mimeType = lookupMimeType(pickedFile.path);
        if (mimeType != null) {
          final image = File(pickedFile.path);
          final List<int> imageBytes = await image.readAsBytes();

          if (saveToGallery) {
            final title = source == ImageSource.camera
                ? 'tb_photo_${DateTime.now().millisecondsSinceEpoch}.${extensionFromMime(mimeType)}'
                : pickedFile.name;

            unawaited(
              getIt<ITbImageGalleryService>().uploadImage(
                Uint8List.fromList(imageBytes),
                title: title,
                mimeType: mimeType,
              ),
            );
          }

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
