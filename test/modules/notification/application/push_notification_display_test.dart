// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/modules/notification/application/push_notification_display.dart';

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

const pngSignature = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

const messageId = '0:1760000000000000%6ed3e9f36ed3e9f3';
const notification = RemoteNotification(title: 'Alarm', body: 'High temp');

RemoteMessage message({
  String? id = messageId,
  RemoteNotification? notification = notification,
  Map<String, dynamic> data = const {},
}) => RemoteMessage(messageId: id, notification: notification, data: data);

Map<String, dynamic> iconData({
  String enabled = 'true',
  String? icon = 'warning',
  String? color = '#F44336',
}) => {
  'icon.enabled': enabled,
  'icon.icon': ?icon,
  'icon.color': ?color,
  'alarmId': 'a1',
};

String kotlinConst(String source, String name) {
  final match = RegExp('const val $name = (.+)').firstMatch(source);
  expect(match, isNotNull, reason: '$name not found in the Kotlin service');
  return match!.group(1)!.trim();
}

MockFlutterLocalNotificationsPlugin stubbedPlugin() {
  final plugin = MockFlutterLocalNotificationsPlugin();
  when(
    () => plugin.show(
      id: any(named: 'id'),
      title: any(named: 'title'),
      body: any(named: 'body'),
      notificationDetails: any(named: 'notificationDetails'),
      payload: any(named: 'payload'),
    ),
  ).thenAnswer((_) async {});
  return plugin;
}

