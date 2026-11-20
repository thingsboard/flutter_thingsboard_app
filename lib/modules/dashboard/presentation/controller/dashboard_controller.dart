// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/config/routes/router.dart';

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';

typedef DashboardTitleCallback = void Function(String title);

typedef DashboardControllerCallback = void Function(
  DashboardController controller,
  ValueNotifier<bool> loadingCtrl,
);

class DashboardController {
  DashboardController();

  final canGoBack = ValueNotifier(false);
  final hasRightLayout = ValueNotifier(false);
  final rightLayoutOpened = ValueNotifier(false);
  final TbLogger log = getIt();

  InAppWebViewController? controller;
  Map<String, dynamic>? _lastOpened;

  void setWebViewController(InAppWebViewController ctrl) {
    controller = ctrl;
  }

  bool get hasOpenedDashboard => _lastOpened != null;

  Future<void> openDashboard(
    String dashboardId, {
    String? state,
    bool? hideToolbar,
    bool fullscreen = false,
    bool home = false,
  }) async {
    final data = <String, dynamic>{'dashboardId': dashboardId};
    if (state != null) {
      data['state'] = state;
    }
    if (home) {
      data['embedded'] = true;
    }
    if (hideToolbar == true) {
      data['hideToolbar'] = true;
    }
    _lastOpened = data;
    await _postOpenDashboard(data);
  }

  /// Opens the last dashboard again in a web view that started over, in
  /// [state] when given. The web app reloads a dashboard only when it opened
  /// that same one last, so it has to learn which one is open.
  Future<void> reopenDashboard({String? state}) async {
    final last = _lastOpened;
    if (last == null) return;
    await _postOpenDashboard({...last, 'state': ?state});
  }

  Future<void> _postOpenDashboard(Map<String, dynamic> data) async {
    final windowMessage = {'type': 'openDashboardMessage', 'data': data};
    await controller?.postWebMessage(
      message: WebMessage(data: jsonEncode(windowMessage)),
      targetOrigin: WebUri('*'),
    );
  }

  Future<void> onHistoryUpdated(Future<bool> canGoBackFuture) async {
    canGoBack.value = await canGoBackFuture;
  }

  void onHasRightLayout(bool hasRightLayout) {
    this.hasRightLayout.value = hasRightLayout;
  }

  void onRightLayoutOpened(bool rightLayoutOpened) {
    this.rightLayoutOpened.value = rightLayoutOpened;
  }

  Future<void> toggleRightLayout() async {
    final windowMessage = <String, dynamic>{'type': 'toggleDashboardLayout'};
    final webMessage = WebMessage(data: jsonEncode(windowMessage));
    await controller?.postWebMessage(
      message: webMessage,
      targetOrigin: WebUri('*'),
    );
  }

  Future<void> tryLocalNavigation(String? path, {required bool? home}) async {
    log.debug('tryLocalNavigation($path)');

    if (path != null && path != '/home') {
      final parts = path
          .split('/')
          .where((e) => e.isNotEmpty && e != 'entities')
          .toList();
      if ([
        'profile',
        'devices',
        'assets',
        'dashboards',
        'dashboard',
        'customers',
        'auditLogs',
        'deviceGroups',
        'assetGroups',
        'customerGroups',
        'dashboardGroups',
        'alarms',
      ].contains(parts[0])) {
        var firstPart = parts[0];
        if (firstPart.endsWith('Groups')) {
          firstPart = firstPart.replaceFirst('Groups', 's');
        }

        if ((firstPart == 'dashboard' || firstPart == 'dashboards') &&
            parts.length > 1) {
          final dashboardId = parts[1];
          await getIt<ThingsboardAppRouter>().navigateToDashboard(dashboardId);
        } else if (firstPart != 'dashboard') {
          var targetPath = '/$firstPart';
          if (firstPart == 'devices' && home == true) {
            targetPath = '/devicesPage';
          }

          await getIt<ThingsboardAppRouter>().navigateTo(targetPath);
        }
      } else {
        throw UnimplementedError('The path $path is currently not supported.');
      }
    }
  }

  void dispose() {
    canGoBack.dispose();
    hasRightLayout.dispose();
    rightLayoutOpened.dispose();
    try {
      controller?.dispose();
    } catch (e) {
      log.error('Error during dispose: $e');
    }
  }
}
