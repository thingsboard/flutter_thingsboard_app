import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/redirect/auth_redirect.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract class AuthorityRedirect extends Redirect {
  Authority get authority;
  String get path;
  @override
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    if (path == UiUtilsRoutes.qrCodeScan) {
      return null;
    }
    final login = ref.read(loginProvider);
    if (login.userScope == authority && !isLoginPath(state)) {
      return path;
    }
    return null;
  }
}
