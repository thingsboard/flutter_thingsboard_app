// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DashboardsQueryCtrl extends SearchablePageKeyController<PageLink> {
  DashboardsQueryCtrl() : super(PageLink(20));

  @override
  PageLink nextPageKey(PageLink pageKey) {
    return pageKey.nextPageLink();
  }

  @override
  void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.page = 0;
    query.textSearch = searchText;
    notifyListeners();
  }
}
