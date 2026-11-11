// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/bottom_navbar_items.dart';

void main() {
  Future<void> pumpItem(
    WidgetTester tester, {
    required bool showAdditionalIcon,
    TextDirection textDirection = TextDirection.ltr,
  }) => tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: Directionality(
        textDirection: textDirection,
        child: Center(
          child: SizedBox(
            width: 100,
            child: BottomNavbarItems(
              label: 'Notifications',
              icon: Icons.notifications,
              selectedTextStyle: const TextStyle(fontSize: 12),
              unSelectedTextStyle: const TextStyle(fontSize: 12),
              onTap: (_) {},
              index: 0,
              showAdditionalIcon: showAdditionalIcon,
              additionalIcon: const SizedBox(
                key: Key('badge'),
                width: 8,
                height: 8,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  double iconCenter(WidgetTester tester) =>
      tester.getCenter(find.byIcon(Icons.notifications)).dx;
  double labelCenter(WidgetTester tester) =>
      tester.getCenter(find.text('Notifications')).dx;

  for (final textDirection in TextDirection.values) {
    testWidgets('an icon with a badge stays above the middle of its label '
        '(${textDirection.name})', (tester) async {
      await pumpItem(
        tester,
        showAdditionalIcon: true,
        textDirection: textDirection,
      );

      expect(iconCenter(tester), closeTo(labelCenter(tester), 0.5));
      final badge = tester.getCenter(find.byKey(const Key('badge'))).dx;
      final iconEnd = textDirection == TextDirection.ltr
          ? badge > iconCenter(tester)
          : badge < iconCenter(tester);
      expect(iconEnd, isTrue, reason: 'the badge sits at the icon end');
    });
  }

  testWidgets('without a badge the icon is in the same place', (tester) async {
    await pumpItem(tester, showAdditionalIcon: true);
    final withBadge = iconCenter(tester);

    await pumpItem(tester, showAdditionalIcon: false);

    expect(iconCenter(tester), withBadge);
    expect(find.byKey(const Key('badge')), findsNothing);
  });
}
