// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/data/datasource/assignee/i_assignee_datasource.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssigneeDatasource implements IAssigneeDatasource {
  const AssigneeDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<UserInfo>> fetchAssignee(PageLink pageKey) async {
    // findUsersByQuery returns the users of the current user's tenant or
    // customer; getAllUserInfos is restricted for non-sysadmin roles and
    // returns only the current user.
    final response = await tbClient.getUserControllerApi().findUsersByQuery(
      pageSize: pageKey.pageSize,
      page: pageKey.page,
      textSearch: pageKey.textSearch,
      sortProperty: pageKey.sortOrder?.property,
      sortOrder: pageKey.sortOrder?.direction.name,
    );
    final page = response.data!;
    final users =
        page.data?.map((e) => e.toUserInfo()).toList() ?? <UserInfo>[];
    return toPageData(users, page.totalPages, page.totalElements, page.hasNext);
  }
}
