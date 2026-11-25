// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/version/application/leave_outdated_server.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

import '../../../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

void main() {
  const own = 'https://own.example';
  const outdated = 'https://outdated.example';
  const supported = 'https://supported.example';

  late MockTbClientService clientService;
  late MockEndpointService endpoints;
  late MockFirebaseService firebase;
  late int loginInfoReloads;

  setUp(() {
    clientService = MockTbClientService();
    when(
      () => clientService.reInit(
        endpoint: any(named: 'endpoint'),
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    ).thenAnswer((invocation) async {
      (invocation.namedArguments[#onDone] as void Function())();
    });
    endpoints = MockEndpointService();
    when(() => endpoints.setEndpoint(any())).thenAnswer((_) async {});
    when(endpoints.isCustomEndpoint).thenAnswer((_) async => false);
    firebase = MockFirebaseService();
    when(firebase.clearApps).thenAnswer((_) async {});
    when(() => firebase.initializeApp(options: any(named: 'options')))
        .thenAnswer((_) async => null);
    getIt
      ..registerSingleton<TbLogger>(MockTbLogger())
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<IFirebaseService>(firebase);
    addTearDown(getIt.reset);
    loginInfoReloads = 0;
  });

  Future<void> leave({required String on, required String ownServer}) {
    when(endpoints.getEndpoint).thenAnswer((_) async => on);
    return leaveOutdatedServer(
      ownServer: ownServer,
      reloadLoginInfo: () => loginInfoReloads++,
    );
  }

  test('a build for one server goes back to it from another server', () async {
    await leave(on: outdated, ownServer: own);

    verify(() => endpoints.setEndpoint(own)).called(1);
    verify(firebase.clearApps).called(1);
    verify(
      () => clientService.reInit(
        endpoint: own,
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    ).called(1);
    expect(loginInfoReloads, 1);
    verify(clientService.clearUnsupportedServer).called(1);
  });

  test(
    'a server set with a trailing slash reaches the client without it',
    () async {
      await leave(on: outdated, ownServer: '$own/');

      verify(() => endpoints.setEndpoint(own)).called(1);
      verify(
        () => clientService.reInit(
          endpoint: own,
          onDone: any(named: 'onDone'),
          onAuthError: any(named: 'onAuthError'),
        ),
      ).called(1);
    },
  );

  test('a build for one server that is outdated itself stays on it', () async {
    await leave(on: '$own/', ownServer: own);

    verifyNever(() => endpoints.setEndpoint(any()));
    verifyNever(
      () => clientService.reInit(
        endpoint: any(named: 'endpoint'),
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    );
    verify(clientService.clearUnsupportedServer).called(1);
  });

  test('a build for one server goes back to it from the outdated server the '
      'error was reported for', () async {
    when(() => clientService.unsupportedServerEndpoint).thenReturn(outdated);

    await leave(on: outdated, ownServer: own);

    verify(() => endpoints.setEndpoint(own)).called(1);
    verify(clientService.clearUnsupportedServer).called(1);
  });

  test(
    'a rolled back switch stays on the supported server it went back to',
    () async {
      when(() => clientService.unsupportedServerEndpoint).thenReturn(outdated);

      await leave(on: supported, ownServer: own);

      verifyNever(() => endpoints.setEndpoint(any()));
      verifyNever(firebase.clearApps);
      verifyNever(
        () => clientService.reInit(
          endpoint: any(named: 'endpoint'),
          onDone: any(named: 'onDone'),
          onAuthError: any(named: 'onAuthError'),
        ),
      );
      verify(clientService.clearUnsupportedServer).called(1);
    },
  );

  test(
    'a build with regions stays: its login page can switch the region',
    () async {
      await leave(on: outdated, ownServer: '');

      verifyNever(() => endpoints.setEndpoint(any()));
      expect(loginInfoReloads, 0);
      verify(clientService.clearUnsupportedServer).called(1);
    },
  );
}
