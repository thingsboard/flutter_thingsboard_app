abstract interface class INotificationsLocalService {
  Future<void> increaseNotificationBadgeCount();

  Future<void> decreaseNotificationBadgeCount();

  Future<void> triggerNotificationCountStream();

  Future<void> clearNotificationBadgeCount();

  Future<void> updateNotificationsCount(int count);
}
