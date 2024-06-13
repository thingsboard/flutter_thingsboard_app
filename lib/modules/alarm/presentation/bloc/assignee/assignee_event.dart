import 'package:equatable/equatable.dart';

sealed class AssigneeEvent extends Equatable {
  const AssigneeEvent();

  @override
  List<Object?> get props => [];
}

final class AssigneeSelectedEvent extends AssigneeEvent {
  const AssigneeSelectedEvent({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
