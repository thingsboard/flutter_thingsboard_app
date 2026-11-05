import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

sealed class AlarmDetailsState extends Equatable {
  const AlarmDetailsState();

  @override
  List<Object?> get props => [];
}

final class AlarmDetailsLoadingState extends AlarmDetailsState {
  const AlarmDetailsLoadingState();
}

final class AlarmDetailsLoadedState extends AlarmDetailsState {
  const AlarmDetailsLoadedState(
    this.alarmInfo, {
    required this.acknowledge,
    required this.clear,
  });

  final AlarmInfo alarmInfo;
  final bool acknowledge;
  final bool clear;

  @override
  List<Object?> get props => [alarmInfo, acknowledge, clear];
}

final class AlarmDetailsErrorState extends AlarmDetailsState {
  const AlarmDetailsErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
