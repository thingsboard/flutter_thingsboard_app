// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Sizes the test view as an iPhone 17 Pro in [orientation]: a Dynamic Island
/// at the top (portrait) or on the side (landscape), and a home indicator.
void useCutoutPhone(WidgetTester tester, Orientation orientation) {
  final portrait = orientation == Orientation.portrait;
  final padding = portrait
      ? const FakeViewPadding(top: 62 * 3, bottom: 34 * 3)
      : const FakeViewPadding(left: 62 * 3, right: 62 * 3, bottom: 21 * 3);
  tester.view
    ..devicePixelRatio = 3
    ..physicalSize = portrait
        ? const Size(402 * 3, 874 * 3)
        : const Size(874 * 3, 402 * 3)
    ..padding = padding
    ..viewPadding = padding;
  addTearDown(tester.view.reset);
}

/// Scrolls [finder] into view and checks that it is clear of the insets set
/// by [useCutoutPhone].
Future<void> expectClearOfInsets(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  final view = tester.view;
  final ratio = view.devicePixelRatio;
  final size = view.physicalSize / ratio;
  final insets = view.padding;
  final rect = tester.getRect(finder);
  expect(rect.left, greaterThanOrEqualTo(insets.left / ratio));
  expect(rect.right, lessThanOrEqualTo(size.width - insets.right / ratio));
  expect(rect.top, greaterThanOrEqualTo(insets.top / ratio));
  expect(rect.bottom, lessThanOrEqualTo(size.height - insets.bottom / ratio));
}
