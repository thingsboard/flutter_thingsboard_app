// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'two_factor_confirm_state.freezed.dart';

enum CodeState { valid, invalid, tooManyRequests, empty }

@freezed
abstract class TwoFactorConfirmState with _$TwoFactorConfirmState {
  const factory TwoFactorConfirmState({
    required bool resendAvalible,
    required bool loading,
    required bool codeSent,
    required CodeState codeState,
  }) = _TwoFactorConfirmState;
}
