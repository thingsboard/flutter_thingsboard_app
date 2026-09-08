import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';

class HomeHandler extends RouteHandler {
  late final ProviderSubscription<LoginState> _sub;

  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    _sub = ref.listenManual(loginProvider, (prev, next) {
      final path = GoRouterState.of(context).fullPath;
      if (next.isFullyAuthenticated() &&
          prev?.isFullyAuthenticated() == false &&
          path != LoginRoutes.login + LoginRoutes.updateRequired) {
        final homePath =
            ref.read(navigationProvider.notifier).resolveHomePath();
        if (homePath == null) {
          return;
        }
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scheduleMicrotask(() => context.go(homePath));
        });
      }
    });
  }

  @override
  void dispose() {
    _sub.close();
  }
}
