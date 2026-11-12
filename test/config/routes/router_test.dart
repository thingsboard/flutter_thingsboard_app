// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

import '../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

Widget _page(String name) => Scaffold(body: Text(name));

void main() {
  late ThingsboardAppRouter router;

  setUp(() {
    final localDatabase = MockLocalDatabaseService();
    when(localDatabase.deleteInitialAppLink).thenAnswer((_) async {});
    registerTestDependencies(
      tbClient: MockThingsboardClient(),
      localDatabase: localDatabase,
      firebaseService: MockFirebaseService(),
    );
    router = ThingsboardAppRouter(overlayService: MockOverlayService());
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: GoRouter(
          navigatorKey: globalNavigatorKey,
          routes: [
            GoRoute(path: '/', builder: (_, _) => _page('home')),
            GoRoute(
              path: '/api/noauth/qr',
              builder: (_, _) => _page('qr login'),
            ),
            GoRoute(path: '/login', builder: (_, _) => _page('login')),
            GoRoute(
              path: '/signup/emailVerified',
              builder: (_, _) => _page('email verified'),
            ),
            GoRoute(
              path: '/url/:link',
              builder: (_, state) => _page('web page'),
            ),
            GoRoute(path: '/devices', builder: (_, _) => _page('devices')),
          ],
        ),
      ),
    );
  }

  for (final (link, page) in [
    ('https://app.example/api/noauth/qr?secret=abc&ttl=60', 'qr login'),
    ('tbscheme://app.example/login', 'login'),
    (
      'tbscheme://app.example/signup/emailVerified?emailCode=1',
      'email verified',
    ),
  ]) {
    testWidgets('a link made for the app opens its page: $page', (
      tester,
    ) async {
      await pumpApp(tester);

      // Not awaited, as in the app: the push completes only when the page
      // is closed.
      unawaited(router.navigateByAppLink(link));
      await tester.pumpAndSettle();

      expect(find.text(page), findsOneWidget);
    });
  }

  for (final link in [
    'tbscheme://app.example/url/${Uri.encodeComponent('https://site.example')}',
    'tbscheme://app.example/devices',
  ]) {
    testWidgets('a link to any other page of the app is ignored: $link', (
      tester,
    ) async {
      await pumpApp(tester);

      // Not awaited, as in the app: the push completes only when the page
      // is closed.
      unawaited(router.navigateByAppLink(link));
      await tester.pumpAndSettle();

      expect(find.text('home'), findsOneWidget);
    });
  }

  testWidgets('pages inside the app still open any route', (tester) async {
    await pumpApp(tester);

    unawaited(router.navigateTo('/devices'));
    await tester.pumpAndSettle();

    expect(find.text('devices'), findsOneWidget);
  });
}
