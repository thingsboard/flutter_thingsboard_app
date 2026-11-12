// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/noauth_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/register_routes.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

/// Query parameter [ThingsboardAppRouter.navigateByAppLink] adds to carry the
/// whole scanned link; routes read it back from `state.uri.queryParameters`.
const appLinkUriQueryParam = 'uri';

const _appLinkPaths = {
  noAuthPath,
  LoginRoutes.login,
  RegisterRoutes.emailVerified,
};

class ThingsboardAppRouter {
  ThingsboardAppRouter({required this.overlayService});

  final IOverlayService overlayService;
  final TbLogger log = getIt<TbLogger>();

  BuildContext? get context => globalNavigatorKey.currentContext;
  Future<T?> navigateTo<T>(String path, {RouteSettings? routeSettings}) async {
    overlayService.hideNotification();
    final mapArgs = routeSettings?.arguments as Map<String, dynamic>?;
    String query = '';
    if (mapArgs != null) {
      // Percent-encoded: values can carry '&' and '=' themselves (an app link
      // passed along as `appLinkUriQueryParam` always does).
      query = Uri(
        queryParameters: mapArgs.map((key, value) => MapEntry(key, '$value')),
      ).query;
    }
    final result = await context?.push(
      '$path${query.isEmpty ? query : '?$query'}',
    );
    return result as T?;
  }

  /// For pages that must not take their data from a link's query.
  Future<T?> push<T>(String path, {required Object extra}) async {
    overlayService.hideNotification();
    return await context?.push<T>(path, extra: extra);
  }

  Future<void> pop<T>([T? result, BuildContext? context]) async {
    final targetContext = context ?? this.context;

    targetContext?.pop<T>(result);
  }

  Future<void> navigateToDashboard(
    String dashboardId, {
    String? dashboardTitle,
    String? state,
    bool? hideToolbar,
    bool animate = true,
  }) async {
    context?.push(
      '/dashboard',
      extra: DashboardArgumentsEntity(
        id: dashboardId,
        title: dashboardTitle,
        state: state,
        hideToolbar: hideToolbar,
        animate: animate,
      ),
    );
  }

  /// A link from outside the app or the in-app QR scanner: only the pages in
  /// [_appLinkPaths] open, anything else is ignored.
  Future<void> navigateByAppLink(String? link) async {
    if (link != null) {
      final uri = Uri.parse(link);
      await getIt<ILocalDatabaseService>().deleteInitialAppLink();
      if (!_appLinkPaths.contains(uri.path)) {
        log.debug('TbContext: app link to ${uri.path} ignored');
        return;
      }
      // The login page would wait for a sign-in that already happened.
      if (uri.path == LoginRoutes.login && _hasFullSession()) {
        log.debug('TbContext: app link to ${uri.path} ignored, signed in');
        return;
      }
      log.debug('TbContext: navigate by appLink $uri');
      navigateTo(
        uri.path,
        routeSettings: RouteSettings(
          arguments: {...uri.queryParameters, appLinkUriQueryParam: uri},
        ),
      );
    }
  }

  bool _hasFullSession() =>
      getIt<ITbClientService>().client.getAuthUser()?.isFullSession() ?? false;
}
