// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/modules/notification/controllers/notification_query.dart';
import 'package:thingsboard_app/modules/notification/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationPaginationRepository {
  NotificationPaginationRepository({
    required this.notificationQueryPageCtrl,
    required this.tbClient,
  });

  final NotificationQueryCtrl notificationQueryPageCtrl;
  final ThingsboardClient tbClient;
  late final PagingController<NotificationQuery, Notification>
  pagingController;

  void init() {
    pagingController =
        PagingController<NotificationQuery, Notification>(
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
    NotificationQuery pageKey, {
    bool refresh = false,
  }) async {
    try {
      final pageLink = pageKey.pageLink;
      final response = await tbClient
          .getNotificationControllerApi()
          .getNotifications(
            pageSize: pageLink.pageSize,
            page: pageLink.page,
            textSearch: pageLink.textSearch,
            sortProperty: pageLink.sortOrder?.property,
            sortOrder: pageLink.sortOrder?.direction.name,
            unreadOnly: pageKey.unreadOnly,
            deliveryMethod: NotificationDeliveryMethod.MOBILE_APP.name,
          );
      final page = response.data!;
      final items = page.data?.toList() ?? <Notification>[];

      final isLastPage = page.hasNext != true;
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
