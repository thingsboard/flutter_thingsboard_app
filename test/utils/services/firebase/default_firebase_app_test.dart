// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/default_firebase_app.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';

import '../../../helpers/test_dependencies.dart';

class MockEndpointService extends Mock implements IEndpointService {}

void main() {
  late MockFirebaseService firebase;
  late MockEndpointService endpoints;
  late List<String> apps;
  late int inits;

  setUp(() {
    firebase = MockFirebaseService();
    endpoints = MockEndpointService();
    apps = [];
    inits = 0;
    when(() => firebase.apps).thenAnswer((_) => apps);
    when(endpoints.isCustomEndpoint).thenAnswer((_) async => false);
    getIt
      ..registerSingleton<IFirebaseService>(firebase)
      ..registerSingleton<IEndpointService>(endpoints);
    addTearDown(getIt.reset);
  });

  Future<void> restore() => restoreDefaultFirebaseApp(
    init: () async {
      inits++;
      apps.add('[DEFAULT]');
    },
  );

  group('restoreDefaultFirebaseApp', () {
    test('re-creates the app on a built-in server that has none', () async {
      await restore();

      expect(inits, 1);
      expect(apps, ['[DEFAULT]']);
    });

    test('leaves a custom server without one', () async {
      when(endpoints.isCustomEndpoint).thenAnswer((_) async => true);

      await restore();

      expect(inits, 0);
      expect(apps, isEmpty);
    });

    test('keeps an app that is already there', () async {
      apps.add('[DEFAULT]');

      await restore();

      expect(inits, 0);
      verifyNever(endpoints.isCustomEndpoint);
      verifyNever(firebase.clearApps);
      verifyNever(() => firebase.removeApp(name: any(named: 'name')));
    });
  });
}
