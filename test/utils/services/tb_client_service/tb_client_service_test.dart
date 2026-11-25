// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/test_dependencies.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockCommunicationService extends Mock implements ICommunicationService {}

void main() {
  late TbClientService service;
  late MockOverlayService overlay;

  setUp(() {
    overlay = MockOverlayService();
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<ICommunicationService>(MockCommunicationService());
    addTearDown(getIt.reset);
    service = TbClientService();
  });

  test('an unsupported server version is recorded until cleared', () {
    final error = UnsupportedServerVersionError('4.2.2', '4.4.0');

    expect(service.reportUnsupportedServer(error), isTrue);
    expect(service.unsupportedServer.value, same(error));

    service.clearUnsupportedServer();
    expect(service.unsupportedServer.value, isNull);
  });

  // A QR code switch reports the server it tried, which is not the server
  // the app ends up on.
  test('the endpoint of an unsupported server is kept until cleared', () {
    final error = UnsupportedServerVersionError('4.2.2', '4.4.0');

    service.reportUnsupportedServer(error, endpoint: 'https://old.example');
    expect(service.unsupportedServerEndpoint, 'https://old.example');

    service.clearUnsupportedServer();
    expect(service.unsupportedServerEndpoint, isNull);

    service.reportUnsupportedServer(error);
    expect(service.unsupportedServerEndpoint, isNull);
  });

  test('other errors are left to the caller', () {
    expect(
      service.reportUnsupportedServer(ThingsboardError(message: 'Bad')),
      isFalse,
    );
    expect(service.unsupportedServer.value, isNull);
  });

  group('a 401 error', () {
    late MockThingsboardClient client;

    setUp(() {
      client = MockThingsboardClient();
      when(client.getAuthUser).thenReturn(null);
      service.client = client;
    });

    void signedIn(bool authenticated) {
      when(client.isAuthenticated).thenReturn(authenticated);
      service.onUserLoaded();
    }

    /// The text of the error toast [service] shows for [error].
    Future<String> toastFor(WidgetTester tester, ThingsboardError error) async {
      late BuildContext context;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [S.delegate],
          home: Builder(
            builder: (c) {
              context = c;
              return const SizedBox();
            },
          ),
        ),
      );
      service.onClientError(error);
      tester.binding.scheduleFrame();
      await tester.pump();
      final builder =
          verify(() => overlay.showErrorNotification(captureAny()))
                  .captured
                  .single
              as String Function(BuildContext);
      return builder(context);
    }

    ThingsboardError unauthorized(String message) => ThingsboardError(
      message: message,
      errorCode: ThingsBoardErrorCode.authentication,
      status: 401,
    );

    testWidgets('that ended the session reads as one expired session', (
      tester,
    ) async {
      signedIn(true);
      signedIn(false);

      expect(
        await toastFor(tester, unauthorized('Token is outdated')),
        'Session has expired',
      );
      // The requests that waited on the refused refresh fail as well.
      service.onClientError(
        ThingsboardError(
          message: 'Session expired!',
          errorCode: ThingsBoardErrorCode.jwtTokenExpired,
        ),
      );
      tester.binding.scheduleFrame();
      await tester.pump();
      verifyNever(() => overlay.showErrorNotification(any()));
    });

    testWidgets('at login keeps the server message', (tester) async {
      signedIn(false);

      expect(
        await toastFor(tester, unauthorized('Invalid username or password')),
        'Invalid username or password',
      );
    });

    testWidgets('well after the session ended keeps the server message', (
      tester,
    ) async {
      var time = DateTime(2026);
      service.now = () => time;
      signedIn(true);
      signedIn(false);
      time = time.add(const Duration(minutes: 1));

      expect(
        await toastFor(tester, unauthorized('Invalid username or password')),
        'Invalid username or password',
      );
    });
  });
}
