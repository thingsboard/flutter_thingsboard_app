import 'package:thingsboard_app/modules/notification/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_app/modules/notification/repository/i_notification_query_repository.dart';
import 'package:thingsboard_app/modules/notification/service/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

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
