// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class FakeEndpointService implements IEndpointService {
  FakeEndpointService(this.endpoint);

  String endpoint;

  @override
  Future<void> setEndpoint(String endpoint) async => this.endpoint = endpoint;

  @override
  Future<String> getEndpoint() async => endpoint;

  @override
  String getCachedEndpoint() => endpoint;

  // A custom endpoint has no default Firebase app to bring back.
  @override
  Future<bool> isCustomEndpoint() async => true;

  @override
  Future<void> setRegion(Region region) async {}

  @override
  Future<Region?> getSelectedRegion() async => Region.custom;

  @override
  ValueListenable<String?> get listenEndpointChanges => ValueNotifier(null);
}

class MemoryStorage extends Fake implements TbStorage {
  final items = <String, Object?>{};

  @override
  Future<void> setItem(String key, Object? value) async => items[key] = value;

  @override
  Future<void> deleteItem(String key) async => items.remove(key);

  @override
  Future<Object?>? getItem(String key, {Object? defaultValue}) =>
      Future.value(items[key] ?? defaultValue);
}

/// A client service whose re-created client finds [outdatedHost] too old.
class FakeClientService implements ITbClientService {
  FakeClientService(this.client, {required this.outdatedHost});

  @override
  ThingsboardClient client;
  final String outdatedHost;
  final reInits = <String>[];
  final _unsupported = ValueNotifier<UnsupportedServerVersionError?>(null);

  @override
  ValueListenable<UnsupportedServerVersionError?> get unsupportedServer =>
      _unsupported;

  @override
  Future<void> init() async {}

  @override
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  }) async {
    reInits.add(endpoint);
    if (endpoint == outdatedHost) {
      reportUnsupportedServer(
        UnsupportedServerVersionError('4.2.2.8', '4.4.0'),
        endpoint: endpoint,
      );
      return;
    }
    onDone();
  }

  @override
  String? unsupportedServerEndpoint;

  @override
  bool reportUnsupportedServer(Object error, {String? endpoint}) {
    if (error is! UnsupportedServerVersionError) {
      return false;
    }
    unsupportedServerEndpoint = endpoint;
    _unsupported.value = error;
    return true;
  }

  @override
  void clearUnsupportedServer() {
    unsupportedServerEndpoint = null;
    _unsupported.value = null;
  }
}

void main() {
  group('resolveSwitchHost', () {
    const previousEndpoint = 'https://previous';

    test('normalizes the host given in the link', () {
      final args = SwitchEndpointArgs(
        host: 'https://h/',
        uri: Uri.parse('https://other/qr'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), 'https://h');
    });

    test('falls back to the origin of an http(s) link', () {
      final args = SwitchEndpointArgs(
        uri: Uri.parse('https://h:8080/api/noauth/qr?secret=s'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), 'https://h:8080');
    });

    test('keeps the previous endpoint for a custom-scheme link', () {
      final args = SwitchEndpointArgs(
        uri: Uri.parse('thingsboard://login?secret=s'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), previousEndpoint);
    });
  });

  group('switchEndpoint', () {
    const previousEndpoint = 'https://previous.example';
    late HttpServer server;
    late String host;
    late FakeEndpointService endpoints;
    late MemoryStorage storage;
    late MockThingsboardClient client;

    setUp(() async {
      // The target host: the switch verifies the exchanged session there.
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((request) {
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write('{}')
          ..close();
      });
      addTearDown(() => server.close(force: true));
      host = 'http://127.0.0.1:${server.port}';

      endpoints = FakeEndpointService(previousEndpoint);
      storage = MemoryStorage()
        ..items['jwt_token'] = 'previous-token'
        ..items['refresh_token'] = 'previous-refresh';
      client = MockThingsboardClient();
      when(
        () => client.getLoginDataBySecretKey(
          host: any(named: 'host'),
          key: any(named: 'key'),
        ),
      ).thenAnswer(
        (_) async => LoginResponse(
          (b) => b
            ..token = 'scanned-token'
            ..refreshToken = 'scanned-refresh',
        ),
      );
      when(client.isAuthenticated).thenReturn(true);
      final firebase = MockFirebaseService();
      when(firebase.clearApps).thenAnswer((_) async {});

      getIt
        ..registerLazySingleton<TbLogger>(MockTbLogger.new)
        ..registerSingleton<IEndpointService>(endpoints)
        ..registerSingleton<TbStorage>(storage)
        ..registerSingleton<IFirebaseService>(firebase);
      addTearDown(getIt.reset);
    });

    late ProviderContainer container;

    /// Runs the switch a scanned QR code of [host] starts. Without a
    /// [secret] it is a link that only opens the login page of [host].
    Future<void> switchTo(String host, {String? secret = 'secret'}) {
      container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(noauthProviderProvider, (previous, next) {});
      final query = secret == null ? '' : '?secret=$secret';
      return container
          .read(noauthProviderProvider.notifier)
          .switchEndpoint(
            SwitchEndpointParams(
              data: SwitchEndpointArgs(
                secret: secret,
                host: host,
                uri: Uri.parse('$host/api/noauth/qr$query'),
              ),
            ),
          );
    }

    test('moves to a supported server with the scanned session', () async {
      final clientService = FakeClientService(client, outdatedHost: '');
      getIt.registerSingleton<ITbClientService>(clientService);

      await switchTo(host);
      final state = container.read(noauthProviderProvider);

      expect(state.isDone, isTrue);
      expect(state.failure, isNull);
      expect(endpoints.endpoint, host);
      expect(storage.items['jwt_token'], 'scanned-token');
      expect(storage.items['refresh_token'], 'scanned-refresh');
      expect(clientService.reInits, [host]);
    });

    // In a build with a fixed server the login page has no region switch, so
    // staying on an outdated server left a QR code as the only way out.
    test('an outdated server is a failed switch: the app goes back to the '
        'server and the session it had', () async {
      final clientService = FakeClientService(client, outdatedHost: host);
      getIt.registerSingleton<ITbClientService>(clientService);

      await switchTo(host);
      final state = container.read(noauthProviderProvider);

      expect(endpoints.endpoint, previousEndpoint);
      expect(storage.items['jwt_token'], 'previous-token');
      expect(storage.items['refresh_token'], 'previous-refresh');
      expect(clientService.reInits, [host, previousEndpoint]);
      // The server update page still explains what happened, and names the
      // outdated server, not the one the app went back to.
      expect(clientService.unsupportedServer.value, isNotNull);
      expect(clientService.unsupportedServerEndpoint, host);
      expect(state.isDone, isTrue);
      expect(state.failure, isNull);
    });

    test('a link without a login secret to an outdated server goes back to '
        'the server and the session it had too', () async {
      when(() => client.setUserFromJwtToken(any(), any(), any()))
          .thenAnswer((_) async {});
      final clientService = FakeClientService(client, outdatedHost: host);
      getIt.registerSingleton<ITbClientService>(clientService);

      await switchTo(host, secret: null);
      final state = container.read(noauthProviderProvider);

      expect(endpoints.endpoint, previousEndpoint);
      expect(storage.items['jwt_token'], 'previous-token');
      expect(storage.items['refresh_token'], 'previous-refresh');
      expect(clientService.reInits, [host, previousEndpoint]);
      expect(clientService.unsupportedServerEndpoint, host);
      expect(state.isDone, isTrue);
      expect(state.failure, isNull);
    });
  });
}
