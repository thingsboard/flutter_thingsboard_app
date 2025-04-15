enum NotificationType { info, warn, success, error }

abstract interface class IToastNotificationService {
  void showErrorNotification(String message, {Duration? duration});

  void showInfoNotification(String message, {Duration? duration});

  void showWarnNotification(String message, {Duration? duration});

  void showSuccessNotification(String message, {Duration? duration});

  void hideNotifications();
}
