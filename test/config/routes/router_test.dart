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
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockAuthUser extends Mock implements AuthUser {}

Widget _page(String name) => Scaffold(body: Text(name));

void main() {
  late ThingsboardAppRouter router;
  late MockThingsboardClient client;

  setUp(() {
    client = MockThingsboardClient();
    final localDatabase = MockLocalDatabaseService();
    when(localDatabase.deleteInitialAppLink).thenAnswer((_) async {});
    registerTestDependencies(
      tbClient: client,
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

      // Not awaited: the push completes only when the page closes.
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

      // Not awaited: the push completes only when the page closes.
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

  /// A signed-in user, or one still on a two-factor step when [mfa] is set.
  void signIn({bool mfa = false}) {
    final user = MockAuthUser();
    when(user.isMfaConfigurationToken).thenReturn(false);
    when(user.isPreVerificationToken).thenReturn(mfa);
    when(client.getAuthUser).thenReturn(user);
  }

  testWidgets('a login link is ignored for a signed-in user', (tester) async {
    signIn();
    await pumpApp(tester);

    unawaited(router.navigateByAppLink('tbscheme://app.example/login'));
    await tester.pumpAndSettle();

    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('a login link still opens during a two-factor step', (
    tester,
  ) async {
    signIn(mfa: true);
    await pumpApp(tester);

    unawaited(router.navigateByAppLink('tbscheme://app.example/login'));
    await tester.pumpAndSettle();

    expect(find.text('login'), findsOneWidget);
  });

  testWidgets('QR login still opens for a signed-in user', (tester) async {
    signIn();
    await pumpApp(tester);

    unawaited(
      router.navigateByAppLink(
        'https://app.example/api/noauth/qr?secret=abc&ttl=60',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('qr login'), findsOneWidget);
  });
}
