// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'error_provider.g.dart';

@riverpod
class Error extends _$Error {
  final TbLogger _log = getIt();
  final IOverlayService _overlayService = getIt();
  @override
  void build() {
    return;
  }

  void onError(ThingsboardError tbError) {
    _log.error('onError', tbError, tbError.getStackTrace());
    _overlayService.showErrorNotification(tbError.getTranslatedMessage);
  }

  Future<void> onFatalError(dynamic e) async {
    await _overlayService.showAlertDialog(
      content: (context) => fatalErrorDialogContent(context, e),
    );
    ref.read(loginProvider.notifier).logout();
  }
}
