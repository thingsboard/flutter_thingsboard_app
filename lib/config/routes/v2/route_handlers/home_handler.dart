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
import 'package:thingsboard_app/modules/main/presentation/home_after_sign_in.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';

class HomeHandler extends RouteHandler {
  late final ProviderSubscription<LoginState> _sub;

  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    _sub = ref.listenManual(loginProvider, (prev, next) {
      if (!next.isFullyAuthenticated()) {
        cancelOpenHomeAfterSignIn();
        return;
      }
      final path = GoRouterState.of(context).fullPath;
      if (prev?.isFullyAuthenticated() == false &&
          path != LoginRoutes.login + LoginRoutes.updateRequired) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scheduleMicrotask(
            () => openHomeAfterSignIn(
              context,
              ref,
              onShown: getIt<NotificationService>().onHomeShown,
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    cancelOpenHomeAfterSignIn();
    _sub.close();
  }
}
