import 'package:thingsboard_app/utils/services/overlay_service/notification_type.dart';

abstract interface class IOverlayService {
  void hideNotification();
  void showNotification(
    String message,
    NotificationType type, {
    Duration? duration,
  });
  void showErrorNotification(
    String message, {
    Duration? duration,
  });
  void showInfoNotification(String message, {Duration? duration});
  void showWarnNotification(String message, {Duration? duration});
  void showSuccessNotification(String message, {Duration? duration});
}
