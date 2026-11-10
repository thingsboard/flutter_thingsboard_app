// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/application/notifications_local_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockTbStorage extends Mock implements TbStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockTbStorage storage;
  late NotificationsLocalService service;
  final badgeCalls = <MethodCall>[];

  setUp(() {
    badgeCalls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_new_badger'), (
          call,
        ) async {
          badgeCalls.add(call);
          return null;
        });
    storage = MockTbStorage();
    when(() => storage.setItem(any(), any())).thenAnswer((_) async {});
    when(() => storage.deleteItem(any())).thenAnswer((_) async {});
    getIt.registerSingleton<TbStorage>(storage);
    addTearDown(getIt.reset);
    service = NotificationsLocalService();
  });

  // The More page builds its badge after the count was sent; the stream does
  // not replay it, so the badge starts from notificationsCount.
  test('remembers the last count for badges built later', () async {
    final sent = <int>[];
    final sub = NotificationsLocalService.notificationsNumberStream.stream
        .listen(sent.add);
    addTearDown(sub.cancel);

    await service.updateNotificationsCount(3);
    await pumpEventQueue();

    expect(NotificationsLocalService.notificationsCount, 3);
    expect(sent, [3]);
  });

  test('the last count follows increase and clear', () async {
    when(() => storage.getItem(any())).thenAnswer((_) async => '3');
    await service.increaseNotificationBadgeCount();
    expect(NotificationsLocalService.notificationsCount, 4);

    await service.updateNotificationsCount(5);
    await service.clearNotificationBadgeCount();
    expect(NotificationsLocalService.notificationsCount, 0);
  });
}
