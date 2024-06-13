import 'package:equatable/equatable.dart';

sealed class AlarmTypesState extends Equatable {
  const AlarmTypesState();

  @override
  List<Object?> get props => [];
}

final class AlarmTypesLoadingState extends AlarmTypesState {
  const AlarmTypesLoadingState();
}

final class AlarmTypeSelectedState extends AlarmTypesState {
  const AlarmTypeSelectedState({required this.selectedTypes});

  final Set<String> selectedTypes;

  @override
  List<Object?> get props => [selectedTypes];
}

final class AlarmTypesSelectionEmptyState extends AlarmTypesState {
  const AlarmTypesSelectionEmptyState();

  @override
  List<Object?> get props => [];
}
