// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_new_badger/flutter_new_badger.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/application/i_notifications_local_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class NotificationsLocalService implements INotificationsLocalService {
  NotificationsLocalService() : storage = getIt();

  static const notificationCounterKey = 'notifications_counter';
  static final notificationsNumberStream = StreamController<int>.broadcast();

  /// The last count sent on [notificationsNumberStream], which does not
  /// replay it: a badge built later (the More page) starts from it.
  static int get notificationsCount => _notificationsCount;
  static int _notificationsCount = 0;

  static void _emit(int count) {
    _notificationsCount = count;
    notificationsNumberStream.add(count);
  }

  late final TbStorage storage;
  late final TbLogger _log = getIt();

  /// Updates the app icon badge without waiting for it. On iOS the badge
  /// needs the notification permission, and without it the plugin throws
  /// PERMISSION_DENIED; the badge is only a hint, so the error is logged
  /// instead of reaching the app as an unhandled error.
  void _updateAppIconBadge(Future<void> Function() update) {
    unawaited(
      update().catchError(
        (Object e) => _log.debug('App icon badge not updated: $e'),
        test: (e) => e is PlatformException,
      ),
    );
  }

  @override
  Future<void> increaseNotificationBadgeCount() async {
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = (int.tryParse(counter.toString()) ?? 0) + 1;
    await storage.setItem(notificationCounterKey, updatedCounter.toString());

    _updateAppIconBadge(() => FlutterNewBadger.setBadge(updatedCounter));
    _emit(updatedCounter);
  }

  @override
  Future<void> triggerNotificationCountStream() async {
    final counter = await storage.getItem(notificationCounterKey);
    _emit(int.tryParse(counter.toString()) ?? 0);
  }

  @override
  Future<void> clearNotificationBadgeCount() async {
    _updateAppIconBadge(FlutterNewBadger.removeBadge);
    storage.deleteItem(notificationCounterKey);
    _emit(0);
  }

  @override
  Future<void> updateNotificationsCount(int count) async {
    _updateAppIconBadge(() => FlutterNewBadger.setBadge(count));
    storage.setItem(notificationCounterKey, count.toString());
    _emit(count);
  }
}
