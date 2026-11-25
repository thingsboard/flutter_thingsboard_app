// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

import '../../../helpers/fake_wl.dart';
import '../../../helpers/test_dependencies.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

void main() {
  setUp(() {
    final client = MockThingsboardClient();
    when(client.isSystemAdmin).thenReturn(false);
    final clientService = MockTbClientService();
    when(() => clientService.client).thenReturn(client);
    getIt.registerSingleton<ITbClientService>(clientService);
    addTearDown(getIt.reset);
  });

  Future<void> pump(WidgetTester tester, Widget page) => tester.pumpWidget(
    ProviderScope(
      overrides: [
        navigationProvider.overrideWith(_NoPagesNavigation.new),
        wlProvider.overrideWith(FakeWl.new),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
          routes: [GoRoute(path: '/', builder: (_, _) => page)],
        ),
        localizationsDelegates: const [S.delegate],
      ),
    ),
  );

  final logo = find.byKey(const Key('custom-logo'));

  testWidgets('Home keeps the logo in the header', (tester) async {
    await pump(tester, const DashboardsAppbar(body: SizedBox()));

    expect(logo, findsOneWidget);
  });

  testWidgets('a titled page shows its title instead of the logo', (
    tester,
  ) async {
    await pump(
      tester,
      const DashboardsAppbar(title: 'Dashboards', body: SizedBox()),
    );

    expect(find.text('Dashboards'), findsOneWidget);
    expect(logo, findsNothing);
  });

  testWidgets('the Dashboards page from the menu is titled', (tester) async {
    late DashboardsPage page;
    final route = dashboardRoutes.whereType<GoRoute>().firstWhere(
      (r) => r.path == DashboardRoutes.dashboards,
    );
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: const [S.delegate],
        routerConfig: GoRouter(
          initialLocation: route.path,
          routes: [
            GoRoute(
              path: route.path,
              builder: (context, state) {
                page = route.builder!(context, state) as DashboardsPage;
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );

    expect(page.title, 'Dashboards');
  });
}
