// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/core/select_region/select_region_screen.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../helpers/fake_wl.dart';

class MockEndpointService extends Mock implements IEndpointService {}

class MockTbClientService extends Mock implements ITbClientService {}

class MockRouter extends Mock implements ThingsboardAppRouter {}

class MockTbLogger extends Mock implements TbLogger {}

void main() {
  late MockEndpointService endpoints;
  late MockTbClientService clientService;
  late MockRouter router;
  late FakeWl wl;
  late int oauthBuilds;

  setUp(() {
    endpoints = MockEndpointService();
    clientService = MockTbClientService();
    router = MockRouter();
    wl = FakeWl();
    oauthBuilds = 0;
    when(() => endpoints.setRegion(any())).thenAnswer((_) async {});
    when(() => endpoints.getEndpoint())
        .thenAnswer((_) async => EndpointService.europeHost);
    when(() => router.navigateTo<dynamic>(any())).thenAnswer((_) async => null);
    getIt
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<ThingsboardAppRouter>(router)
      ..registerSingleton<TbLogger>(MockTbLogger());
    addTearDown(getIt.reset);
  });

  setUpAll(() => registerFallbackValue(Region.europe));

  void reInitAnswers(Future<void> Function() answer) => when(
    () => clientService.reInit(
      endpoint: any(named: 'endpoint'),
      onDone: any(named: 'onDone'),
      onAuthError: any(named: 'onAuthError'),
    ),
  ).thenAnswer((_) => answer());

  Future<void> pumpScreen(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    final container = ProviderContainer(
      overrides: [
        wlProvider.overrideWith(() => wl),
        oauthProvider.overrideWith((ref) {
          oauthBuilds++;
          return Future.value(LoginMobileInfo());
        }),
      ],
    );
    addTearDown(container.dispose);
    // The login page watches the login info, which keeps it alive.
    container.listen(oauthProvider, (_, _) {});
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          localizationsDelegates: [S.delegate],
          home: SelectRegionScreen(),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> tapEurope(WidgetTester tester) =>
      tester.tap(find.widgetWithText(ElevatedButton, 'Europe'));

  testWidgets('switches the client, then refreshes the login info', (
    tester,
  ) async {
    reInitAnswers(() async {});
    await pumpScreen(tester);
    expect(oauthBuilds, 1);

    await tapEurope(tester);
    await tester.pump();

    verify(() => endpoints.setRegion(Region.europe)).called(1);
    verify(
      () => clientService.reInit(
        endpoint: EndpointService.europeHost,
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    ).called(1);
    expect(wl.updates, 1);
    expect(oauthBuilds, 2);
    verify(() => router.navigateTo<dynamic>('/')).called(1);
  });

  testWidgets('an unreachable server still leads to the login page', (
    tester,
  ) async {
    reInitAnswers(
      () => Future.error(
        DioException.connectionError(
          requestOptions: RequestOptions(),
          reason: 'offline',
        ),
      ),
    );
    await pumpScreen(tester);

    await tapEurope(tester);
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(oauthBuilds, 2);
    verify(() => router.navigateTo<dynamic>('/')).called(1);
  });

  testWidgets('a second tap while switching is ignored', (tester) async {
    final reInit = Completer<void>();
    reInitAnswers(() => reInit.future);
    await pumpScreen(tester);

    await tapEurope(tester);
    await tester.pump();
    await tapEurope(tester);
    await tester.pump();
    reInit.complete();
    await tester.pump();

    verify(() => endpoints.setRegion(Region.europe)).called(1);
  });
}
