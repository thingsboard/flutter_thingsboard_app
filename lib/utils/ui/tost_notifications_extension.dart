import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:thingsboard_app/core/notifications/toast_notification_cubit.dart';

extension ToastNotificationExtension on BuildContext {
  void showErrorNotification(String message, {Duration? duration}) =>
      read<ToastNotificationCubit>().showErrorNotification(
        message,
        duration: duration,
      );

  void showInfoNotification(String message, {Duration? duration}) =>
      read<ToastNotificationCubit>().showInfoNotification(
        message,
        duration: duration,
      );

  void showWarnNotification(String message, {Duration? duration}) =>
      read<ToastNotificationCubit>().showWarnNotification(
        message,
        duration: duration,
      );

  void showSuccessNotification(String message, {Duration? duration}) =>
      read<ToastNotificationCubit>().showSuccessNotification(
        message,
        duration: duration,
      );

  void hideNotifications() =>
      read<ToastNotificationCubit>().hideNotifications();
}
