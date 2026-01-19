import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/model/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/model/navigation_type.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_helper.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/main/widgets/navigation_badge_widget.dart';
import 'package:thingsboard_app/modules/main/widgets/tb_navigation_bar_widget.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class NavigationPage extends HookConsumerWidget {
  const NavigationPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<int?> currentIndex = useState(0);
    final items = ref.watch(navigationProvider).bottomBarPages;
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
      onPopInvokedWithResult: (didPop, res) async {
        if (!context.canPop()) {
          if (currentIndex.value != 0) {
            return context.pushReplacement(items.first.path);
          }
          final confirm = await getIt<IOverlayService>().showConfirmDialog(
            content:
                (_) => DialogContent(
                  title: 'Are you sure you want te exit?',
                  message: 'Confirm to close the app',
                  cancel: S.of(context).cancel,
                ),
          );
          if (confirm == true && context.mounted) {
            SystemNavigator.pop();
          }
        }
      },
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: child,
          bottomNavigationBar:
              currentIndex.value == null
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
                        if (ThingsboardAppConstants.navigationType ==
                            TbNavigationType.push) {
                          context.push(path);
                          return;
                        }
                        if (path.contains('/home') || path.contains('/url')) {
                          return context.go(path);
                        }
                        context.push(path);
                      }
                    },
                    customBottomBarItems:
                        items
                            .map(
                              (item) => TbMainNavigationItem(
                                title: item.title,
                                icon: item.icon,
                                path: item.path,
                                id: item.id,
                                showAdditionalIcon: item.showNotificationBadge,
                                additionalIconLarge:
                                    item.showNotificationBadge
                                        ? const NavigationBadgeWidget(
                                          isLarge: false,
                                        )
                                        : null,
                                additionalIconSmall:
                                    item.showNotificationBadge
                                        ? const NavigationBadgeWidget(
                                          isLarge: false,
                                        )
                                        : null,
                              ),
                            )
                            .toList(),
                  ),
        ),
      ),
    );
  }
}
