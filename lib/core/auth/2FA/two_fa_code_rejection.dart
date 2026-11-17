// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// Why the server did not accept a two-factor verification code.
enum TwoFaCodeRejection {
  sessionExpired,
  noConnection,
  invalid,
  tooManyRequests,
  other;

  static TwoFaCodeRejection of(ThingsboardError error) {
    if (error.errorCode == ThingsBoardErrorCode.jwtTokenExpired) {
      return sessionExpired;
    }
    if (Utils.isConnectionError(error)) {
      return noConnection;
    }
    return switch (error.status) {
      400 => invalid,
      429 => tooManyRequests,
      _ => other,
    };
  }
}

/// Says that the session expired and signs out with [logout]: the time allowed
/// for verification ran out, so only a new sign-in helps.
void reportSessionExpired(Future<void> Function() logout) {
  getIt<IOverlayService>().showErrorNotification(
    (context) => S.of(context).sessionExpired,
  );
  logout();
}

extension ShowCodeRejection on AbstractControl<Object?> {
  /// Shows why the code in this field was not accepted: in the field, or in
  /// the connection error dialog, which keeps the code for another try. An
  /// expired session is reported and ended with [logout].
  void showCodeRejection(
    Object error, {
    required Future<void> Function() logout,
  }) {
    // No setup call checks the server version today; this keeps a future
    // caller that does from showing the error in the field.
    if (getIt<ITbClientService>().reportUnsupportedServer(error)) {
      return;
    }
    final tbError = toThingsboardError(error);
    switch (TwoFaCodeRejection.of(tbError)) {
      case TwoFaCodeRejection.sessionExpired:
        reportSessionExpired(logout);
      case TwoFaCodeRejection.noConnection:
        getIt<IOverlayService>().showConnectionErrorDialog();
      case TwoFaCodeRejection.invalid:
        rejectCode(TbValicationMessages.invalidCode);
      case TwoFaCodeRejection.tooManyRequests:
        rejectCode(TbValicationMessages.tooManyRequests);
      case TwoFaCodeRejection.other:
        rejectCode(TbValicationMessages.rejected, message: tbError.message);
    }
  }
}
