import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/features/dashboard/presentation/view/home_dashboard_page.dart';
import 'package:thingsboard_app/features/home/bloc/home_bloc.dart';
import 'package:thingsboard_app/modules/tenant/tenants_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc.create()..add(const HomeEventFetch()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.map(
            loading: (_) => const TbLoadingScreen(),
            homeDashboard: (state) => HomeDashboardPage(
              state.homeDashboard,
              isSysAdmin: state.isSysadmin,
            ),
            dashboards: (_) => const DashboardsPage(),
            sysadmin: (_) => const TenantsWidget(),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
