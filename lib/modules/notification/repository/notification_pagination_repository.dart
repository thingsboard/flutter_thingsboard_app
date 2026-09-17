import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/modules/notification/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class NotificationPaginationRepository {
  NotificationPaginationRepository({
    required this.notificationQueryPageCtrl,
    required this.tbClient,
  });

  final NotificationQueryCtrl notificationQueryPageCtrl;
  final ThingsboardClient tbClient;
  late final PagingController<PushNotificationQuery, PushNotification>
  pagingController;

  void init() {
    pagingController =
        PagingController<PushNotificationQuery, PushNotification>(
          firstPageKey: notificationQueryPageCtrl.value.pageKey,
        );

    notificationQueryPageCtrl.addListener(_didChangePageKeyValue);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  void dispose() {
    notificationQueryPageCtrl.removeListener(_didChangePageKeyValue);
    pagingController.dispose();
  }

  Future<void> _fetchPage(
    PushNotificationQuery pageKey, {
    bool refresh = false,
  }) async {
    try {
      // Fetch raw JSON via the client's Dio rather than the typed
      // getNotifications endpoint: the generated NotificationInfo drops the
      // alarm fields (severity/status/alarmId) during deserialization, which
      // the notification UI (badge, swipe-to-ack/clear, deep-link) relies on.
      // PushNotification.fromJson parses the full server payload directly.
      final response = await tbClient.dio.get<Map<String, dynamic>>(
        '/api/notifications',
        queryParameters: pageKey.toQueryParameters(),
      );

      final page = PageData.fromJson(
        response.data!,
        (json) => PushNotification.fromJson(json as Map<String, dynamic>),
      );
      final items = page.data;

      final isLastPage = !page.hasNext;
      if (refresh) {
        final state = pagingController.value;
        if (state.itemList != null) {
          state.itemList!.clear();
        }
      }
      if (isLastPage) {
        pagingController.appendLastPage(items);
      } else {
        final nextPageKey = notificationQueryPageCtrl.nextPageKey(pageKey);
        pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void _didChangePageKeyValue() {
    _refreshPagingController();
  }

  void _refreshPagingController() {
    _fetchPage(notificationQueryPageCtrl.value.pageKey, refresh: true);
  }
}
