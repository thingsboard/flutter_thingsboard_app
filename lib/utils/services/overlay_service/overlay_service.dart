import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';
import 'package:thingsboard_app/utils/ui/tb_alert_dialog.dart';
import 'package:toastification/toastification.dart';

class OverlayService implements IOverlayService {
  @override
  void hideNotification() {
    toastification.dismissAll();
  }

  @override
  void showNotification(
    String message,
    NotificationType type, {
    Duration? duration,
  }) {
    hideNotification();
    duration ??= const Duration(days: 1);
    Color backgroundColor;
    ToastificationType toastificationType;
    switch (type) {
      case NotificationType.info:
        backgroundColor = const Color(0xFF323232);
        toastificationType = ToastificationType.info;
      case NotificationType.warn:
        backgroundColor = const Color(0xFFdc6d1b);
        toastificationType = ToastificationType.warning;
      case NotificationType.success:
        backgroundColor = const Color(0xFF008000);
        toastificationType = ToastificationType.success;
      case NotificationType.error:
        backgroundColor = const Color(0xFF800000);
        toastificationType = ToastificationType.error;
    }

    toastification.show(
      type: toastificationType,
      style: ToastificationStyle.fillColored,
      primaryColor: backgroundColor,
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: duration,
      title: Text(message, maxLines: 10, overflow: TextOverflow.ellipsis),
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
  void showErrorNotification(String message, {Duration? duration}) {
    return showNotification(
      message,
      NotificationType.error,
      duration: duration,
    );
  }

  @override
  void showInfoNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.info, duration: duration);
  }

  @override
  void showWarnNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.warn, duration: duration);
  }


@override
  Future<bool?> showConfirmDialog({
    required String title,
    required String message,
    String cancel = 'Cancel',
    String ok = 'Ok',
     BuildContext? context
  }) {
      final router = getIt<ThingsboardAppRouter>();
    return showDialog<bool>(
      context:  context ?? router.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => router.pop(false, context),
            child: Text(cancel),
          ),
          TextButton(
              onPressed: () => router.pop(true, context),
              child: Text(ok)),
        ],
      ),
    );
  }

  @override
  void showSuccessNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.success, duration: duration);
  }

  @override
  Future<bool?> showAlertDialog(
      {required String title,
      required String message,
      String ok = 'Ok',
      BuildContext? context
      }) {
    final router = getIt<ThingsboardAppRouter>();
    return showDialog<bool>(
      context:
          context ?? router.navigatorKey.currentContext!,
      builder: (context) => 
       TbAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => router.pop(null, context),
            child: Text(ok),
          ),
        ],
      ),
    );
  }
}
