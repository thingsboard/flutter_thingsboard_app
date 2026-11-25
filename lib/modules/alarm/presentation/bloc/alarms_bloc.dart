// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarms_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_states.dart';
import 'package:thingsboard_app/utils/services/communication/events/alarm_status_updated_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmsState> {
  AlarmBloc({
    required this.paginationRepository,
    required this.fetchAlarmsUseCase,
    required this.queryController,
    required ICommunicationService communicationService,
  }) : super(const AlarmsFiltersNotActivatedState()) {
    on(_onEvent);
    // An alarm acknowledged or cleared in its details: show the new status,
    // or drop it if the filters exclude it.
    _statusUpdates = communicationService.on<AlarmStatusUpdatedEvent>().listen(
      (_) => add(const AlarmsRefreshPageEvent()),
    );
  }

  late final StreamSubscription<AlarmStatusUpdatedEvent> _statusUpdates;

  final PaginationRepository<AlarmQueryV2, AlarmInfo> paginationRepository;
  final FetchAlarmsUseCase fetchAlarmsUseCase;
  final AlarmQueryController queryController;
  bool isFiltersActive = false;

  @override
  Future<void> close() {
    _statusUpdates.cancel();
    return super.close();
  }

  Future<void> _onEvent(AlarmEvent event, Emitter<AlarmsState> emit) async {
    switch (event) {
      case AlarmFiltersResetEvent():
        isFiltersActive = false;

        emit(const AlarmsFiltersNotActivatedState());
        queryController.onFiltersUpdated(AlarmFiltersEntity.defaultFilters());

      case AlarmFiltersUpdateEvent():
        queryController.onFiltersUpdated(event.filtersEntity);
        isFiltersActive = true;

        emit(const AlarmsFilterActivatedState());

      case AlarmSearchTextChanged():
        queryController.onSearchText(event.searchText);

      case AlarmsRefreshPageEvent():
        paginationRepository.refresh();
    }
  }
}
