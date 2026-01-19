import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_confirm_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

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
      final res = await _tbClient.checkTwoFaVerificationCode(
        type,
        code,
        requestConfig: RequestConfig(ignoreErrors: true),
      );
      await ref.read(loginProvider.notifier).twoFaConfirmed(res);
      state = state.copyWith(loading: false, codeState: CodeState.valid);
    } catch (e) {
      state = state.copyWith(loading: false);
      if (e is ThingsboardError) {
        if (e.status == 429) {
          state = state.copyWith(
            codeState: CodeState.tooManyRequests,
            loading: false,
          );
          return;
        }
      }
      state = state.copyWith(codeState: CodeState.invalid);
      return;
    }
  }

  Future<void> sendCode() async {
    state = state.copyWith(codeSent: false, loading: true);
    try {
      await _tbClient.getTwoFactorAuthService().requestTwoFaVerificationCode(
        type,
        requestConfig: RequestConfig(ignoreErrors: true),
      );
      _resendTimer?.cancel();
      _resendTimer = Timer(
        Duration(seconds: _resendTimerDurationSeconds),
        () => _activateResend(),
      );
    } catch (e) {}
    state = state.copyWith(
      codeSent: true,
      loading: false,
      resendAvalible: false,
    );
  }

  void _activateResend() {
    state = state.copyWith(resendAvalible: true);
  }
}
