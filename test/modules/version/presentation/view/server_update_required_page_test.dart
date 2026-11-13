// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/version/presentation/view/server_update_required_page.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
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

  late MockTbClientService clientService;

  setUp(() {
    clientService = MockTbClientService();
    when(() => clientService.unsupportedServer).thenReturn(
      ValueNotifier(UnsupportedServerVersionError('4.2.2.8PE', '4.4.0')),
    );
    final endpoints = MockEndpointService();
    when(endpoints.getCachedEndpoint).thenReturn('https://current.example');
    getIt
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IEndpointService>(endpoints);
    addTearDown(getIt.reset);
  });

  Future<void> pumpPage(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [S.delegate],
        home: ServerUpdateRequiredPage(),
      ),
    );
    await tester.pump();
  }

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
}
