// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_avalible_providers/two_factor_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/two_factor_authentication_page.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

/// A sign-in waiting for its second factor.
class FakeLogin extends Login {
  int logouts = 0;

  @override
  LoginState build() => const LoginState(
    isUserLoaded: true,
    userScope: Authority.PRE_VERIFICATION_TOKEN,
  );

  @override
  Future<void> logout() async => logouts++;
}

const _verification = '/login/mfaConfirm?skipDefault=true';

void main() {
  late FakeLogin login;
  late GoRouter router;

  setUp(() {
    registerTestDependencies(
      tbClient: MockThingsboardClient(),
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    getIt
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
    login = FakeLogin();
    router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (_, _) => const Scaffold(body: Text('login page')),
          routes: [
            GoRoute(
              path: 'mfaConfirm',
              builder: (_, _) =>
                  const TwoFactorAuthenticationPage(skipDefault: true),
            ),
          ],
        ),
      ],
    );
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(() => login),
          twoFaConfirmAvalibleProvidersProvider.overrideWith(
            (_) => Future.value([
              TwoFaProviderInfo(
                (b) => b
                  ..type = TwoFaProviderType.EMAIL
                  ..default_ = true,
              ),
            ]),
          ),
        ],
        child: MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('Back to the login page cancels the unfinished sign-in', (
    tester,
  ) async {
    await pumpApp(tester);
    router.push(_verification);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('login page'), findsOneWidget);
    expect(login.logouts, 1);
  });

  testWidgets('Back to another verification page keeps the sign-in', (
    tester,
  ) async {
    await pumpApp(tester);
    router.push(_verification);
    await tester.pumpAndSettle();
    router.push(_verification);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('login page'), findsNothing);
    expect(login.logouts, 0);
  });
}
