// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/profile/presentation/view/profile_edit_page.dart';
import 'package:thingsboard_app/utils/services/communication/communication_service.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockUserApi extends Mock implements UserControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockLoadingService extends Mock implements ILoadingService {}

class MockTranslations extends Mock implements ICustomTranslationService {}

class FakeUser extends Fake implements User {}

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

class FakeLogin extends Login {
  @override
  LoginState build() => LoginState(
    isUserLoaded: true,
    userScope: Authority.TENANT_ADMIN,
    user: User(
      (b) => b
        ..email = 'tenant@thingsboard.org'
        ..firstName = 'Tenant'
        ..authority = Authority.TENANT_ADMIN
        ..tenantId.id = 'tenant-1'
        ..tenantId.entityType = EntityType.TENANT
        ..customerId.id = '13814000-1dd2-11b2-8080-808080808080'
        ..customerId.entityType = EntityType.CUSTOMER,
    ),
  );
}

void main() {
  late MockUserApi users;

  setUpAll(() => registerFallbackValue(FakeUser()));

  setUp(() {
    final client = MockThingsboardClient();
    users = MockUserApi();
    when(client.getUserControllerApi).thenReturn(users);
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    final translations = MockTranslations();
    when(() => translations.translate(any()))
        .thenAnswer((call) => call.positionalArguments.first as String? ?? '');
    final loading = MockLoadingService();
    when(() => loading.isLoading).thenReturn(ValueNotifier(false));
    getIt
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService())
      ..registerSingleton<ILoadingService>(loading)
      ..registerSingleton<ICustomTranslationService>(translations)
      ..registerSingleton<ICommunicationService>(
        CommunicationService(EventBus()),
      );
  });

  Future<S> pumpPage(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(FakeLogin.new),
          navigationProvider.overrideWith(_NoPagesNavigation.new),
        ],
        child: MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (_, _) => const ProfileEditPage()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return S.of(tester.element(find.byType(ProfileEditPage)));
  }

  testWidgets('an invalid phone is not saved and says why', (tester) async {
    final s = await pumpPage(tester);
    final phone = find.byWidgetPredicate(
      (w) => w is TextField && w.decoration?.hintText == s.phone,
    );
    await tester.enterText(phone, '12');
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(phone).decoration?.errorText, isNull);

    final apply = find.widgetWithText(ElevatedButton, s.applyChanges);
    await tester.ensureVisible(apply);
    await tester.tap(apply);
    await tester.pumpAndSettle();

    verifyNever(() => users.saveUser(user: any(named: 'user')));
    expect(tester.widget<TextField>(phone).decoration?.errorText, isNotNull);
  });
}
