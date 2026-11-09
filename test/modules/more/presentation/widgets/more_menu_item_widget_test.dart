// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/main/domain/models/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/navigation_badge_widget.dart';
import 'package:thingsboard_app/modules/more/presentation/widgets/more_menu_item_widget.dart';

void main() {
  Future<void> pumpItem(WidgetTester tester, {required bool badge}) =>
      tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MoreMenuItemWidget(
              TbMainNavigationItem(
                title: 'Notifications',
                icon: Icons.notifications,
                path: '/notifications',
                showAdditionalIcon: badge,
              ),
              onTap: () {},
            ),
          ),
        ),
      );

  testWidgets('the Notifications row carries the unread badge', (tester) async {
    await pumpItem(tester, badge: true);

    expect(find.byType(NavigationBadgeWidget), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('other rows have no badge', (tester) async {
    await pumpItem(tester, badge: false);

    expect(find.byType(NavigationBadgeWidget), findsNothing);
  });
}
