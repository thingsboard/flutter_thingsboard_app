// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:thingsboard_app/modules/notification/presentation/controllers/notification_query.dart';
import 'package:thingsboard_app/modules/notification/presentation/controllers/notification_query_ctrl.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_app/utils/services/page_data_paging_controller.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationPaginationRepository {
  NotificationPaginationRepository({
    required this.notificationQueryPageCtrl,
    required this.tbClient,
  });

  final NotificationQueryCtrl notificationQueryPageCtrl;
  final ThingsboardClient tbClient;
  late final PageDataPagingController<NotificationQuery, Notification>
  pagingController;

  void init() {
    pagingController = PageDataPagingController(
      pageKeyController: notificationQueryPageCtrl,
      fetchPageData: (pageKey, {required refresh}) => _fetchPage(pageKey),
    );
    notificationQueryPageCtrl.addListener(_didChangePageKeyValue);
  }

  void dispose() {
    notificationQueryPageCtrl.removeListener(_didChangePageKeyValue);
    pagingController.dispose();
  }

  Future<PageData<Notification>> _fetchPage(NotificationQuery pageKey) async {
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
    return toPageData(page.data, page.totalPages, page.totalElements, page.hasNext);
  }

  /// Read status, filter or search changed: reload the first page in place.
  void _didChangePageKeyValue() => pagingController.reloadFirstPage();
}
