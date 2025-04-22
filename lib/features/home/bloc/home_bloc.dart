import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

part 'home_bloc.freezed.dart';
part 'home_events.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.dashboardService,
    required this.tbClientService,
  }) : super(const HomeStateLoading()) {
    on<HomeEventFetch>(_fetch);
  }

  factory HomeBloc.create() => HomeBloc(
        dashboardService: getIt(),
        tbClientService: getIt(),
      );

  final IDashboardService dashboardService;
  final ITbClientService tbClientService;

  Future<void> _fetch(HomeEventFetch event, Emitter<HomeState> emit) async {
    final homeDashboard = dashboardService.getHomeDashboard();
    final isSysAdmin = tbClientService.isSystemAdmin();
    if (homeDashboard != null) {
      emit(HomeDashboardState(homeDashboard, isSysadmin: isSysAdmin));
    } else if (isSysAdmin) {
      emit(const HomeStateSysadmin());
    } else {
      emit(const HomeStateDashboards());
    }
  }
}
