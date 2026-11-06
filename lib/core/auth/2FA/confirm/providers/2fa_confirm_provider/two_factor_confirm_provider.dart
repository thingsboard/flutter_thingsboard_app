// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_confirm_state.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
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
    state = state.copyWith(loading: true);
    try {
      // Stores the session and loads the user; errors (e.g. 429) are handled
      // in-widget below instead of the global error overlay.
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
      if (toThingsboardError(e).status == 429) {
        state = state.copyWith(
          codeState: CodeState.tooManyRequests,
          loading: false,
        );
        return;
      }
      state = state.copyWith(codeState: CodeState.invalid);
      return;
    }
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
    } catch (_) {
      // The request is silent; without a sent code the resend timer never
      // starts, so the user can request the code again right away.
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
