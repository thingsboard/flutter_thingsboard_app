// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';

/// The page the app opens after sign-in.
@immutable
class HomeAfterSignIn {
  const HomeAfterSignIn({required this.path, this.dashboardOnTop});

  /// Where the app goes.
  final String path;

  /// A dashboard opened over [path], so Back leads to the main screen.
  final String? dashboardOnTop;

  @override
  bool operator ==(Object other) =>
      other is HomeAfterSignIn &&
      other.path == path &&
      other.dashboardOnTop == dashboardOnTop;

  @override
  int get hashCode => Object.hash(path, dashboardOnTop);

  @override
  String toString() =>
      'HomeAfterSignIn(path: $path, dashboardOnTop: $dashboardOnTop)';
}

/// Resolves the page to open after sign-in from the user's "Default
/// dashboard" and "Always fullscreen" settings (`defaultDashboardId`,
/// `defaultDashboardFullscreen` in the user's [additionalInfo]), as the web UI
/// does.
///
/// A public user always gets the default dashboard fullscreen. A default
/// dashboard that [canOpenDashboard] rejects is skipped. Without a default
/// dashboard the first tab ([homePath]) opens; returns null when there is
/// nothing to open.
Future<HomeAfterSignIn?> resolveHomeAfterSignIn({
  required String? homePath,
  required Map<String, Object?>? additionalInfo,
  required bool isPublic,
  required bool canReadDashboards,
  required Future<bool> Function(String dashboardId) canOpenDashboard,
}) async {
  final home = homePath == null ? null : HomeAfterSignIn(path: homePath);
  final dashboardId = additionalInfo?['defaultDashboardId']?.toString();
  if (dashboardId == null ||
      dashboardId.isEmpty ||
      !canReadDashboards ||
      !await canOpenDashboard(dashboardId)) {
    return home;
  }
  if (isPublic || additionalInfo?['defaultDashboardFullscreen'] == true) {
    return HomeAfterSignIn(
      path: '${DashboardRoutes.fullscreenDashboard}/$dashboardId',
    );
  }
  if (homePath == null) {
    return null;
  }
  return HomeAfterSignIn(path: homePath, dashboardOnTop: dashboardId);
}

/// Opens the page [resolveHomeAfterSignIn] picks for the signed-in user.
Future<void> openHomeAfterSignIn(BuildContext context, WidgetRef ref) async {
  final login = ref.read(loginProvider);
  final info = login.user?.additionalInfo;
  final client = getIt<ITbClientService>().client;
  final target = await resolveHomeAfterSignIn(
    homePath: ref.read(navigationProvider.notifier).resolveHomePath(),
    additionalInfo: info != null && info.isMap
        ? info.asMap.cast<String, Object?>()
        : null,
    isPublic: client.getAuthUser()?.isPublic ?? false,
    canReadDashboards: login.canReadDashboards,
    canOpenDashboard: _canOpenDashboard,
  );
  if (target == null ||
      !context.mounted ||
      !ref.read(loginProvider).isFullyAuthenticated()) {
    return;
  }
  final router = GoRouter.of(context);
  router.go(target.path);
  final dashboardId = target.dashboardOnTop;
  if (dashboardId == null) {
    return;
  }
  // A push made before the redirects of go() have run would replace it.
  if (await _arrivedAt(router, target.path)) {
    getIt<ThingsboardAppRouter>().navigateToDashboard(
      dashboardId,
      animate: false,
    );
  }
}

Future<bool> _canOpenDashboard(String dashboardId) async {
  try {
    await getIt<ITbClientService>().client
        .getDashboardControllerApi()
        .getDashboardInfoById(
          dashboardId: dashboardId,
          extra: silentRequestExtra(),
        );
    return true;
  } catch (_) {
    return false;
  }
}

Future<bool> _arrivedAt(GoRouter router, String path) async {
  final delegate = router.routerDelegate;
  final target = Uri.parse(path).path;
  bool arrived() => delegate.currentConfiguration.uri.path == target;
  if (arrived()) {
    return true;
  }
  final done = Completer<bool>();
  void onChange() {
    if (arrived() && !done.isCompleted) {
      done.complete(true);
    }
  }

  delegate.addListener(onChange);
  try {
    return await done.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () => false,
    );
  } finally {
    delegate.removeListener(onChange);
  }
}
