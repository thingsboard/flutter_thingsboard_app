// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/version/presentation/view/server_update_required_page.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

void main() {
  test('shows the release, not the build', () {
    expect(displayVersion('4.2.2.8PE-SNAPSHOT.321c31571da'), '4.2.2.8');
    expect(displayVersion('4.3.1'), '4.3.1');
    expect(displayVersion('4.4.0'), '4.4');
    expect(displayVersion('4.0'), '4');
    expect(displayVersion('unknown'), 'unknown');
  });

  const own = 'https://own.example';

  late MockTbClientService clientService;
  late MockEndpointService endpoints;
  late Completer<void> reInitDone;
  late int loginInfoBuilds;

  setUp(() {
    clientService = MockTbClientService();
    when(() => clientService.unsupportedServer).thenReturn(
      ValueNotifier(UnsupportedServerVersionError('4.2.2.8PE', '4.4.0')),
    );
    when(
      () => clientService.reInit(
        endpoint: any(named: 'endpoint'),
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    ).thenAnswer((invocation) async {
      await reInitDone.future;
      (invocation.namedArguments[#onDone] as void Function())();
    });
    endpoints = MockEndpointService();
    when(endpoints.getCachedEndpoint).thenReturn('https://current.example');
    when(endpoints.getEndpoint)
        .thenAnswer((_) async => 'https://current.example');
    when(() => endpoints.setEndpoint(any())).thenAnswer((_) async {});
    when(endpoints.isCustomEndpoint).thenAnswer((_) async => true);
    final firebase = MockFirebaseService();
    when(firebase.clearApps).thenAnswer((_) async {});
    getIt
      ..registerSingleton<TbLogger>(MockTbLogger())
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<IFirebaseService>(firebase);
    addTearDown(getIt.reset);
    loginInfoBuilds = 0;
  });

  Future<void> pumpPage(WidgetTester tester, {String ownServer = ''}) async {
    // Created in the test's fake async zone, so completing it resumes there.
    reInitDone = Completer<void>();
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          oauthProvider.overrideWith((ref) {
            loginInfoBuilds++;
            return Completer<LoginMobileInfo>().future;
          }),
        ],
        child: MaterialApp(
          localizationsDelegates: const [S.delegate],
          home: ServerUpdateRequiredPage(ownServer: ownServer),
        ),
      ),
    );
    ProviderScope.containerOf(
      tester.element(find.byType(ServerUpdateRequiredPage)),
    ).listen(oauthProvider, (_, _) {});
    await tester.pump();
  }

  void verifyReInits(String endpoint, int times) => verify(
    () => clientService.reInit(
      endpoint: endpoint,
      onDone: any(named: 'onDone'),
      onAuthError: any(named: 'onAuthError'),
    ),
  ).called(times);

  testWidgets('names the server the app is on', (tester) async {
    await pumpPage(tester);

    expect(find.text('current.example'), findsOneWidget);
    expect(find.text('4.2.2.8'), findsOneWidget);
  });

  // A QR code switch to an outdated server is rolled back before this page
  // shows: the app's own endpoint is the previous server by then.
  testWidgets('names the outdated server of a rolled back switch', (
    tester,
  ) async {
    when(() => clientService.unsupportedServerEndpoint)
        .thenReturn('https://old.example:443');

    await pumpPage(tester);

    expect(find.text('old.example'), findsOneWidget);
    expect(find.text('current.example'), findsNothing);
  });

  testWidgets('Back to login takes a build for one server back to it and '
      'reloads its login info', (tester) async {
    await pumpPage(tester, ownServer: own);

    await tester.tap(find.text('Back to login'));
    await tester.pump();
    reInitDone.complete();
    await tester.pump();

    verify(() => endpoints.setEndpoint(own)).called(1);
    verifyReInits(own, 1);
    expect(loginInfoBuilds, 2);
    verify(clientService.clearUnsupportedServer).called(1);
  });

  testWidgets('the back gesture leaves the page too', (tester) async {
    await pumpPage(tester);

    await tester.binding.handlePopRoute();
    await tester.pump();

    verify(clientService.clearUnsupportedServer).called(1);
  });

  testWidgets('a second tap or back gesture while leaving does nothing', (
    tester,
  ) async {
    await pumpPage(tester, ownServer: own);

    await tester.tap(find.text('Back to login'));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    await tester.tap(find.byType(FilledButton));
    await tester.binding.handlePopRoute();
    await tester.pump();
    reInitDone.complete();
    await tester.pump();

    verifyReInits(own, 1);
    verify(clientService.clearUnsupportedServer).called(1);
    expect(find.text('Back to login'), findsOneWidget);
  });
}
