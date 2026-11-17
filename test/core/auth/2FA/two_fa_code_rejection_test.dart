// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_code_rejection.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/connection_error.dart';

void main() {
  ThingsboardError answer(int status, String message) =>
      ThingsboardError(message: message, status: status);

  test('a code the server could not be asked about', () {
    expect(
      TwoFaCodeRejection.of(connectionError()),
      TwoFaCodeRejection.noConnection,
    );
  });

  test('a wrong code', () {
    expect(
      TwoFaCodeRejection.of(answer(400, 'Verification code is incorrect')),
      TwoFaCodeRejection.invalid,
    );
  });

  test('too many attempts', () {
    expect(
      TwoFaCodeRejection.of(answer(429, 'Too many requests')),
      TwoFaCodeRejection.tooManyRequests,
    );
  });

  test('any other answer keeps the server message', () {
    expect(
      TwoFaCodeRejection.of(answer(500, 'Unable to save the config')),
      TwoFaCodeRejection.other,
    );
    expect(
      TwoFaCodeRejection.of(answer(401, 'User account was locked')),
      TwoFaCodeRejection.other,
    );
  });
}
