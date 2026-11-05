// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:toastification/toastification.dart';

class OverlayService implements IOverlayService {
  // An unreachable server fails every pending request at once, so only one
  // connection-error dialog is shown at a time. The retry one takes over from
  // the plain one: it is the dialog the user can act on.
  bool _connectionErrorShown = false;
  bool _connectionRetryShown = false;
  Route<bool>? _connectionErrorRoute;

  @override
  void hideNotification() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => toastification.dismissAll(),
    );
  }

  void showNotification(
    TranslationBuilder message,
    NotificationType type, {
    Duration? duration,
  }) {
    hideNotification();
    duration ??= const Duration(days: 1);
    Color backgroundColor;
    ToastificationType toastificationType;
    switch (type) {
      case NotificationType.info:
        backgroundColor = AppColors.notificationInfo;
        toastificationType = ToastificationType.info;
      case NotificationType.warn:
        backgroundColor = AppColors.notificationWarning;
        toastificationType = ToastificationType.warning;
      case NotificationType.success:
        backgroundColor = AppColors.notificationSuccess;
        toastificationType = ToastificationType.success;
      case NotificationType.error:
        backgroundColor = AppColors.notificationError;
        toastificationType = ToastificationType.error;
    }

    final context = globalNavigatorKey.currentContext!;
    final messageData = message(context);
    toastification.show(
      type: toastificationType,
      style: ToastificationStyle.fillColored,
      primaryColor: backgroundColor,
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: duration,
      title: Text(messageData, maxLines: 10, overflow: TextOverflow.ellipsis),
      closeOnClick: false,
      dragToClose: true,
      showProgressBar: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        ),
      ],
    );
  }

  @override
  void showErrorNotification(TranslationBuilder message, {Duration? duration = const Duration(seconds: 2)}) {
    return showNotification(
      message,
      NotificationType.error,
      duration: duration,
    );
  }

  @override
  void showInfoNotification(TranslationBuilder message, {Duration? duration = const Duration(seconds: 2)}) {
    showNotification(message, NotificationType.info, duration: duration);
  }

  @override
  void showWarnNotification(TranslationBuilder message, {Duration? duration = const Duration(seconds: 2)}) {
    showNotification(message, NotificationType.warn, duration: duration);
  }

  @override
  void showSuccessNotification(
    TranslationBuilder message, {
    Duration? duration = const Duration(seconds: 2),
  }) {
    showNotification(message, NotificationType.success, duration: duration);
  }

  /// Errors of the first requests at startup (e.g. loading the saved user
  /// while offline) arrive before the navigator is mounted.
  Future<BuildContext> _navigatorContext() async {
    var context = globalNavigatorKey.currentContext;
    while (context == null) {
      await WidgetsBinding.instance.endOfFrame;
      context = globalNavigatorKey.currentContext;
    }
    return context;
  }

  @override
  Future<bool?> showConfirmDialog({required TranslatedDialogBuilder content}) {
    return showTbDialog(content: content);
  }

  Future<bool?> showTbDialog({required TranslatedDialogBuilder content}) async {
    final context = await _navigatorContext();
    return _pushDialog(context, content);
  }

  /// What showDialog does, but the route is known once it is pushed, so the
  /// plain connection-error dialog can be removed.
  Future<bool?> _pushDialog(
    BuildContext context,
    TranslatedDialogBuilder content, {
    void Function(Route<bool> route)? onPush,
  }) {
    final data = content(context);
    final navigator = Navigator.of(context, rootNavigator: true);
    final route = DialogRoute<bool>(
      context: context,
      barrierColor:
          DialogTheme.of(context).barrierColor ??
          Theme.of(context).dialogTheme.barrierColor ??
          Colors.black54,
      themes: InheritedTheme.capture(from: context, to: navigator.context),
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      builder:
          (context) => AlertDialog(
            title: Text(data.title),
            content: Text(data.message),
            actions: [
              if (data.cancel != null)
                TextButton(
                  onPressed: () => context.pop(false),
                  child: Text(data.cancel!),
                ),
              TextButton(
                onPressed: () => context.pop(true),
                child: Text(data.ok),
              ),
            ],
          ),
    );
    onPush?.call(route);
    return navigator.push(route);
  }

  @override
  void showConnectionErrorDialog() {
    if (_connectionErrorShown || _connectionRetryShown) {
      return;
    }
    _connectionErrorShown = true;
    _navigatorContext().then((context) {
      // A retry dialog came up while waiting for the navigator.
      if (_connectionRetryShown) {
        _connectionErrorShown = false;
        return;
      }
      _pushDialog(
        context,
        (context) => DialogContent(
          title: S.of(context).connectionError,
          message: S.of(context).failedToConnectToServer,
        ),
        onPush: (route) => _connectionErrorRoute = route,
      ).whenComplete(() {
        _connectionErrorShown = false;
        _connectionErrorRoute = null;
      });
    });
  }

  @override
  Future<bool?> showConnectionErrorRetryDialog({
    required TranslatedDialogBuilder content,
  }) async {
    _connectionRetryShown = true;
    try {
      final context = await _navigatorContext();
      final plainDialog = _connectionErrorRoute;
      if (plainDialog != null && plainDialog.isActive) {
        // A removed route never completes its future: reset here.
        plainDialog.navigator?.removeRoute(plainDialog);
        _connectionErrorShown = false;
        _connectionErrorRoute = null;
      }
      return await _pushDialog(context, content);
    } finally {
      _connectionRetryShown = false;
    }
  }

  @override
  Future<bool?> showAlertDialog({
    required TranslatedDialogBuilder content,
  }) async {
    await showTbDialog(content: content);
    return null;
  }
}
