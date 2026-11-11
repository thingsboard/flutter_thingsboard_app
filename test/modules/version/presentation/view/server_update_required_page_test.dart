// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  testWidgets('the status bar is dark over the light page', (tester) async {
    final clientService = MockTbClientService();
    when(() => clientService.unsupportedServer).thenReturn(
      ValueNotifier(UnsupportedServerVersionError('4.2.2.8', '4.4.0')),
    );
    final endpoints = MockEndpointService();
    when(endpoints.getCachedEndpoint).thenReturn('https://old.example.com');
    getIt
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IEndpointService>(endpoints);
    addTearDown(getIt.reset);

    // The page opens over the login page, which asks for a light status bar
    // on its dark background.
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [S.delegate],
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: ServerUpdateRequiredPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('4.2.2.8'), findsOneWidget);
    expect(SystemChrome.latestStyle?.statusBarIconBrightness, Brightness.dark);
  });
}
