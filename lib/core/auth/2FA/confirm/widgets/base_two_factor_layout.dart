import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class BaseTwoFactorLayout extends ConsumerWidget {
  const BaseTwoFactorLayout({
    super.key,
    required this.title,
    required this.child,

    required this.isLoading,
  });
  final bool isLoading;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        PopScope(
          onPopInvokedWithResult: (didPop, result) {
            // if (didPop) {
            //   if(!ref.read(loginProvider).isFullyAuthenticated()) {
            //     ref.read(loginProvider.notifier).logout();
            //   }
            // }
          },
          child: Scaffold(
            appBar: TbAppBar(title: Text(title)),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: child,
            ),
          ),
        ),
        AnimatedVisibilityWidget(
          show: isLoading,
          child: const FullScreenLoader(),
        ),
      ],
    );
  }
}
