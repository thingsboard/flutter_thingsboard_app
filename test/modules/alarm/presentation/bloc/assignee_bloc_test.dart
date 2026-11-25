// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class _FiltersService extends Fake implements IAlarmFiltersService {
  @override
  void setSelectedFilter<T>(Filters type, {required T data}) {}
}

AssigneeEntity _assignee(String id, String firstName, String lastName) =>
    AssigneeEntity.fromUserInfo(
      UserInfo(
        (b) => b
          ..id = (UserIdBuilder()..id = id)
          ..authority = Authority.TENANT_ADMIN
          ..email = '$id@example.com'
          ..firstName = firstName
          ..lastName = lastName,
      ),
      detailsUseCase: const UserDetailsUseCase(),
    );

void main() {
  late List<AssigneeEntity> serverUsers;
  late AssigneePaginationRepository repository;
  late AssigneeBloc bloc;

  setUp(() async {
    serverUsers = [_assignee('user-1', 'John', 'Smith')];
    final queryCtrl = AssigneeQueryCtrl();
    repository = AssigneePaginationRepository(
      assigneeQueryCtrl: queryCtrl,
      onFetchPageData: (_) async =>
          PageData<AssigneeEntity>(serverUsers, 1, serverUsers.length, false),
    );
    bloc = AssigneeBloc(
      paginationRepository: repository,
      queryCtrl: queryCtrl,
      filtersService: _FiltersService(),
    );
    addTearDown(() async {
      await bloc.close();
      repository.dispose();
    });

    await repository.refresh();
    bloc.add(const AssigneeSelectedEvent(userId: 'user-1'));
    await pumpEventQueue();
  });

  test('a refresh shows the selected assignee under the new name', () async {
    expect(
      (bloc.state as AssigneeSelectedState).assignee.displayName,
      'John Smith',
    );

    serverUsers = [_assignee('user-1', 'Johnny', 'Smithers')];
    bloc.add(const AssigneeRefreshEvent());
    await pumpEventQueue();

    final state = bloc.state as AssigneeSelectedState;
    expect(state.assignee.displayName, 'Johnny Smithers');
    expect(state.assignee.shortName, 'JS');
  });

  test(
    'a refresh that no longer lists the assignee keeps the selection',
    () async {
      serverUsers = [_assignee('user-2', 'Jane', 'Doe')];
      bloc.add(const AssigneeRefreshEvent());
      await pumpEventQueue();

      expect(
        (bloc.state as AssigneeSelectedState).assignee.displayName,
        'John Smith',
      );
    },
  );
}
