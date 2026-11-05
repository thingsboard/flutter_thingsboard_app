// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssigneeBloc extends Bloc<AssigneeEvent, AssigneeState> {
  AssigneeBloc({
    required this.paginationRepository,
    required this.queryCtrl,
    required this.filtersService,
  }) : super(const AssigneeEmptyState()) {
    on(_onEvent);
  }

  final PaginationRepository<PageLink, AssigneeEntity> paginationRepository;
  final AssigneeQueryCtrl queryCtrl;
  final IAlarmFiltersService filtersService;

  Future<void> _onEvent(
    AssigneeEvent event,
    Emitter<AssigneeState> emit,
  ) async {
    switch (event) {
      case AssigneeSelectedEvent():
        filtersService.setSelectedFilter(Filters.assignee, data: event.userId);
        queryCtrl.onSearchText(null);

        final assignee = paginationRepository.pagingController.itemList
            ?.firstWhere((assignee) => assignee.userInfo.id?.id == event.userId);

        if (assignee != null) {
          if (event.selfAssignment) {
            emit(const AssigneeSelfAssignmentState());
          } else {
            emit(AssigneeSelectedState(assignee: assignee));
          }
        }

      case AssigneeSearchEvent():
        queryCtrl.onSearchText(event.searchText);

      case AssigneeResetEvent():
        filtersService.setSelectedFilter(Filters.assignee, data: null);
        emit(const AssigneeEmptyState());
        queryCtrl.onSearchText(null);

      case AssigneeRefreshEvent():
        paginationRepository.refresh();

      case AssigneeResetSearchTextEvent():
        queryCtrl.onSearchText(null);

      case AssigneeResetUnCommittedChanges():
        final String? assignee = filtersService.getSelectedFilter(
          Filters.assignee,
        );
        if (assignee != null) {
          add(AssigneeSelectedEvent(userId: assignee));
        } else {
          emit(const AssigneeEmptyState());
        }
    }
  }
}
