// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/details/alarm_details_widget.dart';

void main() {
  const duration = Duration(hours: 19, minutes: 8, seconds: 12);

  // The date symbols the app loads through flutter_localizations.
  setUpAll(() async {
    await GlobalMaterialLocalizations.delegate.load(const Locale('ar'));
    await GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  });

  String durationIn(String locale) => Intl.withLocale(
    locale,
    () => alarmDurationText(duration, lookupS(Locale(locale))),
  ) as String;

  test('the duration uses the digits of the start time', () {
    expect(durationIn('ar'), '١٩ ساعات ٨ دقائق ١٢ ثواني');
  });

  test('English keeps Western digits and leaves out zero days', () {
    expect(durationIn('en'), '19 hours 8 minutes 12 seconds');
  });
}