Future<AndroidNotificationDetails> shownAndroidDetails(
  RemoteMessage message,
) async {
  final plugin = stubbedPlugin();
  await PushNotificationDisplay.show(message, plugin: plugin);
  final details =
      verify(
            () => plugin.show(
              id: any(named: 'id'),
              title: any(named: 'title'),
              body: any(named: 'body'),
              notificationDetails: captureAny(named: 'notificationDetails'),
              payload: any(named: 'payload'),
            ),
          ).captured.single
          as NotificationDetails;
  return details.android!;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(const NotificationDetails());
  });

  group('notificationIdFor', () {
    // Expected values are Java's String.hashCode, which the native side uses
    // (TbFirebaseMessagingService.notificationId), so the Dart re-post
    // replaces the plain notification instead of adding a second one.
    test('matches Java String.hashCode for a typical FCM message id', () {
      const message = RemoteMessage(
        messageId: '0:1760000000000000%6ed3e9f36ed3e9f3',
      );

      expect(notificationIdFor(message), 1487038457);
    });

    test('wraps to a signed 32-bit int like Java', () {
      const message = RemoteMessage(
        messageId: '0:1760000000000002%6ed3e9f36ed3e9f3',
      );

      expect(notificationIdFor(message), -507106249);
    });

    test('is stable for the same id', () {
      const message = RemoteMessage(messageId: 'abc');

      expect(notificationIdFor(message), 96354);
      expect(notificationIdFor(message), notificationIdFor(message));
    });

    test('falls back to the notification hash without a message id', () {
      const notification = RemoteNotification(title: 't', body: 'b');
      const message = RemoteMessage(notification: notification);

      expect(notificationIdFor(message), notification.hashCode);
    });
  });

  group('PushNotificationDisplay.show', () {
    late MockFlutterLocalNotificationsPlugin plugin;

    setUp(() {
      plugin = stubbedPlugin();
    });

    test('does nothing for a data-only message', () async {
      await PushNotificationDisplay.show(
        message(notification: null, data: iconData()),
        plugin: plugin,
      );

      verifyNever(
        () => plugin.show(
          id: any(named: 'id'),
          title: any(named: 'title'),
          body: any(named: 'body'),
          notificationDetails: any(named: 'notificationDetails'),
          payload: any(named: 'payload'),
        ),
      );
    });

    test('posts under the id and tag of the native plain notification, '
        'with the data as payload', () async {
      final data = iconData(enabled: 'false');

      await PushNotificationDisplay.show(message(data: data), plugin: plugin);

      verify(
        () => plugin.show(
          id: 1487038457,
          title: 'Alarm',
          body: 'High temp',
          notificationDetails: any(named: 'notificationDetails'),
          payload: json.encode(data),
        ),
      ).called(1);
    });

    test('replaces the plain notification without alerting again', () async {
      final android = await shownAndroidDetails(message());

      expect(android.tag, messageId);
      expect(android.onlyAlertOnce, isTrue);
      expect(android.color, AppColors.appPrimaryColor);
    });

    test('has no tag when the message has no id', () async {
      final android = await shownAndroidDetails(message(id: null));

      expect(android.tag, isNull);
    });

    test('has no large icon when the template icon is disabled', () async {
      final android = await shownAndroidDetails(
        message(data: iconData(enabled: 'false')),
      );

      expect(android.largeIcon, isNull);
    });

    test('has no large icon without icon data', () async {
      final android = await shownAndroidDetails(message());

      expect(android.largeIcon, isNull);
    });

    test('has no large icon for an unknown icon name', () async {
      final android = await shownAndroidDetails(
        message(data: iconData(icon: 'no_such_icon')),
      );

      expect(android.largeIcon, isNull);
    });

    test('has no large icon when the icon name is missing', () async {
      final android = await shownAndroidDetails(
        message(data: iconData(icon: null)),
      );

      expect(android.largeIcon, isNull);
    });

    test('renders a Material icon as the large icon', () async {
      final android = await shownAndroidDetails(message(data: iconData()));

      final largeIcon = android.largeIcon! as ByteArrayAndroidBitmap;
      expect(
        largeIcon.data.sublist(0, pngSignature.length),
        equals(pngSignature),
      );
    });

    test('renders an MDI icon as the large icon', () async {
      final android = await shownAndroidDetails(
        message(data: iconData(icon: 'mdi:ab-testing')),
      );

      expect(android.largeIcon, isA<ByteArrayAndroidBitmap>());
    });

    test('renders the icon even without a colour', () async {
      final android = await shownAndroidDetails(
        message(data: iconData(color: null)),
      );

      expect(android.largeIcon, isA<ByteArrayAndroidBitmap>());
    });
  });

  // The native plain notification uses a copy of these settings; a mismatch
  // shows up as a changed accent or a second channel.
  group('matches TbFirebaseMessagingService', () {
    late String kotlin;
    late AndroidNotificationDetails android;

    setUpAll(() async {
      kotlin = File(
        'android/app/src/main/kotlin/org/thingsboard/app/'
        'TbFirebaseMessagingService.kt',
      ).readAsStringSync();
      android = await shownAndroidDetails(message());
    });

    test('channel id, name and description', () {
      expect(kotlinConst(kotlin, 'CHANNEL_ID'), '"${android.channelId}"');
      expect(kotlinConst(kotlin, 'CHANNEL_NAME'), '"${android.channelName}"');
      expect(
        kotlinConst(kotlin, 'CHANNEL_DESCRIPTION'),
        '"${android.channelDescription}"',
      );
    });

    test('importance', () {
      expect(android.importance, Importance.max);
      expect(kotlin, contains('NotificationManager.IMPORTANCE_MAX'));
    });

    test('colour', () {
      final hex = android.color!
          .toARGB32()
          .toRadixString(16)
          .toUpperCase()
          .padLeft(8, '0');

      expect(kotlinConst(kotlin, 'BRAND_COLOR'), '0x$hex.toInt()');
    });
  });

  group('PushNotificationDisplay.waitForPlainNotification', () {
    late MockFlutterLocalNotificationsPlugin plugin;

    setUp(() {
      plugin = MockFlutterLocalNotificationsPlugin();
    });

    test('returns once the plain notification is active', () async {
      var calls = 0;
      when(() => plugin.getActiveNotifications()).thenAnswer((_) async {
        calls++;
        return calls < 3
            ? []
            : [
                ActiveNotification(
                  id: notificationIdFor(message()),
                  tag: messageId,
                ),
              ];
      });

      await PushNotificationDisplay.waitForPlainNotification(
        message(),
        plugin: plugin,
        interval: Duration.zero,
      );

      expect(calls, 3);
    });

    test('ignores other notifications with the same id or tag', () async {
      when(() => plugin.getActiveNotifications()).thenAnswer(
        (_) async => [
          ActiveNotification(id: notificationIdFor(message()), tag: 'other'),
          const ActiveNotification(id: 1, tag: messageId),
        ],
      );
      final stopwatch = Stopwatch()..start();

      await PushNotificationDisplay.waitForPlainNotification(
        message(),
        plugin: plugin,
        timeout: const Duration(milliseconds: 100),
        interval: const Duration(milliseconds: 10),
      );

      expect(
        stopwatch.elapsed,
        greaterThanOrEqualTo(const Duration(milliseconds: 100)),
      );
    });

    test('gives up after the timeout', () async {
      when(() => plugin.getActiveNotifications()).thenAnswer((_) async => []);

      await PushNotificationDisplay.waitForPlainNotification(
        message(),
        plugin: plugin,
        timeout: const Duration(milliseconds: 50),
        interval: const Duration(milliseconds: 10),
      );

      verify(() => plugin.getActiveNotifications()).called(greaterThan(1));
    });

    test('does not wait for a message without an id', () async {
      await PushNotificationDisplay.waitForPlainNotification(
        message(id: null),
        plugin: plugin,
      );

      verifyNever(() => plugin.getActiveNotifications());
    });
  });
}
