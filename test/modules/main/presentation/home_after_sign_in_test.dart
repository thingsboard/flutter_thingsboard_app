// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/main/presentation/home_after_sign_in.dart';

void main() {
  const homePath = '/home';

  Future<HomeAfterSignIn?> resolve(
    Map<String, Object?>? additionalInfo, {
    bool isPublic = false,
    bool canReadDashboards = true,
    bool canOpen = true,
    String? home = homePath,
    List<String>? checked,
  }) => resolveHomeAfterSignIn(
    homePath: home,
    additionalInfo: additionalInfo,
    isPublic: isPublic,
    canReadDashboards: canReadDashboards,
    canOpenDashboard: (id) async {
      checked?.add(id);
      return canOpen;
    },
  );

  test('without a default dashboard the first tab opens', () async {
    expect(await resolve({}), const HomeAfterSignIn(path: homePath));
    expect(await resolve(null), const HomeAfterSignIn(path: homePath));
    expect(
      await resolve({'defaultDashboardId': ''}),
      const HomeAfterSignIn(path: homePath),
    );
  });

  test('a default dashboard always shown fullscreen opens alone', () async {
    expect(
      await resolve({
        'defaultDashboardId': 'dash-1',
        'defaultDashboardFullscreen': true,
      }),
      const HomeAfterSignIn(path: '/fullscreenDashboard/dash-1'),
    );
  });

  test('a default dashboard opens over the first tab', () async {
    expect(
      await resolve({
        'defaultDashboardId': 'dash-1',
        'defaultDashboardFullscreen': false,
      }),
      const HomeAfterSignIn(path: homePath, dashboardOnTop: 'dash-1'),
    );
  });

  test('a public user sees the default dashboard fullscreen', () async {
    expect(
      await resolve({'defaultDashboardId': 'dash-1'}, isPublic: true),
      const HomeAfterSignIn(path: '/fullscreenDashboard/dash-1'),
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
      const HomeAfterSignIn(path: homePath),
    );
    expect(checked, ['dash-1']);
  });

  test(
    'without the dashboard permission the dashboard is not requested',
    () async {
      final checked = <String>[];
      expect(
        await resolve(
          {'defaultDashboardId': 'dash-1', 'defaultDashboardFullscreen': true},
          canReadDashboards: false,
          checked: checked,
        ),
        const HomeAfterSignIn(path: homePath),
      );
      expect(checked, isEmpty);
    },
  );

  test('without pages only a fullscreen default dashboard opens', () async {
    expect(await resolve({'defaultDashboardId': 'dash-1'}, home: null), isNull);
    expect(
      await resolve({
        'defaultDashboardId': 'dash-1',
        'defaultDashboardFullscreen': true,
      }, home: null),
      const HomeAfterSignIn(path: '/fullscreenDashboard/dash-1'),
    );
  });
}
