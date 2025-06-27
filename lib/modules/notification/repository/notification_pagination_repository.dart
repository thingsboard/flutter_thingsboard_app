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
      final pageData = await tbClient.getNotificationService().getNotifications(
            pageKey,
          );

      final isLastPage = !pageData.hasNext;
      if (refresh) {
        final state = pagingController.value;
        if (state.itemList != null) {
          state.itemList!.clear();
        }
      }
      if (isLastPage) {
        pagingController.appendLastPage(pageData.data);
      } else {
        final nextPageKey = notificationQueryPageCtrl.nextPageKey(pageKey);
        pagingController.appendPage(pageData.data, nextPageKey);
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
