// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/application/notifications_local_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockTbStorage extends Mock implements TbStorage {}

class MockTbLogger extends Mock implements TbLogger {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockTbStorage storage;
  late NotificationsLocalService service;
  const badger = MethodChannel('flutter_new_badger');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(badger, (_) async => null);
    storage = MockTbStorage();
    when(() => storage.setItem(any(), any())).thenAnswer((_) async {});
    when(() => storage.deleteItem(any())).thenAnswer((_) async {});
    getIt.registerSingleton<TbStorage>(storage);
    addTearDown(getIt.reset);
    service = NotificationsLocalService();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(badger, null);
  });

  test('the last count follows increase and clear', () async {
    when(() => storage.getItem(any())).thenAnswer((_) async => '3');
    await service.increaseNotificationBadgeCount();
    expect(NotificationsLocalService.notificationsCount, 4);

    await service.updateNotificationsCount(5);
    await service.clearNotificationBadgeCount();
    expect(NotificationsLocalService.notificationsCount, 0);
  });

  test('a refused badge is logged, not thrown', () async {
    // iOS refuses the badge without the notification permission.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          badger,
          (_) async => throw PlatformException(
            code: 'PERMISSION_DENIED',
            message: 'Badge permission denied.',
          ),
        );
    final log = MockTbLogger();
    getIt.registerSingleton<TbLogger>(log);
    when(() => storage.getItem(any())).thenAnswer((_) async => '1');

    await service.increaseNotificationBadgeCount();
    await service.updateNotificationsCount(3);
    await service.clearNotificationBadgeCount();
    // Let the badge calls, which are not awaited, finish.
    await pumpEventQueue();

    expect(NotificationsLocalService.notificationsCount, 0);
    verify(() => log.debug(any(that: contains('PERMISSION_DENIED')))).called(3);
  });
}
