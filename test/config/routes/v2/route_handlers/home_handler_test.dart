// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/home_handler.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/fake_navigation.dart';

class MockNotificationService extends Mock implements NotificationService {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class FakeLogin extends Login {
  @override
  LoginState build() => const LoginState(isUserLoaded: false);

  void signIn() => state = const LoginState(
    isUserLoaded: true,
    userScope: Authority.TENANT_ADMIN,
  );

  void signOut() => state = const LoginState(isUserLoaded: false);
}

class HandlerHost extends ConsumerStatefulWidget {
  const HandlerHost({super.key, required this.handler, required this.child});

  final HomeHandler handler;
  final Widget child;

  @override
  ConsumerState<HandlerHost> createState() => _HandlerHostState();
}

class _HandlerHostState extends ConsumerState<HandlerHost> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.handler.init(context, ref),
    );
  }

  @override
  void dispose() {
    widget.handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

void main() {
  late MockNotificationService notifications;
  late GoRouter router;
  late FakeLogin login;
  late List<String> shownAt;

  setUp(() {
    notifications = MockNotificationService();
    getIt
      ..registerSingleton<NotificationService>(notifications)
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
    shownAt = [];
    when(notifications.onHomeShown)
        .thenAnswer((_) => shownAt.add(router.state.uri.path));
    login = FakeLogin();
  });

  tearDown(getIt.reset);

  Future<void> pumpApp(
    WidgetTester tester, {
    required GoRouterRedirect redirect,
  }) async {
    final handler = HomeHandler();
    router = GoRouter(
      initialLocation: '/login',
      redirect: redirect,
      routes: [
        ShellRoute(
          builder: (context, state, child) =>
              HandlerHost(handler: handler, child: child),
          routes: [
            GoRoute(path: '/login', builder: (_, _) => const Text('login')),
            GoRoute(path: '/home', builder: (_, _) => const Text('home')),
            GoRoute(path: '/update', builder: (_, _) => const Text('update')),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(() => login),
          navigationProvider.overrideWith(
            () => NoPagesNavigation(homePath: '/home'),
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('tells the notification service once the sign-in has moved '
      'to Home', (tester) async {
    await pumpApp(tester, redirect: (_, _) => null);
    expect(shownAt, isEmpty);

    login.signIn();
    await tester.pumpAndSettle();

    expect(find.text('home'), findsOneWidget);
    expect(shownAt, ['/home']);
  });

  testWidgets('waits for an asynchronous redirect to land on Home, and '
      'only once', (tester) async {
    // The app's top-level redirect is async, so `go` never lands right away.
    await pumpApp(tester, redirect: (_, _) => Future.value());

    login.signIn();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
    expect(shownAt, ['/home']);

    router.go('/login');
    await tester.pumpAndSettle();
    router.go('/home');
    await tester.pumpAndSettle();
    expect(shownAt, ['/home']);
  });

  testWidgets('a sign-in redirected away from Home stops waiting for Home '
      'at sign-out', (tester) async {
    var updateRequired = true;
    await pumpApp(
      tester,
      redirect: (_, state) => Future.value(
        updateRequired && state.uri.path == '/home' ? '/update' : null,
      ),
    );

    login.signIn();
    await tester.pumpAndSettle();
    expect(find.text('update'), findsOneWidget);
    expect(shownAt, isEmpty);

    login.signOut();
    await tester.pumpAndSettle();
    updateRequired = false;
    router.go('/home');
    await tester.pumpAndSettle();
    expect(shownAt, isEmpty);

    login.signIn();
    await tester.pumpAndSettle();

    expect(find.text('home'), findsOneWidget);
    expect(shownAt, ['/home']);
  });
}
