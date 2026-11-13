// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/url/presentation/view/url_page.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

void main() {
  late int webBackCalls;

  setUp(() => webBackCalls = 0);

  Widget urlPage({required bool webCanGoBack, required bool webHasStep}) =>
      Scaffold(
        appBar: UrlPageAppBar(
          url: 'https://thingsboard.io',
          title: ValueNotifier('ThingsBoard'),
          host: ValueNotifier('thingsboard.io'),
          webCanGoBack: webCanGoBack,
          onWebBack: () async {
            webBackCalls++;
            return webHasStep;
          },
        ),
      );

  Future<GoRouter> pump(
    WidgetTester tester, {
    required bool pushedFromMore,
    bool webCanGoBack = false,
    bool webHasStep = true,
  }) async {
    final router = GoRouter(
      initialLocation: pushedFromMore ? '/more' : '/url',
      routes: [
        GoRoute(
          path: '/more',
          builder: (_, _) => const Scaffold(body: Text('More')),
        ),
        GoRoute(
          path: '/url',
          builder: (_, _) =>
              urlPage(webCanGoBack: webCanGoBack, webHasStep: webHasStep),
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [navigationProvider.overrideWith(_NoPagesNavigation.new)],
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: const [S.delegate],
        ),
      ),
    );
    if (pushedFromMore) {
      router.push('/url');
      await tester.pumpAndSettle();
    }
    return router;
  }

  final backArrow = find.byIcon(Icons.arrow_back);

  testWidgets('a page opened from More leads back to it', (tester) async {
    await pump(tester, pushedFromMore: true);

    await tester.tap(backArrow);
    await tester.pumpAndSettle();

    expect(find.text('More'), findsOneWidget);
    expect(find.text('ThingsBoard'), findsNothing);
  });

  testWidgets('a page with nothing to return to has no back arrow', (
    tester,
  ) async {
    await pump(tester, pushedFromMore: false);

    expect(backArrow, findsNothing);
  });

  testWidgets('the back arrow steps through the site history first', (
    tester,
  ) async {
    await pump(tester, pushedFromMore: true, webCanGoBack: true);

    await tester.tap(backArrow);
    await tester.pumpAndSettle();

    expect(webBackCalls, 1);
    expect(find.text('ThingsBoard'), findsOneWidget);
  });

  // iOS: the history callback runs before WKWebView updates its back list, so
  // the page can still think the site has a step back after the last one.
  testWidgets('the back arrow leads to More once the site has no step left', (
    tester,
  ) async {
    await pump(
      tester,
      pushedFromMore: true,
      webCanGoBack: true,
      webHasStep: false,
    );

    await tester.tap(backArrow);
    await tester.pumpAndSettle();

    expect(webBackCalls, 1);
    expect(find.text('More'), findsOneWidget);
    expect(find.text('ThingsBoard'), findsNothing);
  });
}
