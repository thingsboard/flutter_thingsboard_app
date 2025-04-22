import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/alarm_filters_entity.dart';
import 'package:thingsboard_app/features/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/alarms/fetch_alarms_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarms_states.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

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

        break;

      case AlarmFiltersUpdateEvent():
        queryController.onFiltersUpdated(event.filtersEntity);
        isFiltersActive = true;

        emit(const AlarmsFilterActivatedState());
        break;

      case AlarmSearchTextChanged():
        queryController.onSearchText(event.searchText);
        break;

      case AlarmsRefreshPageEvent():
        paginationRepository.refresh();
        break;
    }
  }
}
