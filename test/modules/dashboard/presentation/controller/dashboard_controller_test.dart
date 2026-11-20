// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';

import '../../../../helpers/test_dependencies.dart';

class MockWebViewController extends Mock implements InAppWebViewController {}

void main() {
  late MockWebViewController webView;
  late DashboardController controller;
  final sent = <Map<String, dynamic>>[];

  setUpAll(() {
    registerFallbackValue(WebMessage(data: ''));
    registerFallbackValue(WebUri('*'));
  });

  setUp(() {
    getIt.registerSingleton<TbLogger>(MockTbLogger());
    addTearDown(getIt.reset);
    sent.clear();
    webView = MockWebViewController();
    when(
      () => webView.postWebMessage(
        message: any(named: 'message'),
        targetOrigin: any(named: 'targetOrigin'),
      ),
    ).thenAnswer((invocation) async {
      final message = invocation.namedArguments[#message] as WebMessage;
      sent.add(jsonDecode(message.data as String) as Map<String, dynamic>);
    });
    controller = DashboardController()..setWebViewController(webView);
  });

  test('sends the dashboard to open to the web app', () async {
    await controller.openDashboard('d1', state: 's1', hideToolbar: true);

    expect(sent, [
      {
        'type': 'openDashboardMessage',
        'data': {'dashboardId': 'd1', 'state': 's1', 'hideToolbar': true},
      },
    ]);
  });

  test('reopens the last dashboard in the state it was in', () async {
    await controller.openDashboard('d1', state: 's1', home: true);
    sent.clear();

    await controller.reopenDashboard(state: 's2');

    expect(sent, [
      {
        'type': 'openDashboardMessage',
        'data': {'dashboardId': 'd1', 'state': 's2', 'embedded': true},
      },
    ]);
  });

  test('reopens the last dashboard as it was opened without a state', () async {
    await controller.openDashboard('d1', state: 's1');
    sent.clear();

    await controller.reopenDashboard();

    expect(sent.single['data'], {'dashboardId': 'd1', 'state': 's1'});
  });

  test('has nothing to reopen before a dashboard was opened', () async {
    expect(controller.hasOpenedDashboard, isFalse);

    await controller.reopenDashboard(state: 's2');

    expect(sent, isEmpty);
  });
}
