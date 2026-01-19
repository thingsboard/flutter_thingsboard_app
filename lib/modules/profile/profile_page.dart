import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/profile/di/profile_di.dart';
import 'package:thingsboard_app/modules/profile/widget/profile_preview_widget.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';

import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({this.fullscreen = false, super.key});

  final bool fullscreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final user = ref.watch(loginProvider.select((l) => l.user));
    final isLoading = useState(false);
    useEffect(() {
      final scope = UniqueKey().toString();
      ProfileDi.init(scope);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        isLoading.value = true;
        await ref.read(loginProvider.notifier).loadUser();
        isLoading.value = false;
      });

      return () {
        ProfileDi.dispose(scope);
      };
    }, []);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(
        title: Text(S.of(context).profile),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: theme.primaryColor),
            onPressed: () async {
              final edited = await context.push<bool?>('/profile/edit');
              if (edited == true) {
                showEditingSuccess();
              }
            },
          ),
          if (fullscreen)
            IconButton(
              icon:  const Icon(Icons.logout, color: AppColors.textError),
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: user == null ? const SizedBox() :  ProfilePreviewWidget(
                  user: user,
                  loadingNotifier: isLoading,
                ),
              ),
            ),
          ),
          AnimatedVisibilityWidget(
            show: isLoading.value,
            child: const FullScreenLoader(),
          ),
        ],
      ),
    );
  }

  void showEditingSuccess() {
    getIt<IOverlayService>().showSuccessNotification(
      (ctx) => S.of(ctx).profileSuccessNotification,
      duration: const Duration(milliseconds: 1500),
    );
  }
}
