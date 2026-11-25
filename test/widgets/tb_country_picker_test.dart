// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_country_picker.dart';

void main() {
  Future<String> displayName(
    WidgetTester tester,
    Locale locale,
    IsoCode isoCode,
  ) async {
    late String name;
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: const [
          ...S.localizationsDelegates,
          CountryNamesDelegate(),
        ],
        supportedLocales: S.supportedLocales,
        home: Builder(
          builder: (context) {
            name = countryDisplayName(context, isoCode);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    return name;
  }

  testWidgets('shows the flag and the name in the app language', (
    tester,
  ) async {
    expect(
      await displayName(tester, const Locale('en'), IsoCode.UA),
      '🇺🇦 Ukraine',
    );
    expect(
      await displayName(tester, const Locale('de'), IsoCode.DE),
      '🇩🇪 Deutschland',
    );
  });

  testWidgets('Norwegian uses the Bokmål names', (tester) async {
    expect(
      await displayName(tester, const Locale('no'), IsoCode.NO),
      '🇳🇴 Norge',
    );
  });

  testWidgets('falls back to English names', (tester) async {
    expect(
      await displayName(tester, const Locale('da'), IsoCode.US),
      '🇺🇸 United States',
    );
  });
}
