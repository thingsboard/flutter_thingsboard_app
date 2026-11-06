// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/pagination/activity/alarm_activity_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class AlarmActivityPaginationRepository
    extends PaginationRepository<AlarmCommentsQuery, AlarmCommentInfo> {
  AlarmActivityPaginationRepository({
    required AlarmActivityQueryCtrl queryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: queryCtrl);

  final Future<PageData<AlarmCommentInfo>> Function(AlarmCommentsQuery)
  onFetchPageData;

  @override
  Future<PageData<AlarmCommentInfo>> fetchPageData(AlarmCommentsQuery pageKey) {
    return onFetchPageData(pageKey);
  }
}
