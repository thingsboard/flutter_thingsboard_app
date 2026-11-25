// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
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
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/backup_code_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/code_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/email_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_view_type.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/connection_error.dart';
import '../../../helpers/cutout_phone.dart';
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

/// An iPhone with a camera cutout and a home indicator, in [orientation].
void _phone(WidgetTester tester, Orientation orientation) {
  final portrait = orientation == Orientation.portrait;
  final padding = portrait
      ? const FakeViewPadding(top: 62 * 3, bottom: 34 * 3)
      : const FakeViewPadding(left: 62 * 3, right: 62 * 3, bottom: 21 * 3);
  tester.view
    ..devicePixelRatio = 3
    ..physicalSize = portrait
        ? const Size(402 * 3, 874 * 3)
        : const Size(874 * 3, 402 * 3)
    ..padding = padding
    ..viewPadding = padding;
  addTearDown(tester.view.reset);
}

/// Scrolls to [buttonText]'s button and checks that it is clear of the cutout
/// and the home indicator set by [_phone].
Future<void> _expectClearOfInsets(
  WidgetTester tester,
  String buttonText,
) async {
  final text = find.text(buttonText);
  await tester.ensureVisible(text);
  await tester.pumpAndSettle();
  final view = tester.view;
  final size = view.physicalSize / view.devicePixelRatio;
  final insets = view.padding;
  final ratio = view.devicePixelRatio;
  final button = tester.getRect(
    find.ancestor(
      of: text,
      matching: find.byWidgetPredicate((w) => w is ButtonStyleButton),
    ),
  );
  expect(button.left, greaterThanOrEqualTo(insets.left / ratio));
  expect(button.right, lessThanOrEqualTo(size.width - insets.right / ratio));
  expect(button.top, greaterThanOrEqualTo(insets.top / ratio));
  expect(button.bottom, lessThanOrEqualTo(size.height - insets.bottom / ratio));
}

/// [child] with the app bar and padding of a 2FA page, as BaseTwoFactorLayout
/// lays it out.
Widget _twoFaPage(Widget child) => Scaffold(
  appBar: AppBar(title: const Text('2FA')),
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: child,
    ),
  ),
);

