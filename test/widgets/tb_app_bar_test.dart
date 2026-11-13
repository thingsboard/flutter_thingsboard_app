// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

const _home = NavigationItemData(
  title: 'Home',
  icon: Icons.home,
  path: '/home',
);
const _customers = NavigationItemData(
  title: 'Customers',
  icon: Icons.group,
  path: '/customers',
);
const _more = NavigationItemData(
  title: 'More',
  icon: Icons.menu,
  path: morePath,
);

/// Portrait: Customers is one of the pages behind More.
class _PortraitNavigation extends Navigation {
  @override
  NavigationState build() => const NavigationState(
    bottomBarPages: [_home, _more],
    morePages: [_customers],
  );
}

Future<void> _pump(WidgetTester tester, String location) async {
  Widget page(String title) => Scaffold(
    appBar: TbAppBar(title: Text(title)),
    body: Text('$title page'),
  );
  await tester.pumpWidget(
    ProviderScope(
      overrides: [navigationProvider.overrideWith(_PortraitNavigation.new)],
      child: MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: location,
          routes: [
            GoRoute(path: '/home', builder: (_, _) => page('Home')),
            GoRoute(path: '/customers', builder: (_, _) => page('Customers')),
            GoRoute(path: morePath, builder: (_, _) => page('More')),
          ],
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('a More page with nothing below it goes back to More', (
    tester,
  ) async {
    await _pump(tester, '/customers');

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('More page'), findsOneWidget);
  });

  testWidgets('a tab page has no back arrow', (tester) async {
    await _pump(tester, '/home');

    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });
}
