// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockOverlayService extends Mock implements IOverlayService {}

void main() {
  late TbClientService service;

  setUp(() {
    getIt.registerSingleton<IOverlayService>(MockOverlayService());
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

  test('other errors are left to the caller', () {
    expect(
      service.reportUnsupportedServer(ThingsboardError(message: 'Bad')),
      isFalse,
    );
    expect(service.unsupportedServer.value, isNull);
  });
}
