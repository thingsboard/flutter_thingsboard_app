// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_new_badger/flutter_new_badger.dart';
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

  @override
  Future<void> increaseNotificationBadgeCount() async {
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = (int.tryParse(counter.toString()) ?? 0) + 1;
    await storage.setItem(notificationCounterKey, updatedCounter.toString());

    FlutterNewBadger.setBadge(updatedCounter);
    _emit(updatedCounter);
  }

  @override
  Future<void> decreaseNotificationBadgeCount() async {
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = (int.tryParse(counter.toString()) ?? 0) - 1;
    if (updatedCounter <= 0) {
      FlutterNewBadger.removeBadge();
      _emit(0);
    } else {
      FlutterNewBadger.setBadge(updatedCounter);
      await storage.setItem(notificationCounterKey, updatedCounter.toString());
      _emit(updatedCounter);
    }
  }

  @override
  Future<void> triggerNotificationCountStream() async {
    final counter = await storage.getItem(notificationCounterKey);
    _emit(int.tryParse(counter.toString()) ?? 0);
  }

  @override
  Future<void> clearNotificationBadgeCount() async {
    FlutterNewBadger.removeBadge();
    storage.deleteItem(notificationCounterKey);
    _emit(0);
  }

  @override
  Future<void> updateNotificationsCount(int count) async {
    FlutterNewBadger.setBadge(count);
    storage.setItem(notificationCounterKey, count.toString());
    _emit(count);
  }
}
