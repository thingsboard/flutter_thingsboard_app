part of 'core_bloc.dart';

@freezed
class CoreState with _$CoreState {
  const factory CoreState.loading() = CoreStateLoading;

  const factory CoreState.fatalError(String? message) = CoreStatesFatalError;

  const factory CoreState.requireClientUpdate({
    required VersionInfo versionInfo,
    required StoreInfo? storeInfo,
  }) = CoreStateRequireClientUpdate;

  const factory CoreState.userLoaded({
    required bool isFullyAuthenticated,
    required String? defaultDashboardId,
    required bool fullscreenDashboard,
  }) = CoreStateUserLoaded;
}
