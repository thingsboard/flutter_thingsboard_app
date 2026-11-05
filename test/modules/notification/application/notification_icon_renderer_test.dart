// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/notification/application/notification_icon_renderer.dart';
import 'package:thingsboard_app/utils/ui/mdi_icons.g.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const pngSignature = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

  group('NotificationIconRenderer', () {
    test('renders an icon glyph to PNG bytes', () async {
      final bytes = await NotificationIconRenderer.renderPng(
        Icons.warning,
        const Color(0xFFF44336),
      );

      expect(bytes, isNotNull);
      expect(bytes!.length, greaterThan(pngSignature.length));
      expect(bytes.sublist(0, pngSignature.length), equals(pngSignature));
    });

    test('renders an MDI glyph from the app\'s icon font', () async {
      final bytes = await NotificationIconRenderer.renderPng(
        mdiIcons['bell']!,
        const Color(0xFFF44336),
      );

      expect(bytes!.sublist(0, pngSignature.length), equals(pngSignature));
    });

    test('renders a square image of the requested size', () async {
      final bytes = await NotificationIconRenderer.renderPng(
        Icons.warning,
        const Color(0xFFF44336),
        size: 64,
      );
      final frame =
          await (await ui.instantiateImageCodec(bytes!)).getNextFrame();

      expect(frame.image.width, 64);
      expect(frame.image.height, 64);
    });
  });
}
