// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'navigation_test_utils.dart';

final builtInPages = Pages.values.where((p) => p != Pages.undefined).toList();

const sysAdminPages = {Pages.home, Pages.notifications, Pages.audit_logs};

Set<Pages> visibleBuiltInPages(LoginState login) => {
  for (final id in builtInPages)
    if (NavigationHelper.isPageVisible(PageLayout(id: id), login)) id,
};

void expectCustomPagesVisible(LoginState login) {
  for (final page in customPages) {
    expect(
      NavigationHelper.isPageVisible(page, login),
      isTrue,
      reason: page.label,
    );
  }
}

NavigationItemData devicesItem() => const NavigationItemData(
  title: 'Devices',
  icon: Icons.devices_other_outlined,
  path: '/devices',
  id: 'devices',
);

void main() {
  group('NavigationHelper.isPageVisible', () {
    group('sysadmin', () {
      // What the server sends SYS_ADMIN: no generic ALL grant, but ALARM and
      // DASHBOARD read are included, so RBAC alone would not hide those pages.
      // `allowedResources` is the page-relevant part of the server's
      // `Resource.resourcesByAuthority`: no DEVICE, ASSET, CUSTOMER or
      // DEVICE_PROFILE.
      final sysAdmin = loginAs(
        Authority.SYS_ADMIN,
        permissions(
          {
            Resource.ALARM: {Operation.READ},
            Resource.DASHBOARD: {Operation.READ},
            Resource.AUDIT_LOG: {Operation.READ},
          },
          allowedResources: {Resource.ALL, Resource.ALARM, Resource.DASHBOARD},
        ),
      );

      test('shows only the allowlisted built-in pages', () {
        expect(visibleBuiltInPages(sysAdmin), sysAdminPages);
      });

      test('shows custom pages', () {
        expectCustomPagesVisible(sysAdmin);
      });

      test('hides a page id unknown to this app version', () {
        expect(
          NavigationHelper.isPageVisible(
            const PageLayout(id: Pages.undefined, label: 'Unknown'),
            sysAdmin,
          ),
          isFalse,
        );
      });

      test('applies the allowlist before permissions are loaded', () {
        expect(
          visibleBuiltInPages(loginAs(Authority.SYS_ADMIN)),
          sysAdminPages,
        );
      });
    });

    test('tenant admin with full permissions sees every page', () {
      expect(visibleBuiltInPages(fullAccessTenantAdmin), builtInPages.toSet());
      expectCustomPagesVisible(fullAccessTenantAdmin);
    });

    test('customer user sees pages backed by their permissions', () {
      final customerUser = loginAs(
        Authority.CUSTOMER_USER,
        permissions(
          {
            Resource.ALARM: {Operation.READ},
          },
          sharedGroups: {EntityType.DEVICE, EntityType.DASHBOARD},
        ),
      );

      expect(visibleBuiltInPages(customerUser), {
        Pages.home,
        Pages.alarms,
        Pages.notifications,
        Pages.device_list,
        Pages.dashboards,
        Pages.live_location_tracking,
      });
      expectCustomPagesVisible(customerUser);
    });

    test('non-sysadmin pages fail open before permissions are loaded', () {
      expect(
        visibleBuiltInPages(loginAs(Authority.CUSTOMER_USER)),
        builtInPages.toSet(),
      );
    });
  });

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
        supportedLocales: S.supportedLocales,
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
