// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';

class HomeHandler extends RouteHandler {
  late final ProviderSubscription<LoginState> _sub;
  VoidCallback? _stopWaitingForHome;

  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    _sub = ref.listenManual(loginProvider, (prev, next) {
      if (!next.isFullyAuthenticated()) {
        _cancelWaitForHome();
        return;
      }
      final path = GoRouterState.of(context).fullPath;
      if (prev?.isFullyAuthenticated() == false &&
          path != LoginRoutes.login + LoginRoutes.updateRequired) {
        final homePath = ref
            .read(navigationProvider.notifier)
            .resolveHomePath();
        if (homePath == null) {
          return;
        }
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scheduleMicrotask(() {
            final router = GoRouter.of(context)..go(homePath);
            _whenAt(router, homePath, getIt<NotificationService>().onHomeShown);
          });
        });
      }
    });
  }

  /// `go` lands later when a redirect is asynchronous, right away otherwise.
  /// A redirect may send the sign-in elsewhere (e.g. update required), so the
  /// wait also ends with the session or with the next sign-in.
  void _whenAt(GoRouter router, String path, VoidCallback onShown) {
    _cancelWaitForHome();
    bool isAt() => router.state.uri.path == Uri.parse(path).path;
    if (isAt()) {
      onShown();
      return;
    }
    void listener() {
      if (isAt()) {
        _cancelWaitForHome();
        onShown();
      }
    }

    router.routerDelegate.addListener(listener);
    _stopWaitingForHome = () => router.routerDelegate.removeListener(listener);
  }

  void _cancelWaitForHome() {
    _stopWaitingForHome?.call();
    _stopWaitingForHome = null;
  }

  @override
  void dispose() {
    _cancelWaitForHome();
    _sub.close();
  }
}
