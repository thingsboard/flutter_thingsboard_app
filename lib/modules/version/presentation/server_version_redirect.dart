// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

/// Holds the app on the server update page while the server is unsupported,
/// whatever flow (login, 2FA, QR code, OAuth, start-up) ran into it.
class ServerVersionRedirect implements Redirect {
  static const page = LoginRoutes.login + LoginRoutes.serverUpdateRequired;

  @override
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    final clientService = getIt<ITbClientService>();
    final unsupported = clientService.unsupportedServer.value != null;
    final onPage = state.fullPath == page;
    if (unsupported && !onPage) return page;
    if (!unsupported && onPage) return _leavePage(clientService, ref);
    return null;
  }

  /// A rolled back QR code switch keeps the session the app went back to.
  /// HomeHandler navigates only when a session becomes fully signed in, so
  /// the login page would wait for it forever.
  String _leavePage(ITbClientService clientService, Ref ref) {
    if (clientService.client.isAuthenticated() &&
        ref.read(loginProvider).isFullyAuthenticated()) {
      return ref.read(navigationProvider.notifier).resolveHomePath() ??
          LoginRoutes.login;
    }
    return LoginRoutes.login;
  }
}
