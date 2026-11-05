// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';

NavigationItemData devicesItem({String? label}) => NavigationItemData(
  title: 'Devices',
  icon: Icons.devices_other_outlined,
  path: '/devices',
  id: 'devices',
  label: label,
);

void main() {
  /// Resolves [item]'s title inside a German-localized app, so a localized
  /// default is distinguishable from the English title stored on the item.
  Future<String> resolveTitle(
    WidgetTester tester,
    NavigationItemData item,
  ) async {
    late String title;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('de', 'DE'),
        // A non-English locale needs the framework delegates too, or the
        // MaterialApp refuses to build.
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Builder(
          builder: (context) {
            title = NavigationHelper.getLocalizedTitle(context, item);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    return title;
  }

  group('NavigationHelper.customLabel', () {
    test('returns the label typed in the bundle', () {
      expect(
        NavigationHelper.customLabel(
          const PageLayout(id: Pages.devices, label: 'Machines'),
        ),
        'Machines',
      );
    });

    test('treats a missing or blank label as default', () {
      expect(
        NavigationHelper.customLabel(const PageLayout(id: Pages.devices)),
        isNull,
      );
      expect(
        NavigationHelper.customLabel(
          const PageLayout(id: Pages.devices, label: '   '),
        ),
        isNull,
      );
    });
  });

  group('NavigationHelper.toNavigationItem', () {
    testWidgets('shows the title of a renamed built-in page', (tester) async {
      final item = NavigationHelper.toNavigationItem(
        const PageLayout(id: Pages.devices, label: 'Machines'),
      );

      expect(await resolveTitle(tester, item), 'Machines');
    });

    testWidgets('localizes a built-in page left at its default', (
      tester,
    ) async {
      final item = NavigationHelper.toNavigationItem(
        const PageLayout(id: Pages.devices, label: '   '),
      );

      expect(await resolveTitle(tester, item), 'Geräte');
    });
  });

  group('NavigationHelper.getLocalizedTitle', () {
    testWidgets('shows the bundle label for a built-in page', (tester) async {
      final title = await resolveTitle(tester, devicesItem(label: 'Machines'));

      expect(title, 'Machines');
    });

    testWidgets('localizes a built-in page without a label', (tester) async {
      final title = await resolveTitle(tester, devicesItem());

      expect(title, 'Geräte');
    });

    testWidgets('falls back to the title of a custom page', (tester) async {
      final title = await resolveTitle(
        tester,
        const NavigationItemData(
          title: 'Reports',
          icon: Icons.insert_chart_outlined,
          path: '/dashboard/abc',
        ),
      );

      expect(title, 'Reports');
    });

    testWidgets('keeps the title of a custom page under a profile path', (
      tester,
    ) async {
      final title = await resolveTitle(
        tester,
        const NavigationItemData(
          title: 'Team profile',
          icon: Icons.link,
          path: '/team/profile',
        ),
      );

      expect(title, 'Team profile');
    });

    testWidgets('localizes the More item', (tester) async {
      final title = await resolveTitle(
        tester,
        const NavigationItemData(
          title: 'More',
          icon: Icons.menu_outlined,
          path: '/more',
        ),
      );

      expect(title, 'Mehr');
    });

    testWidgets('localizes the Profile item', (tester) async {
      final title = await resolveTitle(
        tester,
        const NavigationItemData(
          title: 'Profile',
          icon: Icons.person,
          path: fullScreenProfile,
        ),
      );

      expect(title, 'Profil');
    });
  });
}
