import 'package:equatable/equatable.dart';

sealed class NoAuthState extends Equatable {
  const NoAuthState();

  @override
  List<Object?> get props => [];
}

final class NoAuthLoadingState extends NoAuthState {
  const NoAuthLoadingState();
}

final class NoAuthWipState extends NoAuthState {
  const NoAuthWipState({required this.currentStateMessage});

  final String currentStateMessage;

  @override
  List<Object?> get props => [currentStateMessage];
}

final class NoAuthErrorState extends NoAuthState {
  const NoAuthErrorState({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class NoAuthDoneState extends NoAuthState {
  const NoAuthDoneState();
}
