
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/noauth_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';

bool isLoginPath(GoRouterState state) {
  return state.uri.pathSegments.contains('login');
}

class AuthRedirect implements Redirect {
  @override
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    final login = ref.read(loginProvider);
    final path = state.fullPath;

    if (path == LoginRoutes.login + LoginRoutes.mfaConfigure) {
      return null;
    }
    if (path == UiUtilsRoutes.qrCodeScan) {
      return null;
    }
    if (path == noAuthPath) {
      return null;
    }
final loginPath= isLoginPath(state);
    if (!login.isUserLoaded && !loginPath) {
      return '/login${path?.isEmpty == true ? '' : '?redirect=$path'}';
    }

    // if (login.isUserLoaded &&
    //     ![
    //       Authority.PRE_VERIFICATION_TOKEN,
    //       Authority.MFA_CONFIGURATION_TOKEN,
    //     ].contains(login.userScope) &&
    //     isLoginPath(state)) {
    //   final redirect = state.uri.queryParameters['ridirect'];
    //   if (redirect != null && redirect.isNotEmpty) {
    //     return redirect;
    //   }
    //   return '/home';
    // }
    return null;
  }
}
