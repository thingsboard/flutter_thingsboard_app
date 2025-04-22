part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;

  const factory HomeState.homeDashboard(
    HomeDashboardInfo homeDashboard, {
    required bool isSysadmin,
  }) = HomeDashboardState;

  const factory HomeState.dashboards() = HomeStateDashboards;

  const factory HomeState.sysadmin() = HomeStateSysadmin;
}
