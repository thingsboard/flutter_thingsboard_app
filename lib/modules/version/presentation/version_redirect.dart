// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/redirects/redirect.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/ui_utils_routes.dart';
import 'package:thingsboard_app/core/auth/login/models/version_info.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/version/application/i_version_service.dart';

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
    final versionInfo = VersionInfo.fromNullable(oauth.value?.versionInfo);
    if (versionInfo != null &&
        getIt<IVersionService>().appUpdateRequired(versionInfo)) {
      return LoginRoutes.login + LoginRoutes.updateRequired;
    }
    return null;
  }
}
