// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_types/alarm_types_query_ctrl.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class AlarmTypesPaginationRepository
    extends PaginationRepository<PageLink, EntitySubtype> {
  AlarmTypesPaginationRepository({
    required AlarmTypesQueryCtrl alarmTypesQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: alarmTypesQueryCtrl);

  final Future<PageData<EntitySubtype>> Function(PageLink) onFetchPageData;

  @override
  Future<PageData<EntitySubtype>> fetchPageData(PageLink pageKey) {
    return onFetchPageData(pageKey);
  }
}
