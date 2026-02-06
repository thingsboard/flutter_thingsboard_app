import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/version_service/i_version_service.dart';

class VersionRedirect implements Redirect {
  @override
  Future<String?> redirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    final path = state.fullPath;
    if (path ==  UiUtilsRoutes.qrCodeScan) {
      return null;
    }
    final oauth = ref.read(oauthProvider);
    final versionInfo = oauth.value?.versionInfo;
    if (versionInfo != null) {
      if (getIt<IVersionService>().appUpdateRequired(versionInfo)) {
        return LoginRoutes.login + LoginRoutes.updateRequired;
      }
    }
    return null;
  }
}