void main() {
  late MockThingsboardClient client;
  late MockOverlayService overlay;
  late MockTwoFaConfigApi api;
  late ITbClientService clientService;

  setUpAll(() {
    registerFallbackValue(TotpTwoFaAccountConfig((b) => b..authUrl = ''));
  });

  setUp(() {
    client = MockThingsboardClient();
    clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    overlay = MockOverlayService();
    api = MockTwoFaConfigApi();
    when(client.getTwoFactorAuthConfigControllerApi).thenReturn(api);
    when(() => clientService.reportUnsupportedServer(any())).thenReturn(false);
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
  });

  test('the TOTP key is shown in groups of four', () {
    expect(formatTotpKey('ABCDEFGHIJ'), 'ABCD EFGH IJ');
  });

  group('TOTP setup', () {
    late FakeLogin login;

    Future<List<String>> pumpTotp(
      WidgetTester tester, {
      bool appOpens = true,
    }) async {
      final opened = <String>[];
      login = FakeLogin();
      await tester.pumpWidget(
        _app(
          overrides: [loginProvider.overrideWith(() => login)],
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

    void answerCheck(Object error) =>
        when(
          () => api.verifyAndSaveTwoFaAccountConfig(
            twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
            verificationCode: any(named: 'verificationCode'),
            extra: any(named: 'extra'),
          ),
        ).thenAnswer(
          (_) => Future(() {
            // The field loses focus while the code is checked.
            FocusManager.instance.primaryFocus?.unfocus();
            throw error;
          }),
        );

    Future<void> submit(WidgetTester tester, String code) async {
      await tester.enterText(find.byType(EditableText).last, code);
      await tester.pumpAndSettle();
    }

    EditableText codeField(WidgetTester tester) =>
        tester.widget<EditableText>(find.byType(EditableText).last);

    testWidgets('a wrong code is cleared and the field focused again', (
      tester,
    ) async {
      answerCheck(
        ThingsboardError(
          message: 'Verification code is incorrect',
          status: 400,
        ),
      );
      await pumpTotp(tester);

      await submit(tester, '123456');

      expect(codeField(tester).controller.text, isEmpty);
      expect(codeField(tester).focusNode.hasFocus, isTrue);
      expect(find.text('0/6'), findsOneWidget);
      expect(find.text(s.verificationCodeIncorrect), findsOneWidget);
    });

    testWidgets('too many attempts are named as such', (tester) async {
      answerCheck(ThingsboardError(message: 'Too many requests', status: 429));
      await pumpTotp(tester);

      await submit(tester, '123456');

      expect(find.text(s.verificationCodeManyRequest), findsOneWidget);
      expect(find.text(s.verificationCodeIncorrect), findsNothing);
    });

    testWidgets('another answer shows what the server says', (tester) async {
      answerCheck(
        ThingsboardError(message: 'Unable to save the config', status: 500),
      );
      await pumpTotp(tester);

      await submit(tester, '123456');

      expect(find.text('Unable to save the config'), findsOneWidget);
      expect(find.text(s.verificationCodeIncorrect), findsNothing);
    });

    testWidgets(
      'no connection keeps the code and opens the connection dialog',
      (tester) async {
        answerCheck(unreachableServer());
        await pumpTotp(tester);

        await submit(tester, '123456');

        verify(overlay.showConnectionErrorDialog).called(1);
        expect(codeField(tester).controller.text, '123456');
        expect(find.text(s.verificationCodeIncorrect), findsNothing);
      },
    );

    testWidgets('an expired session is reported and signed out', (
      tester,
    ) async {
      answerCheck(
        ThingsboardError(
          message: 'Session expired!',
          errorCode: ThingsBoardErrorCode.jwtTokenExpired,
        ),
      );
      await pumpTotp(tester);

      await submit(tester, '123456');

      final message =
          verify(() => overlay.showErrorNotification(captureAny()))
                  .captured
                  .single
              as String Function(BuildContext);
      expect(
        message(tester.element(find.byType(TotpConfigureWidget))),
        s.sessionExpired,
      );
      expect(login.logouts, 1);
      expect(find.text('Session expired!'), findsNothing);
    });

    testWidgets('the code is checked without the global error toast', (
      tester,
    ) async {
      answerCheck(ThingsboardError(message: 'Too many requests', status: 429));
      await pumpTotp(tester);

      await submit(tester, '123456');

      final extra = verify(
        () => api.verifyAndSaveTwoFaAccountConfig(
          twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
          verificationCode: '123456',
          extra: captureAny(named: 'extra'),
        ),
      ).captured.single;
      expect(extra, silentRequestExtra());
    });
  });

  group('email setup', () {
    testWidgets('too many attempts are named as such', (tester) async {
      when(
        () => api.submitTwoFaAccountConfig(
          twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
        ),
      ).thenAnswer((_) async => Response(requestOptions: RequestOptions()));
      when(
        () => api.verifyAndSaveTwoFaAccountConfig(
          twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
          verificationCode: any(named: 'verificationCode'),
          extra: any(named: 'extra'),
        ),
      ).thenThrow(ThingsboardError(message: 'Too many requests', status: 429));
      await tester.pumpWidget(
        _app(
          overrides: [loginProvider.overrideWith(FakeLogin.new)],
          EmailConfigureWidget(
            config: EmailTwoFaAccountConfig((b) => b..email = 'a@example.com'),
            loading: ValueNotifier(false),
            onConfigured: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text(s.sendCode));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(EditableText).last, '123456');
      await tester.pumpAndSettle();

      expect(find.text(s.verificationCodeManyRequest), findsOneWidget);
    });

    testWidgets('the email field stays above a landscape keyboard', (
      tester,
    ) async {
      _phone(tester, Orientation.landscape);
      await tester.pumpWidget(
        _app(
          overrides: [loginProvider.overrideWith(FakeLogin.new)],
          _twoFaPage(
            EmailConfigureWidget(
              config: EmailTwoFaAccountConfig(
                (b) => b..email = 'a@example.com',
              ),
              loading: ValueNotifier(false),
              onConfigured: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final field = find.byType(EditableText).first;

      await openKeyboard(tester, field);

      expect(tester.takeException(), isNull);
      expectAboveKeyboard(tester, field);
    });
  });

  group('code step', () {
    testWidgets('another way stays in view above a portrait keyboard', (
      tester,
    ) async {
      _phone(tester, Orientation.portrait);
      await tester.pumpWidget(
        _app(
          _twoFaPage(
            CodeWidget(
              onSubmnit: (_) {},
              title: 'A code was sent',
              resendTimeoutSeconds: 30,
              data: getTwoFaProviderData(TwoFaProviderType.EMAIL),
              resend: () {},
              alternative: OutlinedButton(
                onPressed: () {},
                child: Text(s.tryAnotherWay),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await openKeyboard(
        tester,
        find.byType(EditableText).first,
        height: portraitKeyboard,
      );

      expect(tester.takeException(), isNull);
      expectAboveKeyboard(tester, find.text(s.tryAnotherWay));
    });
  });

  group('backup codes', () {
    testWidgets('every code and Done can be reached in landscape', (
      tester,
    ) async {
      when(
        () => api.verifyAndSaveTwoFaAccountConfig(
          twoFaAccountConfig: any(named: 'twoFaAccountConfig'),
          verificationCode: any(named: 'verificationCode'),
          extra: any(named: 'extra'),
        ),
      ).thenAnswer((_) async => Response(requestOptions: RequestOptions()));
      final codes = [for (var i = 0; i < 10; i++) 'code000$i'];
      _phone(tester, Orientation.landscape);
      await tester.pumpWidget(
        _app(
          _twoFaPage(
            BackupCodeConfigureWidget(
              config: BackupCodeTwoFaAccountConfig(
                (b) => b..codes = SetBuilder<String>(codes),
              ),
              loading: ValueNotifier(false),
              onConfigured: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      await _expectClearOfInsets(tester, s.done);
      final lastCode = find.text(codes.last);
      await tester.ensureVisible(lastCode);
      await tester.pumpAndSettle();
      final size = tester.view.physicalSize / tester.view.devicePixelRatio;
      expect(tester.getRect(lastCode).bottom, lessThanOrEqualTo(size.height));
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

    testWidgets('every method can be reached in landscape', (tester) async {
      _phone(tester, Orientation.landscape);
      await tester.pumpWidget(
        _app(
          _twoFaPage(
            const SelectProviderTypeWidget(
              type: TwoFaViewType.setup,
              avalibleTypes: [
                TwoFaProviderType.TOTP,
                TwoFaProviderType.SMS,
                TwoFaProviderType.EMAIL,
                TwoFaProviderType.BACKUP_CODE,
              ],
              activeProviders: [TwoFaProviderType.EMAIL],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final last = find.byType(ListTile).last;
      await tester.ensureVisible(last);
      await tester.pumpAndSettle();
      final size = tester.view.physicalSize / tester.view.devicePixelRatio;
      expect(tester.getRect(last).bottom, lessThanOrEqualTo(size.height));
    });

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

    for (final orientation in Orientation.values) {
      testWidgets('fits a phone with a cutout in ${orientation.name}', (
        tester,
      ) async {
        _phone(tester, orientation);
        await tester.pumpWidget(
          _app(
            const TwoFactorAuthForceDescription(email: 'user@example.com'),
            overrides: [loginProvider.overrideWith(FakeLogin.new)],
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        await _expectClearOfInsets(tester, s.setUpAVerificationMethod);
        await _expectClearOfInsets(tester, s.logout);
      });
    }
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

    for (final orientation in Orientation.values) {
      testWidgets('fits a phone with a cutout in ${orientation.name}', (
        tester,
      ) async {
        _phone(tester, orientation);
        await pumpSuccess(tester, configured: [TwoFaProviderType.TOTP]);

        expect(tester.takeException(), isNull);
        await _expectClearOfInsets(tester, s.loginToApp);
        await _expectClearOfInsets(tester, s.addVerificationMethod);
      });
    }
  });
}
