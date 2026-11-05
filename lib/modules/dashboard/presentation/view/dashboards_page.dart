// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/di/dashboards_di.dart';
import 'package:thingsboard_app/modules/dashboard/main_dashboard_page.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_page_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboard_permission_error_view.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboards_appbar.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboards_grid.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/two_page_view.dart';

class DashboardsPage extends ConsumerStatefulWidget {
  const DashboardsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardsPageState();
}

class _DashboardsPageState extends ConsumerState<DashboardsPage> {
  final pageViewCtrl = TwoPageViewController();
  late final DashboardPageController dashboardPageCtrl;

  late final String diKey;

  @override
  Widget build(BuildContext context) {
    final havePermission = ref.watch(
      loginProvider.select((s) => s.canReadDashboards),
    );
    if (!havePermission) {
      return const DashboardPermissionErrorView();
    }

    return TwoPageView(
      controller: pageViewCtrl,
      first: DashboardsAppbar(
        body: DashboardsGridWidget(dashboardPageCtrl: dashboardPageCtrl),
      ),
      second: MainDashboardPage(controller: dashboardPageCtrl),
    );
  }

  @override
  void initState() {
    diKey = UniqueKey().toString();
    DashboardsDi.init(diKey, tbClient: getIt<ITbClientService>().client);
    dashboardPageCtrl = DashboardPageController(pageCtrl: pageViewCtrl);
    super.initState();
  }

  @override
  void dispose() {
    DashboardsDi.dispose(diKey);
    pageViewCtrl.dispose();
    super.dispose();
  }
}
