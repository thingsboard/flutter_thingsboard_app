// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmAssigneeQueryCtrl extends PageKeyController<UsersAssignQuery> {
  AlarmAssigneeQueryCtrl({
    required AlarmId id,
    int pageSize = 50,
    String? searchText,
    SortOrder? sortOrder,
  }) : super(
         UsersAssignQuery(
           pageLink: PageLink(
             pageSize,
             0,
             searchText,
             sortOrder ?? SortOrder('email', Direction.ASC),
           ),
           id: id,
         ),
       );

  @override
  UsersAssignQuery nextPageKey(UsersAssignQuery pageKey) {
    return UsersAssignQuery(
      pageLink: pageKey.pageLink.nextPageLink(),
      id: pageKey.id,
    );
  }

  void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;

    notifyListeners();
  }
}
