// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/utils.dart';

import '../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

class MockOverlayService extends Mock implements IOverlayService {}

const _endpoint = 'https://tb.example.com:8443';
const _token = 'access-token';

void main() {
  late MockThingsboardClient client;
  late MockEndpointService endpointService;

  setUp(() {
    client = MockThingsboardClient();
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    endpointService = MockEndpointService();
    when(() => endpointService.getCachedEndpoint()).thenReturn(_endpoint);
    getIt.registerSingleton<IEndpointService>(endpointService);
    when(() => client.apiEndpoint).thenReturn(_endpoint);
    when(() => client.getJwtToken()).thenReturn(_token);
  });

  /// The network images the helper asked for, with the headers it sent.
  Future<List<NetworkImage>> requestedImages(
    WidgetTester tester,
    String value,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Utils.imageFromTbImage(context, client, value),
        ),
      ),
    );
    return tester
        .widgetList<Image>(find.byType(Image))
        .map((image) => image.image)
        .whereType<NetworkImage>()
        .toList();
  }

  testWidgets('a server image is loaded from the endpoint with the token', (
    tester,
  ) async {
    final images = await requestedImages(
      tester,
      'tb-image;/api/images/tenant/logo.png',
    );

    expect(images.single.url, '$_endpoint/api/images/tenant/logo.png');
    expect(images.single.headers, {'X-Authorization': 'Bearer $_token'});
  });

  for (final value in [
    '@other.example/api/images/tenant/logo.png',
    '.other.example/api/images/tenant/logo.png',
    'tb-image;@other.example/api/images/system/logo.png',
  ]) {
    testWidgets('a value that does not start with the image path is not '
        'loaded with the token: $value', (tester) async {
      final images = await requestedImages(tester, value);

      expect(images.where((image) => image.headers != null), isEmpty);
    });
  }

  testWidgets('an image link to another server is loaded without the token', (
    tester,
  ) async {
    final images = await requestedImages(
      tester,
      'https://other.example/api/images/tenant/logo.png',
    );

    expect(
      images.single.url,
      'https://other.example/api/images/tenant/logo.png',
    );
    expect(images.single.headers, isNull);
  });

  testWidgets('the token goes to the server that issued it while the saved '
      'endpoint already points elsewhere', (tester) async {
    when(() => endpointService.getCachedEndpoint())
        .thenReturn('https://next.example');

    final images = await requestedImages(tester, '/api/images/tenant/logo.png');

    expect(images.single.url, '$_endpoint/api/images/tenant/logo.png');
  });

  group('links from the server', () {
    const channel = MethodChannel('plugins.flutter.io/url_launcher');
    late List<String> opened;
    late MockOverlayService overlay;

    setUp(() {
      opened = [];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            final url = (call.arguments as Map)['url'] as String;
            if (call.method == 'launch') opened.add(url);
            return true;
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, null),
      );
      overlay = MockOverlayService();
      getIt.registerSingleton<IOverlayService>(overlay);
    });

    for (final link in [
      'https://play.google.com/store/apps/details?id=org.example',
      'market://details?id=org.example',
      'itms-apps://apps.apple.com/app/id1',
    ]) {
      test('a store link opens the store: $link', () async {
        await Utils.openStoreLink(link);

        expect(opened, [link]);
      });
    }

    for (final link in [
      'https://example.com/notes',
      'mailto:support@example.com',
    ]) {
      test('a link in server text opens: $link', () async {
        await Utils.onWebViewLinkPressed(link);
        await Utils.openReleaseNotesLink(link);

        expect(opened, [link, link]);
      });
    }

    for (final link in [
      'intent://scan/#Intent;scheme=zxing;package=com.example;end',
      'file:///data/data/org.example/secret',
      'javascript:alert(1)',
    ]) {
      test(
        'a link that could start another app is not opened: $link',
        () async {
          await Utils.openStoreLink(link);
          await Utils.onWebViewLinkPressed(link);
          await Utils.openReleaseNotesLink(link);

          expect(opened, isEmpty);
          verify(() => overlay.showErrorNotification(any())).called(3);
        },
      );
    }
  });
}
