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
import 'package:thingsboard_app/modules/version/presentation/view/widgets/version_empty_widget.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class MockOverlayService extends Mock implements IOverlayService {}

void main() {
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  late List<String> opened;

  setUp(() {
    opened = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'launch') {
            opened.add((call.arguments as Map)['url'] as String);
          }
          return true;
        });
    getIt.registerSingleton<IOverlayService>(MockOverlayService());
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
      getIt.reset();
    });
  });

  Future<void> tapUpdate(WidgetTester tester, String storeLink) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: VersionEmptyWidget(storeLink: storeLink, latestVersion: '2.0.0'),
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  }

  testWidgets('the update button opens the store link', (tester) async {
    await tapUpdate(tester, 'market://details?id=org.example');

    expect(opened, ['market://details?id=org.example']);
  });

  testWidgets('the update button does not open a link that is not a store', (
    tester,
  ) async {
    await tapUpdate(tester, 'intent://x#Intent;package=com.example;end');

    expect(opened, isEmpty);
  });
}
