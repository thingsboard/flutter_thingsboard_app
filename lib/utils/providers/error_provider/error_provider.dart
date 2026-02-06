import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
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
    _overlayService.showErrorNotification((_) => tbError.message!);
  }

  String _getMessage(dynamic e, BuildContext context) {
    final message =
        e is ThingsboardError
            ? (e.message ?? S.of(context).unknownError)
            : S.of(context).unknownError;

    return '${S.of(context).fatalApplicationErrorOccurred}\n$message';
  }
  Future<void> onFatalError(dynamic e) async {
    await _overlayService.showAlertDialog(
      content:
          (context) => DialogContent(
            title: S.of(context).fatalError,
            message: _getMessage(e, context),
            ok: S.of(context).cancel,
          ),
    );
    ref.read(loginProvider.notifier).logout();
  }
}
