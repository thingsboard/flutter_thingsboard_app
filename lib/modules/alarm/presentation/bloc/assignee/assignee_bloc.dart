import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/assignee/assignee_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/fetch_assignee_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_state.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

class AssigneeBloc extends Bloc<AssigneeEvent, AssigneeState> {
  AssigneeBloc({
    required this.paginationRepository,
    required this.fetchAssigneeUseCase,
    required this.queryCtrl,
  }) : super(const AssigneeEmptyState()) {
    on(_onEvent);
  }

  final PaginationRepository<PageLink, AssigneeEntity> paginationRepository;
  final FetchAssigneeUseCase fetchAssigneeUseCase;
  final AssigneeQueryCtrl queryCtrl;

  String? selectedUserId;

  Future<void> _onEvent(
    AssigneeEvent event,
    Emitter<AssigneeState> emit,
  ) async {
    switch (event) {
      case AssigneeSelectedEvent():
        selectedUserId = event.userId;
        queryCtrl.onSearchText(null);

        final assignee =
            paginationRepository.pagingController.itemList?.firstWhere(
          (assignee) => assignee.userInfo.id.id == event.userId,
        );

        if (assignee != null) {
          if (event.selfAssignment) {
            emit(const AssigneeSelfAssignmentState());
          } else {
            emit(AssigneeSelectedState(assignee: assignee));
          }
        }

        break;
      case AssigneeSearchEvent():
        queryCtrl.onSearchText(event.searchText);
        break;

      case AssigneeResetEvent():
        selectedUserId = null;
        emit(const AssigneeEmptyState());

        break;
      case AssigneeRefreshEvent():
        paginationRepository.refresh();

        break;
    }
  }
}
