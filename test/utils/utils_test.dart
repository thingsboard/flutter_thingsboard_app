// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/utils.dart';

import '../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

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
}
