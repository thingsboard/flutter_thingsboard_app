// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/modules/notification/application/notification_icon_renderer.dart';
import 'package:thingsboard_app/modules/notification/presentation/widgets/notification_icon.dart';

/// Upgrades a background push with the icon configured in the notification
/// template. TbFirebaseMessagingService posts a plain notification for it
/// (and strips the payload so the FCM SDK does not post another); showing
/// again with the same tag and id replaces that one in place. If this isolate
/// never runs, the plain notification stays.
///
/// Must be a top-level function annotated with `vm:entry-point`: it runs in
/// a dedicated background isolate without the app's DI, and the plugin
/// resolves it by its callback handle.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await PushNotificationDisplay.initialize();
  if (message.notification == null) {
    return;
  }
  await PushNotificationDisplay.waitForPlainNotification(message);
  await PushNotificationDisplay.show(message);
  debugPrint('TbPush: re-posted ${message.messageId} with the template icon');
}

/// The id TbFirebaseMessagingService posts the plain notification under, so
/// the Dart re-post replaces it: Java's String.hashCode of the message id.
/// Falls back to the notification's hash when the message has no id.
int notificationIdFor(RemoteMessage message) {
  final messageId = message.messageId;
  if (messageId == null) {
    return message.notification.hashCode;
  }
  var hash = 0;
  for (final unit in messageId.codeUnits) {
    hash = (31 * hash + unit) & 0xFFFFFFFF;
  }
  return hash >= 0x80000000 ? hash - 0x100000000 : hash;
}

/// Renders push messages via flutter_local_notifications. Kept free of GetIt
/// and Hive dependencies so it can run both in the main isolate and in the
/// Firebase messaging background isolate.
abstract final class PushNotificationDisplay {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize({
    FlutterLocalNotificationsPlugin? plugin,
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
  }) async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@drawable/ic_launcher_foreground',
      ),
      iOS: DarwinInitializationSettings(),
    );

    await (plugin ?? PushNotificationDisplay.plugin).initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static Future<void> show(
    RemoteMessage message, {
    FlutterLocalNotificationsPlugin? plugin,
  }) async {
    final notification = message.notification;
    if (notification == null) {
      return;
    }

    await (plugin ?? PushNotificationDisplay.plugin).show(
      id: notificationIdFor(message),
      title: notification.title,
      body: notification.body,
      notificationDetails: await _detailsFor(message),
      payload: json.encode(message.data),
    );
  }

  /// Waits until TbFirebaseMessagingService's plain notification for [message]
  /// is active, so it cannot land after the icon version and replace it: both
  /// sides get the same broadcast independently. Gives up after [timeout].
  static Future<void> waitForPlainNotification(
    RemoteMessage message, {
    FlutterLocalNotificationsPlugin? plugin,
    Duration timeout = const Duration(seconds: 1),
    Duration interval = const Duration(milliseconds: 50),
  }) async {
    final tag = message.messageId;
    if (tag == null) {
      return;
    }
    final id = notificationIdFor(message);
    final stopwatch = Stopwatch()..start();
    while (stopwatch.elapsed < timeout) {
      final active = await (plugin ?? PushNotificationDisplay.plugin)
          .getActiveNotifications();
      if (active.any((n) => n.tag == tag && n.id == id)) {
        return;
      }
      await Future<void>.delayed(interval);
    }
    debugPrint('TbPush: no plain notification for $tag, posting anyway');
  }

  static Future<NotificationDetails> _detailsFor(RemoteMessage message) async {
    final tag = message.messageId;
    final defaultDetails = NotificationDetails(
      android: _androidDetails(tag: tag),
      iOS: const DarwinNotificationDetails(),
    );

    if (message.data['icon.enabled']?.toString() != 'true') {
      return defaultDetails;
    }

    final icon = toNotificationIconData(message.data['icon.icon']?.toString());
    if (icon == null) {
      return defaultDetails;
    }

    try {
      final color = toNotificationIconColor(
        message.data['icon.color']?.toString(),
      );
      final iconBytes = await NotificationIconRenderer.renderPng(icon, color);
      if (iconBytes == null) {
        return defaultDetails;
      }

      return NotificationDetails(
        android: _androidDetails(
          tag: tag,
          largeIcon: ByteArrayAndroidBitmap(iconBytes),
        ),
        iOS: Platform.isIOS
            ? DarwinNotificationDetails(
                attachments: [
                  DarwinNotificationAttachment(await _saveIconFile(iconBytes)),
                ],
              )
            : null,
      );
    } catch (e) {
      debugPrint('PushNotificationDisplay::_detailsFor $e');
      return defaultDetails;
    }
  }

  // Channel id, name, importance and colour are duplicated in
  // TbFirebaseMessagingService; keep them in step
  // (push_notification_display_test.dart compares them).
  static AndroidNotificationDetails _androidDetails({
    String? tag,
    AndroidBitmap<Object>? largeIcon,
  }) {
    return AndroidNotificationDetails(
      color: AppColors.appPrimaryColor,
      'general',
      // translate-me-ignore-next-line
      'General notifications',
      importance: Importance.max,
      priority: Priority.high,
      // translate-me-ignore-next-line
      channelDescription: 'This channel is used for general notifications',
      showWhen: false,
      tag: tag,
      // The plain notification already alerted; the upgrade must not again.
      onlyAlertOnce: true,
      largeIcon: largeIcon,
    );
  }

  static Future<String> _saveIconFile(Uint8List bytes) async {
    final directory = await getTemporaryDirectory();
    final file = File(
      '${directory.path}/notification_icon_'
      '${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }
}
