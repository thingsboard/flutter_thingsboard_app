// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssigneeQueryCtrl extends PageKeyController<PageLink> {
  AssigneeQueryCtrl({
    int pageSize = 50,
    String? searchText,
    SortOrder? sortOrder,
  }) : super(
         PageLink(
           pageSize,
           0,
           searchText,
           sortOrder ?? SortOrder('email', Direction.ASC),
         ),
       );

  @override
  PageLink nextPageKey(PageLink pageKey) {
    return pageKey.nextPageLink();
  }

  void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.page = 0;
    query.textSearch = searchText;

    notifyListeners();
  }
}
