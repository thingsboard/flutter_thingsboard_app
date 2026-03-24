import 'dart:typed_data';

abstract interface class IGalleryService {
  Future<void> saveImageToGallery(Uint8List imageBytes);
}
