// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_avalible_providers/two_factor_setup_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_provider/two_factor_setup_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_setup.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/cutout_phone.dart';
import '../../../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class FakeLogin extends Login {
  int logouts = 0;

  @override
  LoginState build() => const LoginState(isUserLoaded: true);

  @override
  Future<void> logout() async => logouts++;
}

final s = lookupS(const Locale('en'));

void main() {
  late MockThingsboardClient client;
  late MockOverlayService overlay;

  setUp(() {
    client = MockThingsboardClient();
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    overlay = MockOverlayService();
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
  });

  testWidgets('a setup opened from the profile goes back on an error', (
    tester,
  ) async {
    final login = FakeLogin();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(() => login),
          twoFactorSetupAvalibleProvidersProvider.overrideWith(
            (_) => Future.value([TwoFaProviderType.TOTP]),
          ),
          acountTwoFactorSettingsProvider.overrideWith(
            (_) => Future.error(Exception('settings failed')),
          ),
        ],
        child: MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          routerConfig: GoRouter(
            initialLocation: '/profile',
            routes: [
              GoRoute(
                path: '/profile',
                builder: (_, _) => const Text('profile'),
                routes: [
                  GoRoute(
                    path: 'mfa',
                    builder: (_, _) => const TwoFactorAuthSetup(isForce: false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    GoRouter.of(tester.element(find.text('profile'))).push('/profile/mfa');
    await tester.pumpAndSettle();

    expect(login.logouts, 0);
    expect(find.text('profile'), findsOneWidget);
    verify(() => overlay.showErrorNotification(any())).called(1);
  });

  testWidgets('the setup title is one translated phrase', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(FakeLogin.new),
          twoFactorSetupAvalibleProvidersProvider.overrideWith(
            (_) => Future.value([TwoFaProviderType.SMS]),
          ),
          acountTwoFactorSettingsProvider.overrideWith((_) => Future.value()),
        ],
        child: MaterialApp.router(
          locale: const Locale('de'),
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (_, _) => const TwoFactorAuthSetup(
                  isForce: false,
                  selectedProvider: TwoFaProviderType.SMS,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('SMS-Authenticator aktivieren'), findsOneWidget);
  });

  testWidgets(
    'a required email setup keeps its field above a landscape keyboard',
    (tester) async {
      useCutoutPhone(tester, Orientation.landscape);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            loginProvider.overrideWith(FakeLogin.new),
            twoFactorSetupAvalibleProvidersProvider.overrideWith(
              (_) => Future.value([
                TwoFaProviderType.TOTP,
                TwoFaProviderType.EMAIL,
              ]),
            ),
            acountTwoFactorSettingsProvider.overrideWith((_) => Future.value()),
            generateConfigProvider(TwoFaProviderType.EMAIL).overrideWith(
              (_) => Future.value(
                EmailTwoFaAccountConfig((b) => b..email = 'a@example.com'),
              ),
            ),
          ],
          child: MaterialApp.router(
            localizationsDelegates: S.localizationsDelegates,
            routerConfig: GoRouter(
              routes: [
                GoRoute(
                  path: '/',
                  builder: (_, _) => const TwoFactorAuthSetup(
                    isForce: true,
                    selectedProvider: TwoFaProviderType.EMAIL,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(s.tryAnotherWay), findsOneWidget);
      final field = find.byType(EditableText).first;

      await openLandscapeKeyboard(tester, field);

      expect(tester.takeException(), isNull);
      expectAboveKeyboard(tester, field);
      final another = find.text(s.tryAnotherWay);
      await tester.ensureVisible(another);
      await tester.pumpAndSettle();
      expectAboveKeyboard(tester, another);
    },
  );
}
