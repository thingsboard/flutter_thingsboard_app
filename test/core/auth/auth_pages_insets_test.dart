// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/reset_password/reset_password_request_page.dart';
import 'package:thingsboard_app/core/auth/signup/email_verified_page.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../helpers/cutout_phone.dart';
import '../../helpers/fake_wl.dart';
import '../../helpers/test_dependencies.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

class MockLoadingService extends Mock implements ILoadingService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockDio extends Mock implements Dio {}

class MockSignUpApi extends Mock implements SignUpControllerApi {}

final s = lookupS(const Locale('en'));

Future<void> _pump(WidgetTester tester, Widget page) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        navigationProvider.overrideWith(_NoPagesNavigation.new),
        wlProvider.overrideWith(FakeWl.new),
      ],
      child: MaterialApp.router(
        localizationsDelegates: S.localizationsDelegates,
        routerConfig: GoRouter(
          routes: [GoRoute(path: '/', builder: (_, _) => page)],
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Finder _button(String text) => find.ancestor(
  of: find.text(text),
  matching: find.byWidgetPredicate((w) => w is ButtonStyleButton),
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

    // The account is activated without tokens, whichever API the build uses.
    final dio = MockDio();
    when(() => client.dio).thenReturn(dio);
    when(
      () => dio.post<Map<String, dynamic>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
      ),
    ).thenAnswer(
      (_) async =>
          Response(requestOptions: RequestOptions(), data: <String, dynamic>{}),
    );
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
        await expectClearOfInsets(tester, find.text(s.accountActivated));
        await expectClearOfInsets(tester, _button(s.login));
      });
    });
  }
}
