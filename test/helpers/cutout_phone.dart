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

/// Checks that [finder] is clear of the insets set by [useCutoutPhone],
/// after scrolling it into view unless [scrollIntoView] is false.
Future<void> expectClearOfInsets(
  WidgetTester tester,
  Finder finder, {
  bool scrollIntoView = true,
}) async {
  if (scrollIntoView) {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
  }
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

/// The height of the iOS keyboard on a landscape iPhone, in logical pixels.
const landscapeKeyboard = 210.0;

/// The height of the iOS keyboard on a portrait iPhone, in logical pixels.
const portraitKeyboard = 336.0;

/// Focuses [field] and opens a [height] high keyboard below it.
Future<void> openKeyboard(
  WidgetTester tester,
  Finder field, {
  double height = landscapeKeyboard,
}) async {
  await tester.showKeyboard(field);
  tester.view.viewInsets = FakeViewPadding(
    bottom: height * tester.view.devicePixelRatio,
  );
  await tester.pumpAndSettle();
}

/// Checks that [finder] is inside its page's scroll viewport and that the
/// viewport ends above the keyboard.
void expectAboveKeyboard(WidgetTester tester, Finder finder) {
  final rect = tester.getRect(finder);
  final viewport = tester.getRect(
    find.ancestor(of: finder, matching: find.byType(Scrollable)).last,
  );
  expect(rect.top, greaterThanOrEqualTo(viewport.top));
  expect(rect.bottom, lessThanOrEqualTo(viewport.bottom));
  final view = tester.view;
  expect(
    viewport.bottom,
    lessThanOrEqualTo(
      (view.physicalSize.height - view.viewInsets.bottom) /
          view.devicePixelRatio,
    ),
  );
}
