import 'dart:async';

import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/service/i_notifications_local_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

final class NotificationsLocalService implements INotificationsLocalService {
  NotificationsLocalService() : storage = getIt();

  static const notificationCounterKey = 'notifications_counter';
  static final notificationsNumberStream = StreamController<int>.broadcast();

  late final TbStorage storage;

  @override
  Future<void> increaseNotificationBadgeCount() async {
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = int.parse(counter ?? '0') + 1;
    await storage.setItem(notificationCounterKey, updatedCounter.toString());

    FlutterAppBadger.updateBadgeCount(updatedCounter);
    notificationsNumberStream.add(updatedCounter);
  }

  @override
  Future<void> decreaseNotificationBadgeCount() async {
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = int.parse(counter ?? '0') - 1;
    if (updatedCounter <= 0) {
      FlutterAppBadger.removeBadge();
      notificationsNumberStream.add(0);
    } else {
      FlutterAppBadger.updateBadgeCount(updatedCounter);
      await storage.setItem(notificationCounterKey, updatedCounter.toString());
      notificationsNumberStream.add(updatedCounter);
    }
  }

  @override
  Future<void> triggerNotificationCountStream() async {
    final counter = await storage.getItem(notificationCounterKey);
    notificationsNumberStream.add(int.parse(counter ?? '0'));
  }

  @override
  Future<void> clearNotificationBadgeCount() async {
    FlutterAppBadger.removeBadge();
    storage.deleteItem(notificationCounterKey);
    notificationsNumberStream.add(0);
  }

  @override
  Future<void> updateNotificationsCount(int count) async {
    FlutterAppBadger.updateBadgeCount(count);
    storage.setItem(notificationCounterKey, count.toString());
    notificationsNumberStream.add(count);
  }
}
