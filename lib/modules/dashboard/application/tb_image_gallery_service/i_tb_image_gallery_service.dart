// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

abstract interface class ITbImageGalleryService {
  Future<void> uploadImage(
    Uint8List imageBytes, {
    required String title,
    String mimeType,
  });
}
