// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/time_ago.dart';

void main() {
  Future<String> format(
    WidgetTester tester,
    Locale locale, {
    bool short = false,
  }) async {
    late String text;
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        supportedLocales: S.supportedLocales,
        localizationsDelegates: S.localizationsDelegates,
        home: Builder(
          builder: (context) {
            text = timeAgo(
              context,
              DateTime.now().subtract(const Duration(minutes: 5)),
              short: short,
            );
            return const SizedBox();
          },
        ),
      ),
    );
    return text;
  }

  testWidgets('in the app language', (tester) async {
    expect(await format(tester, const Locale('en')), '5 minutes ago');
    expect(await format(tester, const Locale('de')), 'vor 5 Minuten');
    expect(await format(tester, const Locale('ar')), 'منذ 5 دقائق');
    expect(await format(tester, const Locale('zh', 'CN')), '5 分 前');
  });

  testWidgets('the short form', (tester) async {
    expect(await format(tester, const Locale('en'), short: true), '5m');
    expect(
      await format(tester, const Locale('fr'), short: true),
      'il y a 5 minutes',
    );
  });

  testWidgets('every app language but the ones timeago lacks', (tester) async {
    final english = await format(tester, const Locale('en'));
    const withoutMessages = {'en', 'ka', 'lt', 'sl'};
    for (final locale in S.supportedLocales) {
      final text = await format(tester, locale);
      if (withoutMessages.contains(locale.languageCode)) {
        expect(text, english, reason: '$locale');
      } else {
        expect(text, isNot(english), reason: '$locale');
      }
    }
  });

  testWidgets('the new languages and plain Chinese', (tester) async {
    expect(await format(tester, const Locale('uk')), '5 хвилин тому');
    expect(await format(tester, const Locale('pt')), 'há 5 minutos');
    expect(await format(tester, const Locale('zh')), '5 分 前');
  });
}
