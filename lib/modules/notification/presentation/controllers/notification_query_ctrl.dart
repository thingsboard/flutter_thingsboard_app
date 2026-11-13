// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/notification/presentation/controllers/notification_query.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationQueryCtrl extends PageKeyController<NotificationQuery> {
  NotificationQueryCtrl({int pageSize = 20, String? searchText})
    : super(
        NotificationQuery(
          PageLink(
            pageSize,
            0,
            searchText,
            SortOrder('createdTime', Direction.DESC),
          ),
          unreadOnly: true,
        ),
      );

  @override
  NotificationQuery nextPageKey(NotificationQuery pageKey) {
    return NotificationQuery(
      pageKey.pageLink.nextPageLink(),
      unreadOnly: value.pageKey.unreadOnly,
    );
  }

  void onSearchText(String searchText) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;

    notifyListeners();
  }

  void filterByReadStatus(bool unreadOnly) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.unreadOnly = unreadOnly;

    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
