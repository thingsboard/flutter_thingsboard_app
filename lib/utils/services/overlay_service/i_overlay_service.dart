// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/translation_utils.dart';

abstract interface class IOverlayService {
  void hideNotification();

  Future<bool?> showAlertDialog({required TranslatedDialogBuilder content});
  Future<bool?> showConfirmDialog({required TranslatedDialogBuilder content});

  /// "Failed to connect to server", shown once however many requests fail.
  void showConnectionErrorDialog();

  /// The connection error for a caller that can retry; it replaces the plain
  /// [showConnectionErrorDialog] while it is on screen.
  Future<bool?> showConnectionErrorRetryDialog({
    required TranslatedDialogBuilder content,
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
    this.ok = 'OK',
    this.cancel,
  });
  final String title;
  final String message;
  final String ok;
  final String? cancel;
}
