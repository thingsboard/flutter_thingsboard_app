
import 'package:thingsboard_app/utils/translation_utils.dart';

abstract interface class IOverlayService {
  void hideNotification();

  Future<bool?> showAlertDialog({
      required TranslatedDialogBuilder content
  });
  Future<bool?> showConfirmDialog({
    required TranslatedDialogBuilder content
  });
    void showErrorNotification(
    TranslationBuilder tranlatedMessage, {
    Duration? duration,
  });
  void showInfoNotification(TranslationBuilder message, {Duration? duration});
  void showWarnNotification(TranslationBuilder message, {Duration? duration});
  void showSuccessNotification(
    TranslationBuilder message, {
    Duration? duration,
  });
}


class DialogContent {
  DialogContent({
    required this.title,
    required this.message,
    required this.ok,
     this.cancel,
  });
  final String title;
  final String message;
  final String ok;
  final String? cancel;
}
