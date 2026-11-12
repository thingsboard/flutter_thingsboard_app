// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/previous_session_mocks.dart';
import '../../../../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

class MockStorage extends Mock implements TbStorage<dynamic> {}

class MockLiveTracking extends Mock implements ILiveLocationTrackingService {}

/// The target host's answer to `/api/auth/user`: the account of the pair.
class _UserAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode({'email': 'user@other.example'}),
    200,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}

const _current = 'https://current.example';
const _other = 'https://other.example';

void main() {
  late MockThingsboardClient client;
  late MockTbClientService clientService;
  late MockEndpointService endpoint;
  late MockStorage storage;
  late MockLiveTracking liveTracking;
  late PreviousSessionMocks previous;
  late ProviderContainer container;

  setUp(() {
    client = MockThingsboardClient();
    clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    when(() => clientService.unsupportedServer).thenReturn(ValueNotifier(null));
    when(
      () => clientService.reInit(
        endpoint: any(named: 'endpoint'),
        onDone: any(named: 'onDone'),
        onAuthError: any(named: 'onAuthError'),
      ),
    ).thenAnswer((_) async {});
    when(client.isAuthenticated).thenReturn(false);
    when(() => client.setUserFromJwtToken(any(), any(), any()))
        .thenAnswer((_) async {});
    when(
      () => client.getLoginDataBySecretKey(
        host: any(named: 'host'),
        key: any(named: 'key'),
      ),
    ).thenAnswer(
      (_) async => LoginResponse(
        (b) => b
          ..token = 'access'
          ..refreshToken = 'refresh',
      ),
    );

    endpoint = MockEndpointService();
    when(endpoint.getEndpoint).thenAnswer((_) async => _current);
    when(() => endpoint.setEndpoint(any())).thenAnswer((_) async {});
    when(endpoint.isCustomEndpoint).thenAnswer((_) async => true);

    storage = MockStorage();
    when(() => storage.getItem(any())).thenAnswer((_) => Future.value());
    when(() => storage.setItem(any(), any())).thenAnswer((_) async {});
    when(() => storage.deleteItem(any())).thenAnswer((_) async {});

    liveTracking = MockLiveTracking();
    when(liveTracking.teardownForLogout).thenAnswer((_) async {});

    getIt
      ..registerSingleton<IEndpointService>(endpoint)
      ..registerSingleton<TbStorage>(storage)
      ..registerSingleton<ILiveLocationTrackingService>(liveTracking);
    previous = PreviousSessionMocks(client);

    NoauthProvider.hostAdapterForTesting = _UserAdapter.new;
    addTearDown(() => NoauthProvider.hostAdapterForTesting = null);

    container = ProviderContainer();
    addTearDown(container.dispose);
    // Kept alive for the whole test, as the view keeps it.
    container.listen(noauthProviderProvider, (_, _) {});
  });

  NoauthProvider notifier() => container.read(noauthProviderProvider.notifier);
  NoAuthState state() => container.read(noauthProviderProvider);

  /// The switch in progress: it waits for the user when it asks.
  late Future<void> switching;

  /// Starts the switch and runs it until it waits for the user (or ends).
  Future<void> startAndSettle({String? host, String? secret}) async {
    switching = notifier().switchEndpoint(
      SwitchEndpointParams(
        data: SwitchEndpointArgs(
          host: host,
          secret: secret,
          uri: Uri.parse('https://link.example/api/noauth/qr'),
        ),
      ),
    );
    await pumpEventQueue();
  }

  group('a link to another server without a login code', () {
    test('waits for the user before anything changes', () async {
      await startAndSettle(host: _other);

      expect(state().step, NoAuthStep.confirming);
      expect(state().host, _other);
      expect(state().signsIn, isFalse);
      verifyNever(() => endpoint.setEndpoint(any()));
      verifyNever(() => client.setUserFromJwtToken(any(), any(), any()));
    });

    test('leaves the app as it was when the user cancels', () async {
      await startAndSettle(host: _other);

      notifier().answerConfirmation(accepted: false);
      await switching;

      expect(state().isCancelled, isTrue);
      verifyNever(() => endpoint.setEndpoint(any()));
      verifyNever(() => client.setUserFromJwtToken(any(), any(), any()));
      verifyNever(liveTracking.teardownForLogout);
    });

    test('changes nothing when the screen closes without an answer', () async {
      await startAndSettle(host: _other);

      container.dispose();
      await switching;

      verifyNever(() => endpoint.setEndpoint(any()));
      verifyNever(() => client.setUserFromJwtToken(any(), any(), any()));
    });

    test('switches to the server once the user continues', () async {
      await startAndSettle(host: _other);

      notifier().answerConfirmation(accepted: true);
      await switching;

      verify(() => endpoint.setEndpoint(_other)).called(greaterThan(0));
    });

    test('stops live tracking before it leaves the server', () async {
      await startAndSettle(host: _other);

      notifier().answerConfirmation(accepted: true);
      await switching;

      verifyInOrder([
        liveTracking.teardownForLogout,
        () => storage.deleteItem('jwt_token'),
        () => endpoint.setEndpoint(_other),
      ]);
    });
  });

  group('a login code', () {
    test(
      'of another server names the account and writes nothing first',
      () async {
        await startAndSettle(host: _other, secret: 'one-time');

        expect(state().step, NoAuthStep.confirming);
        expect(state().signsIn, isTrue);
        expect(state().email, 'user@other.example');
        verifyNever(() => storage.setItem(any(), any()));
        verifyNever(() => endpoint.setEndpoint(any()));
      },
    );

    test(
      'of the current server shows the account to a signed-out user',
      () async {
        await startAndSettle(host: _current, secret: 'one-time');

        expect(state().step, NoAuthStep.confirming);
        expect(state().email, 'user@other.example');
        expect(state().signedIn, isFalse);
        verifyNever(() => storage.setItem(any(), any()));
      },
    );

    test('of the current server asks a signed-in user too', () async {
      when(client.isAuthenticated).thenReturn(true);

      await startAndSettle(host: _current, secret: 'one-time');

      expect(state().step, NoAuthStep.confirming);
      expect(state().signedIn, isTrue);
      verifyNever(() => storage.setItem(any(), any()));
    });

    test('signs in once the user continues', () async {
      await startAndSettle(host: _current, secret: 'one-time');

      notifier().answerConfirmation(accepted: true);
      await switching;

      expect(state().isDone, isTrue);
      verify(() => storage.setItem('jwt_token', 'access')).called(1);
    });

    test('stops live tracking before it signs in to another account', () async {
      when(client.isAuthenticated).thenReturn(true);
      await startAndSettle(host: _other, secret: 'one-time');

      verifyNever(liveTracking.teardownForLogout);
      notifier().answerConfirmation(accepted: true);
      await switching;

      verifyInOrder([
        liveTracking.teardownForLogout,
        () => storage.setItem('jwt_token', 'access'),
        () => endpoint.setEndpoint(_other),
      ]);
    });
  });

  group('the session the user had before a switch', () {
    setUp(() => when(client.isAuthenticated).thenReturn(true));

    Future<void> continueSwitch({String? secret}) async {
      await startAndSettle(host: _other, secret: secret);
      notifier().answerConfirmation(accepted: true);
      await switching;
    }

    test('ends on its server after a switch to another server', () async {
      await continueSwitch();

      verifyInOrder([
        () => previous.users.removeMobileSession(
          xMobileToken: PreviousSessionMocks.pushToken,
          extra: any(named: 'extra'),
        ),
        client.close,
        () => storage.deleteItem('jwt_token'),
        () => endpoint.setEndpoint(_other),
        () => previous.auth.logout(extra: any(named: 'extra')),
        previous.webData.clear,
      ]);
    });

    // Before the new session registers the same device.
    test('drops its push registration before a login code signs in, and '
        'logs out after', () async {
      await continueSwitch(secret: 'one-time');

      verifyInOrder([
        () => previous.users.removeMobileSession(
          xMobileToken: PreviousSessionMocks.pushToken,
          extra: any(named: 'extra'),
        ),
        client.close,
        () => storage.setItem('jwt_token', 'access'),
        () => previous.auth.logout(extra: any(named: 'extra')),
      ]);
    });

    test('is kept when the user cancels', () async {
      await startAndSettle(host: _other);
      notifier().answerConfirmation(accepted: false);
      await switching;

      verifyNever(client.close);
      verifyNever(() => previous.auth.logout(extra: any(named: 'extra')));
      verifyNever(
        () => previous.users.removeMobileSession(
          xMobileToken: any(named: 'xMobileToken'),
          extra: any(named: 'extra'),
        ),
      );
    });

    test('is kept when the other server is outdated', () async {
      when(
        () => clientService.unsupportedServer,
      ).thenReturn(ValueNotifier(UnsupportedServerVersionError('4.2', '4.4')));

      await continueSwitch();

      verifyNever(() => previous.auth.logout(extra: any(named: 'extra')));
    });

    test('nothing is ended for a signed-out user', () async {
      when(client.isAuthenticated).thenReturn(false);

      await continueSwitch();

      verifyNever(client.close);
      verifyNever(() => previous.auth.logout(extra: any(named: 'extra')));
    });
  });
}
