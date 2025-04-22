import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

sealed class AlarmActivityState extends Equatable {
  const AlarmActivityState();

  @override
  List<Object?> get props => [];
}

final class AlarmActivityLoadingState extends AlarmActivityState {
  const AlarmActivityLoadingState();
}

final class AlarmActivityLoadedState extends AlarmActivityState {
  const AlarmActivityLoadedState({
    required this.displayName,
    required this.shortName,
    required this.hasSomeActivity,
  });

  final String displayName;
  final String shortName;
  final bool hasSomeActivity;

  @override
  List<Object?> get props => [displayName, shortName, hasSomeActivity];
}

final class AlarmCommentEditState extends AlarmActivityState {
  const AlarmCommentEditState(
    this.commentId, {
    required this.alarmId,
    required this.commentToEdit,
  });

  final AlarmId alarmId;
  final String commentId;
  final AlarmComment commentToEdit;

  @override
  List<Object?> get props => [commentId, alarmId, commentToEdit];
}
