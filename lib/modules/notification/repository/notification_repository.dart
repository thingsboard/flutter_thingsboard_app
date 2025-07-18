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
  Future<int> deleteNotification(String id)  {
    return thingsboardClient.getNotificationService().deleteNotification(id);
  }

  @override
  Future<int> markAllAsRead() async {
    final response = await thingsboardClient
        .getNotificationService()
        .markAllNotificationsAsRead('MOBILE_APP');
    localService.clearNotificationBadgeCount();

    return response;
  }

  @override
  Future<int> markNotificationAsRead(String id)  {
    return thingsboardClient
        .getNotificationService()
        .markNotificationAsRead(id);
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
