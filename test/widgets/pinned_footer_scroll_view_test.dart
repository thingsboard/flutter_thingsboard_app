// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/widgets/pinned_footer_scroll_view.dart';

Future<void> _pump(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: PinnedFooterScrollView(
          footer: const Text('footer'),
          child: Column(
            children: [for (var i = 0; i < 30; i++) Text('line $i')],
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Finder _scrolling(Finder finder) =>
    find.ancestor(of: finder, matching: find.byType(Scrollable));

void main() {
  testWidgets('the footer is pinned below the content', (tester) async {
    await _pump(tester);

    expect(_scrolling(find.text('footer')), findsNothing);
    final size = tester.view.physicalSize / tester.view.devicePixelRatio;
    expect(tester.getRect(find.text('footer')).bottom, size.height);
  });

  testWidgets(
    'the footer scrolls with the content while the keyboard is open',
    (tester) async {
      await _pump(tester);

      tester.view.viewInsets = const FakeViewPadding(bottom: 900);
      addTearDown(tester.view.reset);
      await tester.pumpAndSettle();

      expect(_scrolling(find.text('footer')), findsOneWidget);

      tester.view.resetViewInsets();
      await tester.pumpAndSettle();

      expect(_scrolling(find.text('footer')), findsNothing);
    },
  );
}
