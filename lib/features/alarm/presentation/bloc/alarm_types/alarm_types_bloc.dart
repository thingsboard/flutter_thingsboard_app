import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/alarm/domain/usecases/alarm_types/fetch_alarm_types_usecase.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_types/alarm_types_event.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarm_types/alarm_types_state.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/filters/i_alarm_filters_service.dart';
import 'package:thingsboard_app/services/pagination_repository.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmTypesBloc extends Bloc<AlarmTypesEvent, AlarmTypesState> {
  AlarmTypesBloc({
    required this.paginationRepository,
    required this.fetchAlarmTypesUseCase,
    required this.filtersService,
  }) : super(const AlarmTypesSelectionEmptyState()) {
    on(_onEvent);
  }

  final PaginationRepository<PageLink, AlarmType> paginationRepository;
  final FetchAlarmTypesUseCase fetchAlarmTypesUseCase;
  final IAlarmFiltersService filtersService;

  Future<void> _onEvent(
    AlarmTypesEvent event,
    Emitter<AlarmTypesState> emit,
  ) async {
    switch (event) {
      case AlarmTypesSelectedEvent():
        final types = filtersService.getSelectedFilter(Filters.type);
        types.add(event.type);
        filtersService.setSelectedFilter(Filters.type, data: types);

        emit(
          AlarmTypeSelectedState(
            selectedTypes: types,
            allowToAddMore: types.length <
                (paginationRepository.pagingController.itemList?.length ?? 0),
          ),
        );
        break;

      case AlarmTypesRemoveSelectedEvent():
        final types = filtersService.getSelectedFilter(Filters.type);
        types.remove(event.type);
        filtersService.setSelectedFilter(Filters.type, data: types);

        if (types.isNotEmpty) {
          emit(
            AlarmTypeSelectedState(
              selectedTypes: types,
              allowToAddMore: types.length <
                  (paginationRepository.pagingController.itemList?.length ?? 0),
            ),
          );
        } else {
          emit(const AlarmTypesSelectionEmptyState());
        }

        break;
      case AlarmTypesResetEvent():
        emit(const AlarmTypesSelectionEmptyState());

        break;
      case AlarmTypesRefreshEvent():
        paginationRepository.refresh();

        break;
      case AlarmTypesResetUnCommittedChanges():
        final types = filtersService.getSelectedFilter(Filters.type);

        if (types.isNotEmpty) {
          emit(
            AlarmTypeSelectedState(
              selectedTypes: types,
              allowToAddMore: types.length <
                  (paginationRepository.pagingController.itemList?.length ?? 0),
            ),
          );
        } else {
          emit(const AlarmTypesSelectionEmptyState());
        }

        break;
    }
  }
}
