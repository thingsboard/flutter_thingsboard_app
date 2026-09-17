abstract interface class INotificationQueryRepository {
  Future<void> markAllAsRead();

  Future<void> markNotificationAsRead(String id);

  Future<void> deleteNotification(String id);

  Future<void> searchNotification(String searchText);

  Future<void> filterByReadStatus(bool unreadOnly);
}
