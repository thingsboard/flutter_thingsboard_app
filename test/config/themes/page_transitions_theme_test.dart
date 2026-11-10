// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

void main() {
  test('iOS pages slide in and can be swiped back', () {
    expect(
      pageTransitionsTheme.builders[TargetPlatform.iOS],
      isA<CupertinoPageTransitionsBuilder>(),
    );
  });

  test('Android keeps the fade transition', () {
    expect(
      pageTransitionsTheme.builders[TargetPlatform.android],
      isA<FadeOpenPageTransitionsBuilder>(),
    );
  });

  testWidgets('an iOS page pushed on top is closed by an edge swipe', (
    tester,
  ) async {
    final navigator = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigator,
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          pageTransitionsTheme: pageTransitionsTheme,
        ),
        home: const Text('first'),
      ),
    );
    navigator.currentState!.push(
      MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: Text('second')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('first'), findsNothing);

    await tester.dragFrom(const Offset(5, 300), const Offset(600, 0));
    await tester.pumpAndSettle();

    expect(find.text('second'), findsNothing);
    expect(find.text('first'), findsOneWidget);
  });
}
