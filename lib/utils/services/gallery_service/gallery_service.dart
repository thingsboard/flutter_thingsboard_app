import 'dart:io';
import 'dart:typed_data';

import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/gallery_service/i_gallery_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class GalleryService implements IGalleryService {
  @override
  Future<void> saveImageToGallery(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final file = File(
      '${tempDir.path}/tb_image_${DateTime.now().millisecondsSinceEpoch}.png',
    );

    try {
      await file.writeAsBytes(imageBytes);
      await Gal.putImage(file.path);
    } finally {
      if (file.existsSync()) {
        await file.delete();
      }
    }

    getIt<IOverlayService>().showSuccessNotification(
      (context) => S.of(context).imageSavedToGallery,
      duration: const Duration(seconds: 3),
    );
  }
}
