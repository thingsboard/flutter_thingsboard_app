import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/widgets/two_page_view.dart';

class DashboardPageController {
  DashboardPageController({required this.pageCtrl});

  final dashboardController = Completer<DashboardController>();
  late ValueNotifier<String> dashboardTitleValue;
  final TwoPageViewController pageCtrl;

  void setDashboardController(DashboardController controller) {
    dashboardController.complete(controller);
  }

  void setDashboardTitleNotifier(ValueNotifier<String> notifier) {
    dashboardTitleValue = notifier;
  }

  Future<bool> openDashboard(
    String dashboardId, {
    String? title,
    String? state,
    bool? hideToolbar,
  }) async {
    if (title != null) {
      dashboardTitleValue.value = title;
    }

    dashboardController.future.then((controller) {
      controller.openDashboard(
        dashboardId,
        state: state,
        hideToolbar: hideToolbar,
      );
    });

    return pageCtrl.open(1, animate: true);
  }

  Future<bool> closeDashboard() async {
    return pageCtrl.close(1, animate: true);
  }
}
