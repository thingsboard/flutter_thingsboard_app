import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarm_types/fetch_alarm_types_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/bloc.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';

class AlarmTypesBloc extends Bloc<AlarmTypesEvent, AlarmTypesState> {
  AlarmTypesBloc({
    required this.paginationRepository,
    required this.fetchAlarmTypesUseCase,
  }) : super(const AlarmTypesSelectionEmptyState()) {
    on(_onEvent);
  }

  final PaginationRepository<PageLink, AlarmType> paginationRepository;
  final FetchAlarmTypesUseCase fetchAlarmTypesUseCase;

  final selectedTypes = <String>{};

  Future<void> _onEvent(
    AlarmTypesEvent event,
    Emitter<AlarmTypesState> emit,
  ) async {
    switch (event) {
      case AlarmTypesSelectedEvent():
        selectedTypes.add(event.type);
        emit(
          AlarmTypeSelectedState(
            selectedTypes: selectedTypes,
            allowToAddMore: selectedTypes.length <
                (paginationRepository.pagingController.itemList?.length ?? 0),
          ),
        );
        break;

      case AlarmTypesRemoveSelectedEvent():
        selectedTypes.remove(event.type);
        if (selectedTypes.isNotEmpty) {
          emit(
            AlarmTypeSelectedState(
              selectedTypes: selectedTypes,
              allowToAddMore: selectedTypes.length <
                  (paginationRepository.pagingController.itemList?.length ?? 0),
            ),
          );
        } else {
          emit(const AlarmTypesSelectionEmptyState());
        }

        break;
      case AlarmTypesResetEvent():
        selectedTypes.clear();
        emit(const AlarmTypesSelectionEmptyState());

        break;
      case AlarmTypesRefreshEvent():
        paginationRepository.refresh();

        break;
    }
  }
}
