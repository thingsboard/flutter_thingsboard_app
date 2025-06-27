import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarms_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_states.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmsState> {
  AlarmBloc({
    required this.paginationRepository,
    required this.fetchAlarmsUseCase,
    required this.queryController,
  }) : super(const AlarmsFiltersNotActivatedState()) {
    on(_onEvent);
  }

  final PaginationRepository<AlarmQueryV2, AlarmInfo> paginationRepository;
  final FetchAlarmsUseCase fetchAlarmsUseCase;
  final AlarmQueryController queryController;
  bool isFiltersActive = false;

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
