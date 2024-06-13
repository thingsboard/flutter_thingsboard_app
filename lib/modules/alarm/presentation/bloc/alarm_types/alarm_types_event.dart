import 'package:equatable/equatable.dart';

sealed class AlarmTypesEvent extends Equatable {
  const AlarmTypesEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmTypesSelectedEvent extends AlarmTypesEvent {
  const AlarmTypesSelectedEvent({required this.type});

  final String type;

  @override
  List<Object?> get props => [type];
}
