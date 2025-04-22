part of 'core_bloc.dart';

@freezed
class CoreEvent with _$CoreEvent {
  const factory CoreEvent.init({
    required Size screenSize,
    required Orientation orientation,
  }) = CoreEventInit;

  const factory CoreEvent.initWithRegions({
    required Size screenSize,
    required Orientation orientation,
  }) = CoreEventInitWithRegions;

  const factory CoreEvent.userLoaded() = CoreEventUserLoaded;

  const factory CoreEvent.logout() = CoreEventLogout;
}
