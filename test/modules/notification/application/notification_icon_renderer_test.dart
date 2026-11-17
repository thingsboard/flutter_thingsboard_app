// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
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

    test("renders an MDI glyph from the app's icon font", () async {
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
      final frame = await (await ui.instantiateImageCodec(bytes!))
          .getNextFrame();

      expect(frame.image.width, 64);
      expect(frame.image.height, 64);
    });

    test('leaves a transparent margin around the glyph', () async {
      final bytes = await NotificationIconRenderer.renderPng(
        const IconData(0x41, fontFamily: 'FlutterTest'),
        const Color(0xFFF44336),
        size: 100,
      );
      final image = (await (await ui.instantiateImageCodec(
        bytes!,
      )).getNextFrame()).image;
      final pixels = (await image.toByteData())!;
      int alphaAt(int x, int y) => pixels.getUint8((y * 100 + x) * 4 + 3);

      expect(alphaAt(50, 50), greaterThan(0));
      for (var i = 0; i < 100; i++) {
        for (final (x, y) in [(i, 10), (i, 89), (10, i), (89, i)]) {
          expect(alphaAt(x, y), 0, reason: 'pixel ($x, $y)');
        }
      }
    });

    test('uses the same glyph scale as the iOS notification extension', () {
      final swift = File(
        'ios/NotificationServiceExtension/NotificationService.swift',
      ).readAsStringSync();
      final match = RegExp(r'static let glyphScale: CGFloat = ([\d.]+)')
          .firstMatch(swift);

      expect(match, isNotNull);
      expect(
        double.parse(match!.group(1)!),
        NotificationIconRenderer.glyphScale,
      );
    });
  });
}
