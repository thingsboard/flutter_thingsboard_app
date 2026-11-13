// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/generated/l10n.dart';

void main() {
  // Arabic has a dual and a singular noun from 11 on, unlike =1/other.
  String ar(String Function(S s) message) =>
      Intl.withLocale('ar', () => message(lookupS(const Locale('ar'))))
          as String;

  test('counted Arabic messages use the dual and the 11+ singular', () {
    expect(ar((s) => s.deleteSelectedNotifications(2)), 'حذف إشعارين؟');
    expect(ar((s) => s.deleteSelectedNotifications(5)), 'حذف 5 إشعارات؟');
    expect(ar((s) => s.deleteSelectedNotifications(12)), 'حذف 12 إشعارًا؟');
    expect(ar((s) => s.failedToPerformOperation(2)), 'فشلت عمليتان');
    expect(ar((s) => s.resendCodeWait(30)), 'إعادة إرسال الرمز خلال 30 ثانية');
  });

  test('a customer title and address have different Arabic labels', () {
    final s = lookupS(const Locale('ar'));
    expect(s.title, isNot(s.address));
  });
}
