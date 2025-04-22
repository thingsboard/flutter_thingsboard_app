import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/services/toast_notification/i_toast_notification_service.dart';

class ToastNotificationCubit extends Cubit<void> {
  ToastNotificationCubit(this.toastNotificationService) : super(null);

  final IToastNotificationService toastNotificationService;

  void showErrorNotification(String message, {Duration? duration}) =>
      toastNotificationService.showErrorNotification(
        message,
        duration: duration,
      );

  void showInfoNotification(String message, {Duration? duration}) =>
      toastNotificationService.showInfoNotification(
        message,
        duration: duration,
      );

  void showWarnNotification(String message, {Duration? duration}) =>
      toastNotificationService.showWarnNotification(
        message,
        duration: duration,
      );

  void showSuccessNotification(String message, {Duration? duration}) =>
      toastNotificationService.showSuccessNotification(
        message,
        duration: duration,
      );

  void hideNotifications() => toastNotificationService.hideNotifications();
}
