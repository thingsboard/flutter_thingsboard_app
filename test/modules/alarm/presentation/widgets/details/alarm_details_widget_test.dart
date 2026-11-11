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
  // The date symbols the app loads through flutter_localizations.
  setUpAll(() async {
    await GlobalMaterialLocalizations.delegate.load(const Locale('ar'));
    await GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  });

  String durationIn(String locale, Duration duration) => Intl.withLocale(
    locale,
    () => alarmDurationText(duration, lookupS(Locale(locale))),
  ) as String;

  const duration = Duration(hours: 19, minutes: 8, seconds: 12);

  test('the duration uses the digits of the start time', () {
    expect(durationIn('ar', duration), '١٩ ساعة ٨ دقائق ١٢ ثانية');
  });

  test('English keeps Western digits and leaves out zero days', () {
    expect(durationIn('en', duration), '19 hours 8 minutes 12 seconds');
  });

  test('each unit takes the plural form of its number', () {
    const ones = Duration(days: 1, hours: 1, minutes: 1, seconds: 1);
    expect(durationIn('en', ones), '1 day 1 hour 1 minute 1 second');

    const twos = Duration(days: 2, hours: 2, minutes: 2, seconds: 2);
    expect(durationIn('ar', twos), 'يومان ساعتان دقيقتان ثانيتان');
  });
}
