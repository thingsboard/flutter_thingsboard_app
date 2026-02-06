import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';

class HomeHandler extends RouteHandler {
  late final ProviderSubscription<LoginState> _sub;
  // @override
  // void init(BuildContext context, WidgetRef ref) {
  //         final path = GoRouterState.of(context).fullPath;
  // final state=   ref.read(loginProvider);
  //   if (state.isFullyAuthenticated() && path != LoginRoutes.login + LoginRoutes.updateRequired) {
  //       final t = ref.read(navigationProvider);
  //       final p = t.bottomBarPages.first;

  //       context.go(p.path);
  //     }
  //   super.init(context, ref);
  // }

  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    _sub = ref.listenManual(loginProvider, (prev, next) {
      final path = GoRouterState.of(context).fullPath;
      if (next.isFullyAuthenticated() &&
          prev?.isFullyAuthenticated() == false &&
          path != LoginRoutes.login + LoginRoutes.updateRequired) {
        ref.read(navigationProvider.notifier).onLoggedIn();
        final t = ref.read(navigationProvider);
        if (t.bottomBarPages.isEmpty) {
          return;
        }
        final p = t.bottomBarPages.first;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scheduleMicrotask(() => context.go(p.path));
        });
      }
    });
  }

  @override
  void dispose() {
    _sub.close();
  }
}
