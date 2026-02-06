import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/model/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/more/more_menu_item_widget.dart';
import 'package:thingsboard_app/modules/more/profle_widget.dart';
import 'package:thingsboard_app/modules/more/widgets/more_page_footer.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';

class MorePage extends HookConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginProvider);
    final items = ref.watch(navigationProvider.select((n) => n.morePages));
    final userDetails = getIt<UserDetailsUseCase>()(
      UserDetailsParams(
        firstName: login.user?.firstName ?? '',
        lastName: login.user?.lastName ?? '',
        email: login.user?.email ?? '',
      ),
    );
    useEffect(() {
      getIt<NotificationService>().updateNotificationsCount();
      return null;
    }, []);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidget(userDetails: userDetails, user: login.user),
                if(items.isNotEmpty)
                ...[Divider(
                  color: Colors.black.withValues(alpha: .05),
                  thickness: 1,
                  height: 0,
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          items
                              .map(
                                (e) => MoreMenuItemWidget(
                                  TbMainNavigationItem(
                                    title: e.title,
                                    icon: e.icon,
                                    path: e.path,
                                    showAdditionalIcon: e.showNotificationBadge,
                                  ),
                                  onTap: () {
                                    context.push(e.path);
                                  },
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
               ],
                Divider(
                  color: Colors.black.withValues(alpha: .05),
                  thickness: 1,
                  height: 0,
                ),
                MoreMenuItemWidget(
                  TbMainNavigationItem(
                    title: S.of(context).logout,
                    icon: Icons.logout,
                    path: '',
                  ),
                  showTrailing: false,
                  color: AppColors.textError,
                  onTap: () async  {
                 await    ref.read(loginProvider.notifier).logout();
                  },
                ),
              ],
            ),
          ),
          const MorePageFooter(),
        ],
      ),
    );
  }
}
