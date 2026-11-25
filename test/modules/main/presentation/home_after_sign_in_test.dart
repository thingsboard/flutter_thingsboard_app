// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/main/presentation/home_after_sign_in.dart';

void main() {
  const homePath = '/home';

  group('resolveHomeAfterSignIn', () {
    Future<HomeAfterSignIn?> resolve(
      Map<String, Object?>? additionalInfo, {
      bool canReadDashboards = true,
      bool canOpen = true,
      String? home = homePath,
      List<String>? checked,
    }) => resolveHomeAfterSignIn(
      homePath: home,
      additionalInfo: additionalInfo,
      canReadDashboards: canReadDashboards,
      canOpenDashboard: (id) async {
        checked?.add(id);
        return canOpen;
      },
    );

    test('without a default dashboard the first tab opens', () async {
      const home = (path: homePath, dashboardOnTop: null);
      expect(await resolve({}), home);
      expect(await resolve(null), home);
      expect(await resolve({'defaultDashboardId': ''}), home);
    });

    test('a default dashboard always shown fullscreen opens alone', () async {
      expect(
        await resolve({
          'defaultDashboardId': 'dash-1',
          'defaultDashboardFullscreen': true,
        }),
        (path: '/fullscreenDashboard/dash-1', dashboardOnTop: null),
      );
    });

    test('a default dashboard opens over the first tab', () async {
      expect(
        await resolve({
          'defaultDashboardId': 'dash-1',
          'defaultDashboardFullscreen': false,
        }),
        (path: homePath, dashboardOnTop: 'dash-1'),
      );
    });

    test('a default dashboard the user cannot open is skipped', () async {
      final checked = <String>[];
      expect(
        await resolve(
          {'defaultDashboardId': 'dash-1', 'defaultDashboardFullscreen': true},
          canOpen: false,
          checked: checked,
        ),
        (path: homePath, dashboardOnTop: null),
      );
      expect(checked, ['dash-1']);
    });

    test(
      'without the dashboard permission the dashboard is not requested',
      () async {
        final checked = <String>[];
        expect(
          await resolve(
            {
              'defaultDashboardId': 'dash-1',
              'defaultDashboardFullscreen': true,
            },
            canReadDashboards: false,
            checked: checked,
          ),
          (path: homePath, dashboardOnTop: null),
        );
        expect(checked, isEmpty);
      },
    );

    test('without pages only a fullscreen default dashboard opens', () async {
      expect(
        await resolve({'defaultDashboardId': 'dash-1'}, home: null),
        isNull,
      );
      expect(
        await resolve({
          'defaultDashboardId': 'dash-1',
          'defaultDashboardFullscreen': true,
        }, home: null),
        (path: '/fullscreenDashboard/dash-1', dashboardOnTop: null),
      );
    });
  });

  group('showHomeAfterSignIn', () {
    late GoRouter router;

    String stack() => router.routerDelegate.currentConfiguration.matches
        .map((m) => m.matchedLocation)
        .join(' > ');

    Future<void> pumpRouter(WidgetTester tester) async {
      Widget page(String name) => Text(name);
      router = GoRouter(
        initialLocation: '/login',
        // The app's top-level redirect is async, so go() and push() land
        // only after a later frame.
        redirect: (_, _) => Future.value(),
        routes: [
          GoRoute(path: '/login', builder: (_, _) => page('login')),
          GoRoute(path: homePath, builder: (_, _) => page('home')),
          GoRoute(path: '/dashboard', builder: (_, _) => page('dashboard')),
          GoRoute(
            path: '/fullscreenDashboard/:id',
            builder: (_, _) => page('fullscreen'),
          ),
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();
    }

    testWidgets('opens the default dashboard over Home, then reports the '
        'page shown', (tester) async {
      await pumpRouter(tester);
      final shownAt = <String>[];

      final done = showHomeAfterSignIn(
        router,
        (path: homePath, dashboardOnTop: 'dash-1'),
        isCurrent: () => true,
        onShown: () => shownAt.add(stack()),
      );
      await tester.pumpAndSettle();
      await done;

      expect(stack(), '/home > /dashboard');
      expect(shownAt, ['/home > /dashboard']);
    });

    testWidgets('reports a fullscreen default dashboard as the page shown', (
      tester,
    ) async {
      await pumpRouter(tester);
      final shownAt = <String>[];

      final done = showHomeAfterSignIn(
        router,
        (path: '/fullscreenDashboard/dash-1', dashboardOnTop: null),
        isCurrent: () => true,
        onShown: () => shownAt.add(stack()),
      );
      await tester.pumpAndSettle();
      await done;

      expect(shownAt, ['/fullscreenDashboard/dash-1']);
    });

    testWidgets('a sign-out before Home lands opens no dashboard and reports '
        'nothing', (tester) async {
      await pumpRouter(tester);
      var current = true;
      var shown = false;

      final done = showHomeAfterSignIn(
        router,
        (path: homePath, dashboardOnTop: 'dash-1'),
        isCurrent: () => current,
        onShown: () => shown = true,
      );
      current = false;
      await tester.pumpAndSettle();
      await done;

      expect(stack(), '/home');
      expect(shown, isFalse);
    });
  });
}
