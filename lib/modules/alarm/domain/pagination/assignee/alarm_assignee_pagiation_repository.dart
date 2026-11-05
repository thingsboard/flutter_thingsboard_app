// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/alarm_assignee_query_ctrl.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final class AlarmAssigneePaginationRepository
    extends PaginationRepository<UsersAssignQuery, AssigneeEntity> {
  AlarmAssigneePaginationRepository({
    required AlarmAssigneeQueryCtrl assigneeQueryCtrl,
    required this.onFetchPageData,
  }) : super(pageKeyController: assigneeQueryCtrl);

  final Future<PageData<AssigneeEntity>> Function(UsersAssignQuery)
  onFetchPageData;

  @override
  Future<PageData<AssigneeEntity>> fetchPageData(UsersAssignQuery pageKey) {
    return onFetchPageData(pageKey);
  }
}
