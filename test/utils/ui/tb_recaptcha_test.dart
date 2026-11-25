// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/tb_recaptcha.dart';

void main() {
  test('the reCAPTCHA page keeps the action name the sign-up page sends', () {
    final page = TbRecaptcha.fromQuery(const {
      'siteKey': 'key',
      'version': 'v3',
      'logActionName': 'signup',
    });

    expect(page.siteKey, 'key');
    expect(page.version, 'v3');
    expect(page.logActionName, 'signup');
  });

  test('a link without parameters gives empty values, not "null"', () {
    final page = TbRecaptcha.fromQuery(const {});

    expect(page.siteKey, isEmpty);
    expect(page.version, isEmpty);
    expect(page.logActionName, isNull);
  });
}
