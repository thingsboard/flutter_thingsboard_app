// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/providers/live_tracking_provider.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/widgets/live_tracking_bar.dart';
import 'package:thingsboard_app/modules/main/domain/models/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_type.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/navigation_badge_widget.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/tb_navigation_bar_widget.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';

class NavigationPage extends HookConsumerWidget {
  NavigationPage({
    super.key,
    required this.child,
    TbNavigationType? navigationType,
  }) : navigationType = navigationType ?? TbNavigationType.configured;
  final Widget child;
  final TbNavigationType navigationType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int?> currentIndex = useState(0);
    final items = ref.watch(navigationProvider).bottomBarPages;
    final trackingBarVisible = ref.watch(liveTrackingProvider).session != null;
    // Handle app lifecycle for notifications
    useOnAppLifecycleStateChange((prev, next) {
      if (next == AppLifecycleState.resumed) {
        getIt<NotificationService>().updateNotificationsCount();
      }
    });

    useEffect(() {
      getIt<NotificationService>().updateNotificationsCount();
      return null;
    }, []);

    // Update current index based on current route
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentPath = GoRouterState.of(context).uri.toString();
        final newIndex = NavigationHelper.getCurrentIndexFromPath(
          currentPath,
          items,
        );
        if (newIndex != currentIndex.value) {
          currentIndex.value = newIndex;
        }
      });

      return null;
    }, [GoRouterState.of(context).uri, items]);

    return PopScope(
      onPopInvokedWithResult: (didPop, res) {
        // The router pops the pages opened in a tab; then the first tab,
        // then exit.
        if (!context.canPop()) {
          if (currentIndex.value != 0) {
            return context.go(items.first.path);
          }
          SystemNavigator.pop();
        }
      },
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            const LiveTrackingBar(),
            Expanded(
              // The bar owns the status bar inset while it is visible, so the
              // page below must not add it again. With no bar the pages keep
              // the padding they have always had, and the Scaffold stays at
              // the root so it still paints behind the status bar.
              //
              // The Builder is what keeps this to the top inset: Scaffold
              // hands its body slot a MediaQuery that already has the bottom
              // padding and the keyboard inset removed, and re-providing the
              // data from this method's context would put both back.
              child: trackingBarVisible
                  ? Builder(
                      builder: (bodyContext) => MediaQuery.removePadding(
                        context: bodyContext,
                        removeTop: true,
                        child: child,
                      ),
                    )
                  : child,
            ),
          ],
        ),
        bottomNavigationBar: currentIndex.value == null
            ? null
            : TbNavigationBarWidget(
                currentIndex: currentIndex.value!,
                onTap: (index) {
                  if (index == currentIndex.value) {
                    return;
                  }
                  if (index < items.length) {
                    final path = items[index].path;
                    currentIndex.value = index;
                    if (navigationType.pushesTab(path)) {
                      context.push(path);
                    } else {
                      context.go(path);
                    }
                  }
                },
                customBottomBarItems: items
                    .map(
                      (item) => TbMainNavigationItem(
                        title: NavigationHelper.getLocalizedTitle(
                          context,
                          item,
                        ),
                        icon: item.icon,
                        path: item.path,
                        id: item.id,
                        showAdditionalIcon: item.showNotificationBadge,
                        additionalIconLarge: item.showNotificationBadge
                            ? const NavigationBadgeWidget(isLarge: false)
                            : null,
                        additionalIconSmall: item.showNotificationBadge
                            ? const NavigationBadgeWidget(isLarge: false)
                            : null,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
