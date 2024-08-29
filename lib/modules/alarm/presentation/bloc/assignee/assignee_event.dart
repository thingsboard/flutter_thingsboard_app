import 'package:equatable/equatable.dart';

sealed class AssigneeEvent extends Equatable {
  const AssigneeEvent();

  @override
  List<Object?> get props => [];
}

final class AssigneeSelectedEvent extends AssigneeEvent {
  const AssigneeSelectedEvent({
    required this.userId,
    this.selfAssignment = false,
  });

  final String userId;
  final bool selfAssignment;

  @override
  List<Object?> get props => [userId, selfAssignment];
}

final class AssigneeSearchEvent extends AssigneeEvent {
  const AssigneeSearchEvent({required this.searchText});

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

final class AssigneeResetSearchTextEvent extends AssigneeEvent {
  const AssigneeResetSearchTextEvent();
}

final class AssigneeResetEvent extends AssigneeEvent {
  const AssigneeResetEvent();
}

final class AssigneeRefreshEvent extends AssigneeEvent {
  const AssigneeRefreshEvent();
}

final class AssigneeResetUnCommittedChanges extends AssigneeEvent {
  const AssigneeResetUnCommittedChanges();
}
