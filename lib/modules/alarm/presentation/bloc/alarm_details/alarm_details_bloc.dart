import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/acknowledge_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/clear_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_details/bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmDetailsBloc extends Bloc<AlarmDetailsEvent, AlarmDetailsState> {
  AlarmDetailsBloc({
    required this.fetchAlarmUseCase,
    required this.acknowledgeAlarmUseCase,
    required this.clearAlarmUseCase,
  }) : super(const AlarmDetailsLoadingState()) {
    on(_onEvents);
  }

  factory AlarmDetailsBloc.create() {
    return AlarmDetailsBloc(
      fetchAlarmUseCase: getIt(),
      acknowledgeAlarmUseCase: getIt(),
      clearAlarmUseCase: getIt(),
    );
  }

  final FetchAlarmUseCase fetchAlarmUseCase;
  final AcknowledgeAlarmUseCase acknowledgeAlarmUseCase;
  final ClearAlarmUseCase clearAlarmUseCase;

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
            ),
          );
        } else {
          emit(const AlarmDetailsErrorState(''));
        }

        break;

      case ClearAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        await clearAlarmUseCase(event.id);
        add(AlarmDetailsFetchEvent(id: event.id.id));

        break;

      case AcknowledgeAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        await acknowledgeAlarmUseCase(event.id);
        add(AlarmDetailsFetchEvent(id: event.id.id));

        break;
    }
  }
}
