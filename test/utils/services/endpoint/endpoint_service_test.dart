// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/utils/services/endpoint/endpoint_service.dart';

import '../../../helpers/test_dependencies.dart';

void main() {
  group('EndpointService', () {
    late MockLocalDatabaseService database;
    late EndpointService service;

    setUpAll(() {
      registerFallbackValue(Region.custom);
    });

    setUp(() {
      database = MockLocalDatabaseService();
      service = EndpointService(databaseService: database);
      when(() => database.saveSelectedRegion(any())).thenAnswer((_) async {});
      when(() => database.setSelectedEndpoint(any())).thenAnswer((_) async {});
    });

    // Installs from before the fix already persisted the slash.
    test(
      'a stored endpoint with a trailing slash is returned normalized',
      () async {
        when(
          () => database.getSelectedEndpoint(),
        ).thenAnswer((_) async => 'https://h/');

        expect(await service.getEndpoint(), 'https://h');
        expect(service.getCachedEndpoint(), 'https://h');
      },
    );

    test(
      'reads the stored endpoint once and serves it from the cache',
      () async {
        when(
          () => database.getSelectedEndpoint(),
        ).thenAnswer((_) async => 'https://h/');

        await service.getEndpoint();
        await service.getEndpoint();

        verify(() => database.getSelectedEndpoint()).called(1);
      },
    );

    test('falls back to the default endpoint when none is stored', () async {
      when(() => database.getSelectedEndpoint()).thenAnswer((_) async => null);

      expect(
        await service.getEndpoint(),
        ThingsboardAppConstants.thingsBoardApiEndpoint,
      );
      expect(
        service.getCachedEndpoint(),
        ThingsboardAppConstants.thingsBoardApiEndpoint,
      );
    });

    test('setEndpoint caches and persists the normalized endpoint', () async {
      await service.setEndpoint(' https://h/tb// ');

      expect(service.getCachedEndpoint(), 'https://h/tb');
      verify(() => database.setSelectedEndpoint('https://h/tb')).called(1);
    });

    for (final (host, region) in [
      (EndpointService.northAmericaHost, Region.northAmerica),
      (EndpointService.europeHost, Region.europe),
      ('https://h', Region.custom),
    ]) {
      test('setEndpoint saves $region for $host given with a trailing '
          'slash', () async {
        await service.setEndpoint('$host/');

        verify(() => database.saveSelectedRegion(region)).called(1);
      });
    }
  });
}
