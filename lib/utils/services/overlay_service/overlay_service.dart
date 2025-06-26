import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';
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
    duration ??= const Duration(days: 1);
    Color backgroundColor;
    ToastificationType toastificationType;
    switch (type) {
      case NotificationType.info:
        backgroundColor = const Color(0xFF323232);
        toastificationType = ToastificationType.info;
        break;
      case NotificationType.warn:
        backgroundColor = const Color(0xFFdc6d1b);
        toastificationType = ToastificationType.warning;
        break;
      case NotificationType.success:
        backgroundColor = const Color(0xFF008000);
        toastificationType = ToastificationType.success;
        break;
      case NotificationType.error:
        backgroundColor = const Color(0xFF800000);
        toastificationType = ToastificationType.error;
        break;
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
          spreadRadius: 0,
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
  void showSuccessNotification(String message, {Duration? duration}) {
    showNotification(message, NotificationType.success, duration: duration);
  }
  
}