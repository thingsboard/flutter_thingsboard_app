// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// Why the server did not accept a two-factor verification code.
enum TwoFaCodeRejection {
  /// The server could not be reached.
  noConnection,

  /// The code is wrong (400).
  invalid,

  /// Too many attempts (429).
  tooManyRequests,

  /// Any other answer; its message says why.
  other;

  static TwoFaCodeRejection of(ThingsboardError error) {
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

extension ShowCodeRejection on AbstractControl<Object?> {
  /// Shows why the code in this field was not accepted: in the field, or in
  /// the connection error dialog, which keeps the code for another try.
  void showCodeRejection(Object error) {
    if (getIt<ITbClientService>().reportUnsupportedServer(error)) {
      return;
    }
    final tbError = toThingsboardError(error);
    switch (TwoFaCodeRejection.of(tbError)) {
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
