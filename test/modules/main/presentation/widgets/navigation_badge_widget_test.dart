// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/navigation_badge_widget.dart';
import 'package:thingsboard_app/modules/notification/application/notifications_local_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockTbStorage extends Mock implements TbStorage {}

void main() {
  late NotificationsLocalService service;

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('flutter_new_badger'),
          (_) async => null,
        );
    final storage = MockTbStorage();
    when(() => storage.setItem(any(), any())).thenAnswer((_) async {});
    when(() => storage.deleteItem(any())).thenAnswer((_) async {});
    getIt.registerSingleton<TbStorage>(storage);
    addTearDown(getIt.reset);
    service = NotificationsLocalService();
  });

  Future<void> pumpBadge(WidgetTester tester) => tester.pumpWidget(
    const MaterialApp(home: NavigationBadgeWidget(isLarge: true)),
  );

  testWidgets('a badge built after the count was sent shows it', (
    tester,
  ) async {
    await service.updateNotificationsCount(3);

    await pumpBadge(tester);

    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('follows later counts and hides at zero', (tester) async {
    await service.updateNotificationsCount(0);
    await pumpBadge(tester);
    expect(find.byType(Text), findsNothing);

    await service.updateNotificationsCount(120);
    await tester.pump();
    expect(find.text('99+'), findsOneWidget);

    await service.clearNotificationBadgeCount();
    await tester.pump();
    expect(find.byType(Text), findsNothing);
  });
}
