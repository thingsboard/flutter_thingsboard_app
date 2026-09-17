import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';

class DashboardBackHandler extends StatelessWidget {
  const DashboardBackHandler({
    required this.onBack,
    required this.child,
    this.interceptBack = true,
    super.key,
  });

  final Future<void> Function() onBack;
  final Widget child;
  final bool interceptBack;

  static Future<bool> tryNavigateBack(DashboardController? controller) async {
    if (controller == null) return false;
    if (controller.rightLayoutOpened.value) {
      await controller.toggleRightLayout();
      return true;
    }
    final web = controller.controller;
    if (web != null && await web.canGoBack()) {
      await web.goBack();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !interceptBack,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        await onBack();
      },
      child: child,
    );
  }
}
