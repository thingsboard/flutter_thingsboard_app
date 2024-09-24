import 'package:equatable/equatable.dart';

sealed class AlarmsState extends Equatable {
  const AlarmsState();

  @override
  List<Object?> get props => [];
}

final class AlarmsFiltersNotActivatedState extends AlarmsState {
  const AlarmsFiltersNotActivatedState();
}

final class AlarmsFilterActivatedState extends AlarmsState {
  const AlarmsFilterActivatedState();
}
