import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/assignee_entity.dart';

sealed class AlarmAssigneeState extends Equatable {
  const AlarmAssigneeState();

  @override
  List<Object?> get props => [];
}

final class AlarmAssigneeEmptyState extends AlarmAssigneeState {
  const AlarmAssigneeEmptyState();
}

final class AlarmAssigneeSelectedState extends AlarmAssigneeState {
  const AlarmAssigneeSelectedState(this.assignee);

  final AssigneeEntity assignee;

  @override
  List<Object?> get props => [assignee];
}
