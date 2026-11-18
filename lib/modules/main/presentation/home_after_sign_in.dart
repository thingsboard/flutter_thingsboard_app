// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/entites/dashboard_arguments.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// [path] is where the app goes; [dashboardOnTop] opens over it, so Back
/// leads to the main screen.
typedef HomeAfterSignIn = ({String path, String? dashboardOnTop});

const _dashboardCheckTimeout = Duration(seconds: 5);

/// Picks the page to open after sign-in from the user's `defaultDashboardId`
/// and `defaultDashboardFullscreen`, as the web UI does; null when there is
/// nothing to open.
Future<HomeAfterSignIn?> resolveHomeAfterSignIn({
  required String? homePath,
  required Map<String, Object?>? additionalInfo,
  required bool canReadDashboards,
  required Future<bool> Function(String dashboardId) canOpenDashboard,
}) async {
  final HomeAfterSignIn? home = homePath == null
      ? null
      : (path: homePath, dashboardOnTop: null);
  final dashboardId = additionalInfo?['defaultDashboardId']?.toString();
  if (dashboardId == null ||
      dashboardId.isEmpty ||
      !canReadDashboards ||
      !await canOpenDashboard(dashboardId)) {
    return home;
  }
  if (additionalInfo?['defaultDashboardFullscreen'] == true) {
    return (
      path: '${DashboardRoutes.fullscreenDashboard}/$dashboardId',
      dashboardOnTop: null,
    );
  }
  if (homePath == null) {
    return null;
  }
  return (path: homePath, dashboardOnTop: dashboardId);
}

int _openRun = 0;

/// Stops an [openHomeAfterSignIn] that has not finished, e.g. at sign-out.
void cancelOpenHomeAfterSignIn() => _openRun++;

/// Opens the page [resolveHomeAfterSignIn] picks and calls [onShown] once it
/// is in place, the dashboard over it included. Returns false when there is
/// nothing to open.
Future<bool> openHomeAfterSignIn(
  BuildContext context,
  WidgetRef ref, {
  VoidCallback? onShown,
}) async {
  final run = ++_openRun;
  final login = ref.read(loginProvider);
  final info = login.user?.additionalInfo;
  final target = await resolveHomeAfterSignIn(
    homePath: ref.read(navigationProvider.notifier).resolveHomePath(),
    additionalInfo: info != null && info.isMap
        ? info.asMap.cast<String, Object?>()
        : null,
    canReadDashboards: login.canReadDashboards,
    canOpenDashboard: _canOpenDashboard,
  );
  if (target == null) {
    return false;
  }
  if (run == _openRun &&
      context.mounted &&
      ref.read(loginProvider).isFullyAuthenticated()) {
    await showHomeAfterSignIn(
      GoRouter.of(context),
      target,
      isCurrent: () => run == _openRun,
      onShown: onShown,
    );
  }
  return true;
}

/// Goes to [target] and calls [onShown] once it is in place. Stops when
/// [isCurrent] turns false before that.
@visibleForTesting
Future<void> showHomeAfterSignIn(
  GoRouter router,
  HomeAfterSignIn target, {
  required bool Function() isCurrent,
  VoidCallback? onShown,
}) async {
  router.go(target.path);
  // A redirect may be asynchronous, and a push made before go() lands is
  // based on the old stack, which then replaces the new one.
  if (!await whenRouterAt(router, target.path, isCurrent: isCurrent)) {
    return;
  }
  final dashboardId = target.dashboardOnTop;
  if (dashboardId != null) {
    router.push(
      DashboardRoutes.dashboard,
      extra: DashboardArgumentsEntity(id: dashboardId, animate: false),
    );
    if (!await whenRouterAt(
      router,
      DashboardRoutes.dashboard,
      isCurrent: isCurrent,
    )) {
      return;
    }
  }
  onShown?.call();
}

/// Completes with true once [router] is at [path], or with false once
/// [isCurrent] is false at a route change before that.
@visibleForTesting
Future<bool> whenRouterAt(
  GoRouter router,
  String path, {
  required bool Function() isCurrent,
}) {
  final target = Uri.parse(path).path;
  bool isAt() => router.state.uri.path == target;
  if (!isCurrent()) {
    return Future.value(false);
  }
  if (isAt()) {
    return Future.value(true);
  }
  final arrived = Completer<bool>();
  void onChange() {
    if (arrived.isCompleted) {
      return;
    }
    if (!isCurrent()) {
      arrived.complete(false);
    } else if (isAt()) {
      arrived.complete(true);
    }
  }

  router.routerDelegate.addListener(onChange);
  return arrived.future.whenComplete(
    () => router.routerDelegate.removeListener(onChange),
  );
}

/// Only a dashboard the server reports as missing or forbidden is skipped:
/// after any other failure the dashboard opens and shows its own error.
Future<bool> _canOpenDashboard(String dashboardId) async {
  try {
    await getIt<ITbClientService>().client
        .getDashboardControllerApi()
        .getDashboardInfoById(
          dashboardId: dashboardId,
          extra: silentRequestExtra(),
        )
        .timeout(_dashboardCheckTimeout);
    return true;
  } catch (e) {
    if (e is! TimeoutException) {
      final error = toThingsboardError(e);
      if (error.status == 403 ||
          error.status == 404 ||
          error.errorCode == ThingsBoardErrorCode.permissionDenied ||
          error.errorCode == ThingsBoardErrorCode.itemNotFound) {
        return false;
      }
    }
    getIt<TbLogger>().warn(
      'Could not check the default dashboard $dashboardId, opening it anyway',
      e,
    );
    return true;
  }
}
