import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

sealed class AlarmDetailsEvent extends Equatable {
  const AlarmDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmDetailsFetchEvent extends AlarmDetailsEvent {
  const AlarmDetailsFetchEvent({required this.id});

  final String? id;

  @override
  List<Object?> get props => [id];
}

final class ClearAlarmEvent extends AlarmDetailsEvent {
  const ClearAlarmEvent(this.id);

  final AlarmId id;

  @override
  List<Object?> get props => [id];
}

final class AcknowledgeAlarmEvent extends AlarmDetailsEvent {
  const AcknowledgeAlarmEvent(this.id);

  final AlarmId id;

  @override
  List<Object?> get props => [id];
}
