import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/details/acknowledge_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/details/clear_alarm_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_details/alarm_details_events.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_details/alarm_details_states.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmDetailsBloc extends Bloc<AlarmDetailsEvent, AlarmDetailsState> {
  AlarmDetailsBloc({
    required this.fetchAlarmUseCase,
    required this.acknowledgeAlarmUseCase,
    required this.clearAlarmUseCase,
    required this.userService,
  }) : super(const AlarmDetailsLoadingState()) {
    on(_onEvents);
  }

  factory AlarmDetailsBloc.create() {
    return AlarmDetailsBloc(
      fetchAlarmUseCase: getIt(),
      acknowledgeAlarmUseCase: getIt(),
      clearAlarmUseCase: getIt(),
      userService: getIt(),
    );
  }

  final FetchAlarmUseCase fetchAlarmUseCase;
  final AcknowledgeAlarmUseCase acknowledgeAlarmUseCase;
  final ClearAlarmUseCase clearAlarmUseCase;
  final IUserService userService;

  Future<void> _onEvents(
    AlarmDetailsEvent event,
    Emitter<AlarmDetailsState> emit,
  ) async {
    switch (event) {
      case AlarmDetailsFetchEvent():
        final alarmInfo = await fetchAlarmUseCase(event.id!);
        if (alarmInfo != null) {
          final acknowledge = [
            AlarmStatus.CLEARED_UNACK,
            AlarmStatus.ACTIVE_UNACK,
          ].contains(alarmInfo.status);

          final clear = [
            AlarmStatus.ACTIVE_UNACK,
            AlarmStatus.ACTIVE_ACK,
          ].contains(alarmInfo.status);

          emit(
            AlarmDetailsLoadedState(
              alarmInfo,
              acknowledge: acknowledge,
              clear: clear,
              userId: userService.getUserId()!,
            ),
          );
        } else {
          emit(const AlarmDetailsErrorState(''));
        }

        break;

      case ClearAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        try {
          await clearAlarmUseCase(event.id);
        } finally {
          add(AlarmDetailsFetchEvent(id: event.id.id));
        }

        break;

      case AcknowledgeAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        try {
          await acknowledgeAlarmUseCase(event.id);
        } finally {
          add(AlarmDetailsFetchEvent(id: event.id.id));
        }

        break;
    }
  }
}
