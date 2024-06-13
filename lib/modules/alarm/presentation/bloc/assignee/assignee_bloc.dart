import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/assignee/fetch_assignee_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_event.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/assignee/assignee_state.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AssigneeBloc extends Bloc<AssigneeEvent, AssigneeState> {
  AssigneeBloc({
    required this.paginationRepository,
    required this.fetchAssigneeUseCase,
  }) : super(const AssigneeEmptyState()) {
    on(_onEvent);
  }

  final PaginationRepository<PageLink, UserInfo> paginationRepository;
  final FetchAssigneeUseCase fetchAssigneeUseCase;

  String? selectedUserId;

  Future<void> _onEvent(
    AssigneeEvent event,
    Emitter<AssigneeState> emit,
  ) async {
    switch (event) {
      case AssigneeSelectedEvent():
      // TODO: Handle this case.
    }
  }
}
