// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/acknowledge_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/clear_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_details/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/events/alarm_status_updated_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmDetailsBloc extends Bloc<AlarmDetailsEvent, AlarmDetailsState> {
  AlarmDetailsBloc({
    required this.fetchAlarmUseCase,
    required this.acknowledgeAlarmUseCase,
    required this.clearAlarmUseCase,
    required this.communicationService,
  }) : super(const AlarmDetailsLoadingState()) {
    on(_onEvents);
  }

  factory AlarmDetailsBloc.create() {
    return AlarmDetailsBloc(
      fetchAlarmUseCase: getIt(),
      acknowledgeAlarmUseCase: getIt(),
      clearAlarmUseCase: getIt(),
      communicationService: getIt(),
    );
  }

  final FetchAlarmUseCase fetchAlarmUseCase;
  final AcknowledgeAlarmUseCase acknowledgeAlarmUseCase;
  final ClearAlarmUseCase clearAlarmUseCase;
  final ICommunicationService communicationService;

  Future<void> _onEvents(
    AlarmDetailsEvent event,
    Emitter<AlarmDetailsState> emit,
  ) async {
    switch (event) {
      case AlarmDetailsFetchEvent():
        final AlarmInfo? alarmInfo;
        try {
          alarmInfo = await fetchAlarmUseCase(event.id!);
        } catch (_) {
          emit(const AlarmDetailsErrorState(''));
          return;
        }
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

      case ClearAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        try {
          await clearAlarmUseCase(event.id);
          communicationService.fire(AlarmStatusUpdatedEvent(event.id.id));
        } finally {
          add(AlarmDetailsFetchEvent(id: event.id.id));
        }

      case AcknowledgeAlarmEvent():
        emit(const AlarmDetailsLoadingState());
        try {
          await acknowledgeAlarmUseCase(event.id);
          communicationService.fire(AlarmStatusUpdatedEvent(event.id.id));
        } finally {
          add(AlarmDetailsFetchEvent(id: event.id.id));
        }
    }
  }
}
