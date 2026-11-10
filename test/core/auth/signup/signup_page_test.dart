// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/signup/signup_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

FormControl<String> _control(SignUpFieldId id, String? value) => FormControl(
  value: value,
  validators: signUpFieldValidators(
    SignUpField(
      (b) => b
        ..id = id
        ..label = id.name
        ..required_ = true,
    ),
  ),
);

void main() {
  test('the email field rejects a malformed address', () {
    expect(
      _control(SignUpFieldId.EMAIL, 'bad@').errors,
      contains(ValidationMessage.email),
    );
    expect(_control(SignUpFieldId.EMAIL, 'user@example.com').valid, isTrue);
  });

  test('other text fields take any text', () {
    expect(_control(SignUpFieldId.FIRST_NAME, 'bad@').valid, isTrue);
  });

  test('a required field rejects an empty value', () {
    expect(
      _control(SignUpFieldId.EMAIL, null).errors,
      contains(ValidationMessage.required),
    );
  });

  test('passwords need at least 6 characters', () {
    for (final id in [SignUpFieldId.PASSWORD, SignUpFieldId.REPEAT_PASSWORD]) {
      expect(
        _control(id, 'abcde').errors,
        contains(ValidationMessage.minLength),
      );
      expect(_control(id, 'abcdef').valid, isTrue);
    }
  });
}
