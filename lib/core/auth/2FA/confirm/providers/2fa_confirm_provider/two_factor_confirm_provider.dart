// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_confirm_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

part 'two_factor_confirm_provider.g.dart';

const defaultResendDurationSeconds = 45;

@riverpod
class TwoFactorConfirm extends _$TwoFactorConfirm {
  Timer? _resendTimer;
  late final int _resendTimerDurationSeconds;
  final _tbClient = getIt<ITbClientService>().client;

  @override
  TwoFactorConfirmState build(
    TwoFaProviderType type,
    int? resendTimerDurationSeconds,
  ) {
    _resendTimerDurationSeconds =
        resendTimerDurationSeconds ?? defaultResendDurationSeconds;
    ref.onDispose(() => _resendTimer?.cancel());
    return const TwoFactorConfirmState(
      codeSent: true,
      codeState: CodeState.empty,
      loading: false,
      resendAvalible: true,
    );
  }

  Future<void> verifyCode(String code) async {
    state = state.copyWith(
      loading: true,
      codeState: CodeState.empty,
      rejectionMessage: null,
    );
    try {
      // Stores the session and loads the user. Silent request:
      // _showRejection decides how each failure is shown.
      await _tbClient.checkTwoFaVerificationCode(
        type,
        code,
        requestConfig: RequestConfig(ignoreErrors: true, ignoreLoading: true),
      );
      state = state.copyWith(loading: false, codeState: CodeState.valid);
    } catch (e) {
      state = state.copyWith(loading: false);
      if (getIt<ITbClientService>().reportUnsupportedServer(e)) {
        return;
      }
      _showRejection(toThingsboardError(e));
    }
  }

  void _showRejection(ThingsboardError error) {
    if (error.errorCode == ThingsBoardErrorCode.jwtTokenExpired) {
      // The time allowed for verification ran out: only a new sign-in helps.
      getIt<IOverlayService>().showErrorNotification(
        (context) => S.of(context).sessionExpired,
      );
      ref.read(loginProvider.notifier).logout();
      return;
    }
    if (Utils.isConnectionError(error)) {
      getIt<IOverlayService>().showConnectionErrorDialog();
      state = state.copyWith(codeState: CodeState.empty);
      return;
    }
    state = switch (error.status) {
      400 => state.copyWith(codeState: CodeState.invalid),
      429 => state.copyWith(codeState: CodeState.tooManyRequests),
      _ => state.copyWith(
        codeState: CodeState.rejected,
        rejectionMessage: error.message,
      ),
    };
  }

  Future<void> sendCode() async {
    state = state.copyWith(codeSent: false, loading: true);
    var sent = false;
    try {
      await _tbClient
          .getTwoFactorAuthControllerApi()
          .requestTwoFaVerificationCode(
            providerType: type,
            extra: silentRequestExtra(),
          );
      _resendTimer?.cancel();
      _resendTimer = Timer(
        Duration(seconds: _resendTimerDurationSeconds),
        () => _activateResend(),
      );
      sent = true;
    } catch (e) {
      // The request is silent, so the reason is shown here (e.g. the server
      // cannot send email); without a sent code the resend timer never
      // starts, so the user can request the code again right away.
      if (!getIt<ITbClientService>().reportUnsupportedServer(e)) {
        getIt<IOverlayService>().showErrorNotification(
          toThingsboardError(e).getTranslatedMessage,
        );
      }
    }
    state = state.copyWith(
      codeSent: true,
      loading: false,
      resendAvalible: !sent,
    );
  }

  void _activateResend() {
    state = state.copyWith(resendAvalible: true);
  }
}
