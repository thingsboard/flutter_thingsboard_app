import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/features/alarm/domain/entities/assignee_entity.dart';

sealed class AssigneeState extends Equatable {
  const AssigneeState();

  @override
  List<Object?> get props => [];
}

final class AssigneeEmptyState extends AssigneeState {
  const AssigneeEmptyState();
}

final class AssigneeSelectedState extends AssigneeState {
  const AssigneeSelectedState({required this.assignee});

  final AssigneeEntity assignee;

  @override
  List<Object?> get props => [assignee];
}

final class AssigneeSelfAssignmentState extends AssigneeState {
  const AssigneeSelfAssignmentState();
}
