// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmQueryController extends PageKeyController<AlarmQueryV2> {
  AlarmQueryController({int pageSize = 20, String? searchText})
    : super(
        AlarmQueryV2(
          TimePageLink(
            pageSize,
            0,
            searchText,
            SortOrder('createdTime', Direction.DESC),
          ),
          statusList: [AlarmSearchStatus.ACTIVE],
        ),
      );

  @override
  AlarmQueryV2 nextPageKey(AlarmQueryV2 pageKey) {
    return AlarmQueryV2(
      pageKey.pageLink.nextPageLink(),
      typeList: pageKey.typeList,
      statusList: pageKey.statusList,
      severityList: pageKey.severityList,
      assigneeId: pageKey.assigneeId,
    );
  }

  void onSearchText(String? searchText) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.pageLink.textSearch = searchText;

    notifyListeners();
  }

  void onFiltersUpdated(AlarmFiltersEntity filters) {
    final query = value.pageKey;
    query.pageLink.page = 0;
    query.assigneeId = filters.assigneeId;
    query.severityList = filters.severityList;
    query.statusList = filters.statusList;
    query.typeList = filters.typeList;

    notifyListeners();
  }
}
