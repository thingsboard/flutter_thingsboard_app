// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/login/view/login_page.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/communication_service.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_loaded_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/fake_wl.dart';
import '../../../../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockAuthUser extends Mock implements AuthUser {}

class MockOverlayService extends Mock implements IOverlayService {}

class FakeLogin extends Login {
  @override
  LoginState build() => const LoginState(isUserLoaded: false);
}

void main() {
  late MockThingsboardClient client;
  late ICommunicationService events;

  setUp(() {
    client = MockThingsboardClient();
    when(client.getAuthUser).thenReturn(null);
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    final endpoints = MockEndpointService();
    when(endpoints.getCachedEndpoint).thenReturn(EndpointService.europeHost);
    when(endpoints.getSelectedRegion).thenAnswer((_) async => Region.europe);
    final deviceInfo = MockDeviceInfoService();
    when(deviceInfo.getBuildVersion).thenReturn('2.0.0');
    events = CommunicationService(EventBus());
    getIt
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<IDeviceInfoService>(deviceInfo)
      ..registerSingleton<ICommunicationService>(events)
      ..registerSingleton<IOverlayService>(MockOverlayService());
  });

  Future<void> pumpPage(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(FakeLogin.new),
          wlProvider.overrideWith(FakeWl.new),
          oauthProvider.overrideWith((_) => Future.value(LoginMobileInfo())),
        ],
        child: const MaterialApp(
          localizationsDelegates: [S.delegate],
          home: LoginPage(riderectUrl: null),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> sessionChanges(WidgetTester tester, AuthUser? user) async {
    when(client.getAuthUser).thenReturn(user);
    events.fire(const UserLoadedEvent());
    await tester.pumpAndSettle();
  }

  String email(WidgetTester tester) => tester
      .widgetList<EditableText>(find.byType(EditableText))
      .first
      .controller
      .text;

  testWidgets('Log Out from a two-factor page leaves an empty form', (
    tester,
  ) async {
    await pumpPage(tester);
    await tester.enterText(find.byType(EditableText).first, 'a@b.io');

    final twoFactor = MockAuthUser();
    when(twoFactor.isPreVerificationToken).thenReturn(true);
    when(twoFactor.isMfaConfigurationToken).thenReturn(false);
    await sessionChanges(tester, twoFactor);
    expect(email(tester), 'a@b.io');

    await sessionChanges(tester, null);
    expect(email(tester), isEmpty);
  });

  testWidgets('a failed login keeps what was typed', (tester) async {
    await pumpPage(tester);
    await tester.enterText(find.byType(EditableText).first, 'a@b.io');

    await sessionChanges(tester, null);

    expect(email(tester), 'a@b.io');
  });
}
