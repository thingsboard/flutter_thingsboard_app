import 'package:equatable/equatable.dart';

sealed class AssigneeState extends Equatable {
  const AssigneeState();

  @override
  List<Object?> get props => [];
}

final class AssigneeEmptyState extends AssigneeState {
  const AssigneeEmptyState();
}

final class AssigneeSelectedState extends AssigneeState {
  const AssigneeSelectedState({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
