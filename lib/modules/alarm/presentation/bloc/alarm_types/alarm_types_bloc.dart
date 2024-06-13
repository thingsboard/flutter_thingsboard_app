import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarm_types/fetch_alarm_types_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/bloc.dart';
import 'package:thingsboard_app/utils/services/pagination_repository.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

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
        break;
    }
  }
}
