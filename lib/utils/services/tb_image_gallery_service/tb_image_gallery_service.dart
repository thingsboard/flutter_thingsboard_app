import 'dart:typed_data';

import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/tb_image_gallery_service/i_tb_image_gallery_service.dart';

class TbImageGalleryService implements ITbImageGalleryService {
  @override
  Future<void> uploadImage(
    Uint8List imageBytes, {
    required String title,
    String mimeType = 'image/png',
  }) async {
    try {
      final tbClient = getIt<ITbClientService>().client;
      await tbClient.getImageService().uploadImageBytes(
            imageBytes,
            title: title,
            mimeType: mimeType,
          );

      getIt<IOverlayService>().showSuccessNotification(
        (context) => S.of(context).imageSavedToGallery,
        duration: const Duration(seconds: 3),
      );
    } on ThingsboardError catch (e) {
      getIt<IOverlayService>().showErrorNotification(
        (context) => e.message ?? S.of(context).failedToSaveImage,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      getIt<IOverlayService>().showErrorNotification(
        (context) => S.of(context).failedToSaveImage,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
