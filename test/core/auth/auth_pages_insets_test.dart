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
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/reset_password/reset_password_request_page.dart';
import 'package:thingsboard_app/core/auth/signup/email_verification_page.dart';
import 'package:thingsboard_app/core/auth/signup/email_verified_page.dart';
import 'package:thingsboard_app/core/auth/signup/signup_page.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../helpers/cutout_phone.dart';
import '../../helpers/fake_navigation.dart';
import '../../helpers/fake_wl.dart';
import '../../helpers/test_dependencies.dart';

class MockLoadingService extends Mock implements ILoadingService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockSignUpApi extends Mock implements SignUpControllerApi {}

final s = lookupS(const Locale('en'));

final _signUpInfo = LoginMobileInfo(
  (b) => b.selfRegistrationParams = SignUpSelfRegistrationParams(
    (p) => p
      ..title = ''
      ..fields = ListBuilder<SignUpField>([
        for (final id in [SignUpFieldId.EMAIL, SignUpFieldId.PASSWORD])
          SignUpField(
            (f) => f
              ..id = id
              ..label = id.name
              ..required_ = true,
          ),
      ])
      ..showPrivacyPolicy = true
      ..showTermsOfUse = true,
  ).toBuilder(),
);

Future<void> _pump(
  WidgetTester tester,
  Widget page, {
  bool settle = true,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        navigationProvider.overrideWith(NoPagesNavigation.new),
        wlProvider.overrideWith(FakeWl.new),
        oauthProvider.overrideWith((_) => Future.value(_signUpInfo)),
      ],
      child: MaterialApp.router(
        localizationsDelegates: S.localizationsDelegates,
        routerConfig: GoRouter(
          routes: [GoRoute(path: '/', builder: (_, _) => page)],
        ),
      ),
    ),
  );
  if (settle) await tester.pumpAndSettle();
}

Finder _button(String text) => find.ancestor(
  of: find.text(text),
  matching: find.bySubtype<ButtonStyleButton>(),
);

void main() {
  setUp(() {
    final client = MockThingsboardClient();
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    final loading = MockLoadingService();
    when(() => loading.isLoading).thenReturn(ValueNotifier(false));
    final deviceInfo = MockDeviceInfoService();
    when(deviceInfo.getApplicationId).thenReturn('org.thingsboard.app');
    when(deviceInfo.getPlatformType).thenReturn(PlatformType.IOS);
    getIt
      ..registerSingleton<ILoadingService>(loading)
      ..registerSingleton<IDeviceInfoService>(deviceInfo);

    final signUpApi = MockSignUpApi();
    when(client.getSignUpControllerApi).thenReturn(signUpApi);
    when(
      () => signUpApi.activateUserByEmailCode(
        emailCode: any(named: 'emailCode'),
        pkgName: any(named: 'pkgName'),
        platform: any(named: 'platform'),
      ),
    ).thenAnswer((_) async => Response(requestOptions: RequestOptions()));
  });

  for (final orientation in Orientation.values) {
    group(orientation.name, () {
      testWidgets('the password reset request fits a phone with a cutout', (
        tester,
      ) async {
        useCutoutPhone(tester, orientation);
        await _pump(tester, const ResetPasswordRequestPage());

        expect(tester.takeException(), isNull);
        await expectClearOfInsets(tester, find.byType(EditableText));
        await expectClearOfInsets(tester, _button(s.requestPasswordReset));
      });

      testWidgets('the activated account fits a phone with a cutout', (
        tester,
      ) async {
        useCutoutPhone(tester, orientation);
        await _pump(tester, const EmailVerifiedPage(emailCode: 'code'));

        expect(tester.takeException(), isNull);
        await expectClearOfInsets(
          tester,
          _button(s.login),
          scrollIntoView: false,
        );
        await expectClearOfInsets(tester, find.text(s.accountActivated));
      });

      testWidgets('the sent verification email fits a phone with a cutout', (
        tester,
      ) async {
        useCutoutPhone(tester, orientation);
        await _pump(
          tester,
          const EmailVerificationPage(email: 'new.user@example.com'),
        );

        expect(tester.takeException(), isNull);
        await expectClearOfInsets(
          tester,
          _button(s.resend),
          scrollIntoView: false,
        );
        await expectClearOfInsets(
          tester,
          find.text(s.emailVerificationInstructionsText),
        );
      });
    });
  }

  testWidgets('the activating account is centered on the screen', (
    tester,
  ) async {
    useCutoutPhone(tester, Orientation.portrait);
    // Narrower than the screen, as the text is with a real font.
    tester.platformDispatcher.textScaleFactorTestValue = 0.25;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await _pump(
      tester,
      const EmailVerifiedPage(emailCode: 'code'),
      settle: false,
    );

    final top = tester.getRect(find.text(s.activatingAccount)).top;
    final bottom = tester.getRect(find.text(s.activatingAccountText)).bottom;
    final view = tester.view;
    final ratio = view.devicePixelRatio;
    final screenTop = view.padding.top / ratio;
    final screenBottom =
        (view.physicalSize.height - view.padding.bottom) / ratio;
    expect(
      ((top + bottom) / 2 - (screenTop + screenBottom) / 2).abs(),
      lessThan(1),
    );
    final spinner = tester.getRect(find.byType(TbProgressIndicator));
    final screenWidth = view.physicalSize.width / ratio;
    expect((spinner.center.dx - screenWidth / 2).abs(), lessThan(1));
  });

  testWidgets('the focused sign up field stays above a landscape keyboard', (
    tester,
  ) async {
    useCutoutPhone(tester, Orientation.landscape);
    await _pump(tester, const SignUpPage());
    final email = find.byType(EditableText).first;

    await openKeyboard(tester, email);

    expect(tester.takeException(), isNull);
    expectAboveKeyboard(tester, email);
  });
}
