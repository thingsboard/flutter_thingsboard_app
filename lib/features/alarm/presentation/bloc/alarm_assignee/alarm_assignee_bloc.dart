import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/assignee_entity.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/assignee/alarm_assignee_pagiation_repository.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/assignee/alarm_assignee_query_ctrl.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/assignee/assign_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/assignee/unassign_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_assignee/alarm_assignee_event.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_assignee/alarm_assignee_state.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart'
    show AlarmAssigneeUpdatedEvent, ICommunicationService;
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmAssigneeBloc extends Bloc<AlarmAssigneeEvent, AlarmAssigneeState> {
  AlarmAssigneeBloc({
    required this.paginationRepository,
    required this.queryCtrl,
    required this.assignAlarmUseCase,
    required this.id,
    required this.fetchAlarmUseCase,
    required this.unassignAlarmUseCase,
    required this.userService,
  }) : super(const AlarmAssigneeEmptyState()) {
    on(_onEvent);
  }

  factory AlarmAssigneeBloc.create({required String id}) {
    return AlarmAssigneeBloc(
      paginationRepository: getIt(),
      queryCtrl: getIt(),
      assignAlarmUseCase: getIt(),
      id: id,
      fetchAlarmUseCase: getIt(),
      unassignAlarmUseCase: getIt(),
      userService: getIt(),
    );
  }

  final AlarmAssigneePaginationRepository paginationRepository;
  final AlarmAssigneeQueryCtrl queryCtrl;
  final AssignAlarmUseCase assignAlarmUseCase;
  final String id;
  final FetchAlarmUseCase fetchAlarmUseCase;
  final UnassignAlarmUseCase unassignAlarmUseCase;
  final IUserService userService;

  Future<void> _onEvent(
    AlarmAssigneeEvent event,
    Emitter<AlarmAssigneeState> emit,
  ) async {
    switch (event) {
      case AlarmAssigneeSelectedEvent():
        queryCtrl.onSearchText(null);
        await assignAlarmUseCase(
          AssignAlarmParams(id: id, userId: event.userId),
        );

        final assignee =
            paginationRepository.pagingController.itemList?.firstWhere(
          (assignee) => assignee.userInfo.id.id == event.userId,
        );

        emit(
          AlarmAssigneeSelectedState(
            assignee!,
            userId: userService.getUserId()!.id!,
          ),
        );
        getIt<ICommunicationService>().fire(
          AlarmAssigneeUpdatedEvent(event.userId),
        );

        break;
      case AlarmAssigneeSearchEvent():
        queryCtrl.onSearchText(event.searchText);

        break;
      case AlarmAssigneeResetSearchTextEvent():
        queryCtrl.onSearchText(null);

        break;
      case AlarmAssigneeUnassignedEvent():
        emit(const AlarmAssigneeEmptyState());

        await unassignAlarmUseCase(id);
        getIt<ICommunicationService>().fire(
          const AlarmAssigneeUpdatedEvent(null),
        );

        break;
      case AlarmAssigneeRefreshEvent():
        paginationRepository.refresh();

        break;
      case AlarmFetchAssigneeEvent():
        final alarmInfo = await fetchAlarmUseCase(id);
        if (alarmInfo?.assignee != null) {
          final userInfo = UserInfo(
            alarmInfo!.assignee!.id,
            email: alarmInfo.assignee!.email,
            firstName: alarmInfo.assignee!.firstName,
            lastName: alarmInfo.assignee!.lastName,
          );

          final assignee = AssigneeEntity.fromUserInfo(
            userInfo,
            detailsUseCase: getIt<UserDetailsUseCase>(),
          );

          emit(
            AlarmAssigneeSelectedState(
              assignee,
              userId: userService.getUserId()!.id!,
            ),
          );
        }

        break;
    }
  }
}
