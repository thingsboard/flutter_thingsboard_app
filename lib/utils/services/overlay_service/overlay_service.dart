import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:toastification/toastification.dart';

class OverlayService implements IOverlayService {
  @override
  void hideNotification() {
    toastification.dismissAll();
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
  final router = getIt<ThingsboardAppRouter>();
      final context = router.navigatorKey.currentContext!;
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
  void showErrorNotification(TranslationBuilder message, {Duration? duration}) {
    return showNotification(
      message,
      NotificationType.error,
      duration: duration,
    );
  }

  @override
  void showInfoNotification(TranslationBuilder message, {Duration? duration}) {
    showNotification(message, NotificationType.info, duration: duration);
  }

  @override
  void showWarnNotification(TranslationBuilder message, {Duration? duration}) {
    showNotification(message, NotificationType.warn, duration: duration);
  }
  @override
  void showSuccessNotification(TranslationBuilder message, {Duration? duration}) {
    showNotification(message, NotificationType.success, duration: duration);
  }

@override
  Future<bool?> showConfirmDialog({
     required TranslatedDialogBuilder content
  }) {
    
    return showTbDialog(content: content);
  }

 
  Future<bool?> showTbDialog(
      { required TranslatedDialogBuilder content
      }) {
  final router = getIt<ThingsboardAppRouter>();
      final context = router.navigatorKey.currentContext!;
      final data = content(context);
    return showDialog<bool>(
      context:   context,
      builder: (context) => AlertDialog(
        title: Text(data.title),
        content: Text(data.message),
        actions: [
          if(data.cancel != null)
          TextButton(
            onPressed: () => router.pop(false, context),
            child: Text(data.cancel!),
          ),
          TextButton(
              onPressed: () => router.pop(true, context),
              child: Text(data.ok)),
        ],
      ),
    );
      }


  @override
  Future<bool?> showAlertDialog(
      { required TranslatedDialogBuilder content
      }) async  {
    await showTbDialog(content: content);
    return null;
  }
}
