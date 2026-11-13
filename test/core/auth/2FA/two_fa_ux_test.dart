// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart' show Override;
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/select_provider_type_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_avalible_providers/two_factor_setup_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_config_success.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/two_factor_auth_force_description.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_view_type.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockTwoFaConfigApi extends Mock
    implements TwoFactorAuthConfigControllerApi {}

class FakeLogin extends Login {
  int logouts = 0;

  @override
  LoginState build() => const LoginState(isUserLoaded: true);

  @override
  Future<void> logout() async => logouts++;
}

final s = lookupS(const Locale('en'));

const _authUrl =
    'otpauth://totp/TB:user@example.com?issuer=TB&secret=ABCDEFGHIJKLMNOP';

Widget _app(Widget home, {List<Override> overrides = const []}) =>
    ProviderScope(
      overrides: [...overrides],
      child: MaterialApp.router(
        localizationsDelegates: S.localizationsDelegates,
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (_, _) => Scaffold(body: home),
              routes: [
                GoRoute(path: 'login', builder: (_, _) => const Text('login')),
              ],
            ),
          ],
        ),
      ),
    );

void main() {
  late MockThingsboardClient client;
  late MockOverlayService overlay;
  late MockTwoFaConfigApi api;

  setUpAll(() {
    registerFallbackValue(TotpTwoFaAccountConfig((b) => b..authUrl = ''));
  });

  setUp(() {
    client = MockThingsboardClient();
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    overlay = MockOverlayService();
    api = MockTwoFaConfigApi();
    when(client.getTwoFactorAuthConfigControllerApi).thenReturn(api);
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
  });

  test('the TOTP key is shown in groups of four', () {
    expect(formatTotpKey('ABCDEFGHIJ'), 'ABCD EFGH IJ');
  });

  group('TOTP setup', () {
    Future<List<String>> pumpTotp(
      WidgetTester tester, {
      bool appOpens = true,
    }) async {
      final opened = <String>[];
      await tester.pumpWidget(
        _app(
          TotpConfigureWidget(
            config: TotpTwoFaAccountConfig((b) => b..authUrl = _authUrl),
            loading: ValueNotifier(false),
            onConfigured: () {},
            openUrl: (url) async {
              opened.add(url);
              return appOpens;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      return opened;
    }

    testWidgets('opens the otpauth link and shows the grouped key', (
      tester,
    ) async {
      final opened = await pumpTotp(tester);

      await tester.tap(find.text(s.openInAuthenticatorApp));
      await tester.pump();

      expect(opened, [_authUrl]);
      expect(find.text('ABCD EFGH IJKL MNOP'), findsOneWidget);
      verifyNever(() => overlay.showInfoNotification(any()));
    });

    testWidgets('says so when no authenticator app is installed', (
      tester,
    ) async {
      await pumpTotp(tester, appOpens: false);

      await tester.tap(find.text(s.openInAuthenticatorApp));
      await tester.pump();

      final message =
          verify(() => overlay.showInfoNotification(captureAny()))
                  .captured
                  .single
              as String Function(BuildContext);
      expect(
        message(tester.element(find.byType(TotpConfigureWidget))),
        s.noAuthenticatorAppFound,
      );
    });

    testWidgets('a wrong code is cleared and the field focused again', (
      tester,
    ) async {
      when(
        () => api.verifyAndSaveTwoFaAccountConfig(
          twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
          verificationCode: any(named: 'verificationCode'),
        ),
      ).thenAnswer(
        (_) => Future(() {
          // The field loses focus while the code is checked.
          FocusManager.instance.primaryFocus?.unfocus();
          throw Exception('wrong code');
        }),
      );
      await pumpTotp(tester);

      await tester.enterText(find.byType(EditableText).last, '123456');
      await tester.pumpAndSettle();

      final field = tester.widget<EditableText>(find.byType(EditableText).last);
      expect(field.controller.text, isEmpty);
      expect(field.focusNode.hasFocus, isTrue);
      expect(find.text('0/6'), findsOneWidget);
      expect(find.text(s.verificationCodeIncorrect), findsOneWidget);
    });
  });

  group('provider list', () {
    Future<void> pumpList(WidgetTester tester, TwoFaViewType type) async {
      await tester.pumpWidget(
        _app(
          SelectProviderTypeWidget(
            type: type,
            avalibleTypes: const [
              TwoFaProviderType.TOTP,
              TwoFaProviderType.EMAIL,
            ],
            activeProviders: const [],
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    for (final type in [TwoFaViewType.setup, TwoFaViewType.force]) {
      testWidgets('${type.name} describes each method and recommends TOTP', (
        tester,
      ) async {
        await pumpList(tester, type);

        expect(find.text(s.twoFaTotpDescription), findsOneWidget);
        expect(find.text(s.twoFaEmailDescription), findsOneWidget);
        expect(find.text(s.recommended), findsOneWidget);
      });
    }

    testWidgets('a sign-in verification lists only the method names', (
      tester,
    ) async {
      await pumpList(tester, TwoFaViewType.confirm);

      expect(find.text(s.twoFaTotpDescription), findsNothing);
      expect(find.text(s.recommended), findsNothing);
    });
  });

  group('forced setup intro', () {
    testWidgets('names the account and offers to log out', (tester) async {
      final login = FakeLogin();
      await tester.pumpWidget(
        _app(
          const TwoFactorAuthForceDescription(email: 'user@example.com'),
          overrides: [loginProvider.overrideWith(() => login)],
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(s.twoFaRequiredByAdmin('user@example.com')),
        findsOneWidget,
      );
      await tester.tap(find.text(s.logout));
      await tester.pumpAndSettle();

      expect(login.logouts, 1);
      expect(find.text('login'), findsOneWidget);
    });
  });

  group('setup success', () {
    Future<void> pumpSuccess(
      WidgetTester tester, {
      required List<TwoFaProviderType> configured,
    }) async {
      await tester.pumpWidget(
        _app(
          const TwoFactorAuthConfigSuccess(
            type: TwoFaProviderType.TOTP,
            isForce: true,
          ),
          overrides: [
            twoFactorSetupAvalibleProvidersProvider.overrideWith(
              (_) => Future.value(const [
                TwoFaProviderType.TOTP,
                TwoFaProviderType.BACKUP_CODE,
              ]),
            ),
            acountTwoFactorSettingsProvider.overrideWith(
              (_) => Future.value(
                AccountTwoFaSettings(
                  (b) => b
                    ..configs = MapBuilder({
                      for (final type in configured)
                        type.name: TotpTwoFaAccountConfig(
                          (b) => b..authUrl = _authUrl,
                        ),
                    }),
                ),
              ),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('names the method and suggests backup codes', (tester) async {
      await pumpSuccess(tester, configured: [TwoFaProviderType.TOTP]);

      expect(
        find.text(s.twoFaProviderEnabled(s.mfaProviderTopt)),
        findsOneWidget,
      );
      expect(find.text(s.addBackupCodesHint), findsOneWidget);
      expect(
        find.widgetWithText(OutlinedButton, s.addVerificationMethod),
        findsOneWidget,
      );
    });

    testWidgets('no backup code hint once they are set up', (tester) async {
      await pumpSuccess(
        tester,
        configured: [TwoFaProviderType.TOTP, TwoFaProviderType.BACKUP_CODE],
      );

      expect(find.text(s.addBackupCodesHint), findsNothing);
    });
  });
}
