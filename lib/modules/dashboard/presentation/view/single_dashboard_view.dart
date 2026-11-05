// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/di/dashboards_di.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/dashboard_permission_error_view.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_back_handler.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class SingleDashboardView extends ConsumerStatefulWidget {
  const SingleDashboardView({
    required this.id,
    this.title,
    this.state,
    this.hideToolbar,
    super.key,
  });

  final String id;
  final String? title;
  final String? state;
  final bool? hideToolbar;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SingleDashboardViewState();
}

class _SingleDashboardViewState extends ConsumerState<SingleDashboardView>
    with TickerProviderStateMixin {
  final dashboardTitleValue = ValueNotifier<String>('Dashboard');
  final hasRightLayout = ValueNotifier(false);
  bool canGoBack = false;
  late final String diKey;
  late final Animation<double> rightLayoutMenuAnimation;
  late final AnimationController rightLayoutMenuController;

  DashboardController? _dashboardController;

  @override
  Widget build(BuildContext context) {
    final havePermission = ref.watch(
      loginProvider.select((s) => s.canReadDashboards),
    );
    if (!havePermission) {
      return DashboardPermissionErrorView();
    }

    return Scaffold(
      appBar: TbAppBar(
        leading: context.canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _handleBack,
            )
          : null,
        elevation: 1,
        shadowColor: Colors.transparent,
        title: ValueListenableBuilder<String>(
          valueListenable: dashboardTitleValue,
          builder: (context, title, widget) {
            return Text(title, maxLines: 1, overflow: TextOverflow.ellipsis);
          },
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: hasRightLayout,
            builder: (context, hasRightLayout, widget) {
              if (hasRightLayout) {
                return IconButton(
                  onPressed: () => _dashboardController?.toggleRightLayout(),
                  icon: AnimatedIcon(
                    progress: rightLayoutMenuAnimation,
                    icon: AnimatedIcons.menu_close,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
        canGoBack: canGoBack,
      ),
      body: DashboardBackHandler(
        onBack: _handleBack,
        child: SafeArea(
          child: DashboardWidget(
            titleCallback: (title) {
              dashboardTitleValue.value = getIt<ICustomTranslationService>()
                  .translate(widget.title ?? title);
            },
            controllerCallback: (controller, _) {
              _dashboardController = controller;
              controller.hasRightLayout.addListener(() {
                hasRightLayout.value = controller.hasRightLayout.value;
              });
              controller.rightLayoutOpened.addListener(() {
                if (controller.rightLayoutOpened.value) {
                  rightLayoutMenuController.forward();
                } else {
                  rightLayoutMenuController.reverse();
                }
              });

              controller.canGoBack.addListener(() {
                setState(() {
                  canGoBack = controller.canGoBack.value;
                });
              });

              controller.openDashboard(
                widget.id,
                state: widget.state,
                hideToolbar: widget.hideToolbar,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _handleBack() async {
    if (await DashboardBackHandler.tryNavigateBack(_dashboardController)) {
      return;
    }
    if (mounted && context.canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();

    diKey = UniqueKey().toString();
    DashboardsDi.init(diKey, tbClient: getIt<ITbClientService>().client);
    rightLayoutMenuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    rightLayoutMenuAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: rightLayoutMenuController,
    );

    if (widget.title != null) {
      dashboardTitleValue.value = getIt<ICustomTranslationService>()
          .translate(widget.title);
    }
  }

  @override
  void dispose() {
    DashboardsDi.dispose(diKey);
    rightLayoutMenuController.dispose();

    super.dispose();
  }
}
