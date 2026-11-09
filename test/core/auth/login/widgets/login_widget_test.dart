// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_widget.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/fake_wl.dart';

class MockEndpointService extends Mock implements IEndpointService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

LoginMobileInfo loginInfo(List<String> clients) => LoginMobileInfo(
  (b) => b.oAuth2ClientLoginInfos = ListBuilder<OAuth2ClientLoginInfo>([
    for (final name in clients)
      OAuth2ClientLoginInfo(
        (c) => c
          ..name = name
          ..icon = 'github-logo'
          ..url = '/oauth2/authorization/$name',
      ),
    qrCode,
  ]),
);

void main() {
  /// Each oauthProvider build takes the next answer: the first login info,
  /// then the one fetched after a region switch.
  late List<Completer<LoginMobileInfo>> answers;
  late int builds;

  setUp(() {
    answers = [];
    builds = 0;
    final endpoints = MockEndpointService();
    when(() => endpoints.getCachedEndpoint())
        .thenReturn(EndpointService.europeHost);
    when(() => endpoints.getSelectedRegion())
        .thenAnswer((_) async => Region.europe);
    final deviceInfo = MockDeviceInfoService();
    when(() => deviceInfo.getBuildVersion()).thenReturn('2.0.0');
    getIt
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<IDeviceInfoService>(deviceInfo);
    addTearDown(getIt.reset);
  });

  Future<ProviderContainer> pumpLogin(
    WidgetTester tester, {
    bool userLoading = false,
    Size screen = const Size(1080, 2400),
  }) async {
    // A phone screen: the login page lays out to the screen height.
    tester.view.physicalSize = screen;
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    final container = ProviderContainer(
      overrides: [
        wlProvider.overrideWith(FakeWl.new),
        oauthProvider.overrideWith((ref) => answers[builds++].future),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          localizationsDelegates: const [S.delegate],
          home: Scaffold(body: LoginWidget(userLoading: userLoading)),
        ),
      ),
    );
    return container;
  }

  Finder loader() => find.byType(FullScreenLoader);

  testWidgets('keeps the loader up while the login info refreshes', (
    tester,
  ) async {
    answers.add(Completer()..complete(loginInfo([])));
    final container = await pumpLogin(tester);
    await tester.pumpAndSettle();
    expect(loader(), findsNothing);

    // A region switch invalidates the login info: Riverpod keeps the stale
    // value while loading, which must not show as the login page.
    final refreshed = Completer<LoginMobileInfo>();
    answers.add(refreshed);
    container.invalidate(oauthProvider);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(loader(), findsOneWidget);

    refreshed.complete(loginInfo(['GitHub', 'Google']));
    await tester.pumpAndSettle();
    expect(loader(), findsNothing);
    expect(builds, 2);
  });

  testWidgets('keeps the loader up while the signed-in user loads', (
    tester,
  ) async {
    answers.add(Completer()..complete(loginInfo([])));
    await pumpLogin(tester, userLoading: true);
    // The spinner never settles.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(loader(), findsOneWidget);
  });

  // A phone held sideways: the form is taller than the screen and must
  // scroll instead of cutting off the password field and Log In.
  testWidgets('in landscape the whole form can be reached', (tester) async {
    answers.add(Completer()..complete(loginInfo(['GitHub', 'Google'])));
    await pumpLogin(tester, screen: const Size(2400, 1080));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final logIn = find.widgetWithText(ElevatedButton, 'Log In');
    await tester.ensureVisible(logIn);
    await tester.pumpAndSettle();
    final screen = tester.getRect(find.byType(Scaffold));
    expect(tester.getRect(logIn).bottom, lessThanOrEqualTo(screen.bottom));
  });
}
