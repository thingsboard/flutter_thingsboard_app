// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/notification/application/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/application/notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/data/i_notification_query_repository.dart';
import 'package:thingsboard_app/modules/notification/presentation/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationRepository implements INotificationQueryRepository {
  NotificationRepository({
    required this.notificationQueryCtrl,
    required this.thingsboardClient,
  }) : localService = NotificationsLocalService();

  final NotificationQueryCtrl notificationQueryCtrl;
  final ThingsboardClient thingsboardClient;
  final INotificationsLocalService localService;

  @override
  Future<void> deleteNotification(String id) {
    return thingsboardClient
        .getNotificationControllerApi()
        .deleteNotification(id: id);
  }

  @override
  Future<void> markAllAsRead() async {
    await thingsboardClient
        .getNotificationControllerApi()
        .markAllNotificationsAsRead(deliveryMethod: 'MOBILE_APP');
    localService.clearNotificationBadgeCount();
  }

  @override
  Future<void> markNotificationAsRead(String id) {
    return thingsboardClient
        .getNotificationControllerApi()
        .markNotificationAsRead(id: id);
  }

  @override
  Future<void> searchNotification(String searchText) async {
    notificationQueryCtrl.onSearchText(searchText);
  }

  @override
  Future<void> filterByReadStatus(bool unreadOnly) async {
    notificationQueryCtrl.filterByReadStatus(unreadOnly);
  }

  Future<void> decreaseNotificationBadgeCount() async {
    localService.decreaseNotificationBadgeCount();
  }

  Future<void> increaseNotificationBadgeCount() async {
    localService.increaseNotificationBadgeCount();
  }
}
