abstract interface class INotificationQueryRepository {
  Future<int> markAllAsRead();

  Future<int> markNotificationAsRead(String id);

  Future<int> deleteNotification(String id);

  Future<void> searchNotification(String searchText);

  Future<void> filterByReadStatus(bool unreadOnly);
}
