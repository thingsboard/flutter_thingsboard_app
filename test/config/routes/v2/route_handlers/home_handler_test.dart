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
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

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
}

class FakeNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);

  @override
  String? resolveHomePath() => '/home';
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
  testWidgets('tells the notification service once the sign-in has moved '
      'to Home', (tester) async {
    final notifications = MockNotificationService();
    getIt
      ..registerSingleton<NotificationService>(notifications)
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
    addTearDown(getIt.reset);

    final handler = HomeHandler();
    final router = GoRouter(
      initialLocation: '/login',
      routes: [
        ShellRoute(
          builder: (context, state, child) =>
              HandlerHost(handler: handler, child: child),
          routes: [
            GoRoute(path: '/login', builder: (_, _) => const Text('login')),
            GoRoute(path: '/home', builder: (_, _) => const Text('home')),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    final shownAt = <String>[];
    when(notifications.onHomeShown)
        .thenAnswer((_) => shownAt.add(router.state.uri.path));

    final login = FakeLogin();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(() => login),
          navigationProvider.overrideWith(FakeNavigation.new),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
    expect(shownAt, isEmpty);

    login.signIn();
    await tester.pumpAndSettle();

    expect(find.text('home'), findsOneWidget);
    expect(shownAt, ['/home']);
  });
}
