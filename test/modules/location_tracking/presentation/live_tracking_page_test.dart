// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/providers/live_tracking_provider.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/view/live_tracking_page.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

class _NoSession extends LiveTracking {
  @override
  LiveTrackingViewState build() => const LiveTrackingViewState();
}

void main() {
  /// Where the back arrow and the title of the page at [path] start.
  Future<(double, double)> header(WidgetTester tester, String path) async {
    final router = GoRouter(
      initialLocation: '/more',
      routes: [
        GoRoute(path: '/more', builder: (_, _) => const Scaffold()),
        GoRoute(path: '/live', builder: (_, _) => const LiveTrackingPage()),
        GoRoute(
          path: '/customers',
          builder: (_, _) =>
              Scaffold(appBar: TbAppBar(title: const Text('Customers'))),
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          navigationProvider.overrideWith(_NoPagesNavigation.new),
          liveTrackingProvider.overrideWith(_NoSession.new),
          lastRecordProvider.overrideWith((ref) => null),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: const [S.delegate],
        ),
      ),
    );
    router.push(path);
    await tester.pumpAndSettle();

    final title = find.descendant(
      of: find.byType(AppBar),
      matching: find.byType(Text),
    );
    return (
      tester.getTopLeft(find.byIcon(Icons.arrow_back)).dx,
      tester.getTopLeft(title.first).dx,
    );
  }

  testWidgets('the header lines up with the other pages', (tester) async {
    final live = await header(tester, '/live');
    final customers = await header(tester, '/customers');

    expect(live, customers);
  });
}
