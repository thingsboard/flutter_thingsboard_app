import 'dart:typed_data';

abstract interface class ITbImageGalleryService {
  Future<void> uploadImage(
    Uint8List imageBytes, {
    required String title,
    String mimeType,
  });
}
