// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/more/presentation/widgets/profle_widget.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockEndpointService extends Mock implements IEndpointService {}

void main() {
  late MockEndpointService endpoints;

  setUp(() {
    endpoints = MockEndpointService();
    getIt.registerSingleton<IEndpointService>(endpoints);
    addTearDown(getIt.reset);
  });

  Future<void> pump(WidgetTester tester, double textScale, String host) async {
    when(endpoints.getCachedEndpoint).thenReturn('https://$host');
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: MediaQuery.withClampedTextScaling(
          minScaleFactor: textScale,
          maxScaleFactor: textScale,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ProfileWidget(
                userDetails: const UserDetailsOutput(
                  shortName: 'CU',
                  displayName: 'Ann Lee',
                ),
                user: User(
                  (b) => b
                    ..email = 'customer@example.com'
                    ..authority = Authority.CUSTOMER_USER,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('with the largest text the role is not broken mid-word', (
    tester,
  ) async {
    await pump(tester, 3.1, 'a-rather-long-server-name.example.com');

    final role = tester.renderObject<RenderParagraph>(find.text('Customer'));
    expect(
      role.getMinIntrinsicWidth(double.infinity),
      lessThanOrEqualTo(role.size.width),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('at the normal size the server name sits beside the user', (
    tester,
  ) async {
    await pump(tester, 1, 'tb.io');

    final server = tester.getRect(find.text('tb.io'));
    final user = tester.getRect(find.text('Ann Lee'));
    expect(server.left, greaterThan(user.right));
    expect(server.top, lessThan(tester.getRect(find.text('Customer')).bottom));
  });
}
