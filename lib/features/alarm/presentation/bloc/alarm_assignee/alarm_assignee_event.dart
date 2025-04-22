import 'package:equatable/equatable.dart';

sealed class AlarmAssigneeEvent extends Equatable {
  const AlarmAssigneeEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmFetchAssigneeEvent extends AlarmAssigneeEvent {
  const AlarmFetchAssigneeEvent();
}

final class AlarmAssigneeSelectedEvent extends AlarmAssigneeEvent {
  const AlarmAssigneeSelectedEvent(this.userId);

  final String userId;

  @override
  List<Object?> get props => [userId];
}

final class AlarmAssigneeSearchEvent extends AlarmAssigneeEvent {
  const AlarmAssigneeSearchEvent({required this.searchText});

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

final class AlarmAssigneeResetSearchTextEvent extends AlarmAssigneeEvent {
  const AlarmAssigneeResetSearchTextEvent();
}

final class AlarmAssigneeUnassignedEvent extends AlarmAssigneeEvent {
  const AlarmAssigneeUnassignedEvent();
}

final class AlarmAssigneeRefreshEvent extends AlarmAssigneeEvent {
  const AlarmAssigneeRefreshEvent();
}
