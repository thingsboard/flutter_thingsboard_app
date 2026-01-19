import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:toastification/toastification.dart';

class OverlayService implements IOverlayService {
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

  @override
  Future<bool?> showConfirmDialog({required TranslatedDialogBuilder content}) {
    return showTbDialog(content: content);
  }

  Future<bool?> showTbDialog({required TranslatedDialogBuilder content}) {
    final context = globalNavigatorKey.currentContext!;
    final data = content(context);
    return showDialog<bool>(
      context: context,
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
  }

  @override
  Future<bool?> showAlertDialog({
    required TranslatedDialogBuilder content,
  }) async {
    await showTbDialog(content: content);
    return null;
  }
}
