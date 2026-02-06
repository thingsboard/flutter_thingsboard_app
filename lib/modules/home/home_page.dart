import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboards_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/home_dashboard_page.dart';
import 'package:thingsboard_app/modules/tenant/tenants_widget.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  bool keepAlive = true;
  late ProviderSubscription<LoginState> listener;
  @override
  void initState() {
    super.initState();
    listener = ref.listenManual(loginProvider, (prev, next) {
      if (prev?.isFullyAuthenticated() == next.isFullyAuthenticated()) {
        return;
      }
      keepAlive = next.isFullyAuthenticated();
      updateKeepAlive();
    });
  }

  @override
  void dispose() {
    super.dispose();
    listener.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final loginInfo = ref.watch(
      loginProvider.select(
        (s) => (s.isFullyAuthenticated(), s.mobileLoginInfo),
      ),
    );
    final homeDashboard = loginInfo.$2?.homeDashboardInfo;
    if (!loginInfo.$1) {
      return const SizedBox();
    }
    if (homeDashboard != null) {
      return HomeDashboardPage(homeDashboard,key: ValueKey(homeDashboard.dashboardId?.id), );
    }
    return _buildDefaultHome(context);
  }

 

  Widget _buildDefaultHome(BuildContext context) {
    if (getIt<ITbClientService>().client.isSystemAdmin()) {
      return _buildSysAdminHome(context);
    } else {
      return const DashboardsPage();
    }
  }

  Widget _buildSysAdminHome(BuildContext context) {
    return const TenantsWidget();
  }

  @override
  bool get wantKeepAlive => keepAlive;
}
