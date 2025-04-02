import 'package:equatable/equatable.dart';

sealed class NoAuthEvent extends Equatable {
  const NoAuthEvent();

  @override
  List<Object?> get props => [];
}

final class SwitchToAnotherEndpointEvent extends NoAuthEvent {
  const SwitchToAnotherEndpointEvent({required this.parameters});

  final Map<String, dynamic>? parameters;

  @override
  List<Object?> get props => [parameters];
}

final class SwitchEndpointProgressUpdateEvent extends NoAuthEvent {
  const SwitchEndpointProgressUpdateEvent({required this.progressMessage});

  final String progressMessage;

  @override
  List<Object?> get props => [progressMessage];
}

final class SwitchEndpointDoneEvent extends NoAuthEvent {
  const SwitchEndpointDoneEvent();
}

final class SwitchEndpointErrorEvent extends NoAuthEvent {
  const SwitchEndpointErrorEvent({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}
