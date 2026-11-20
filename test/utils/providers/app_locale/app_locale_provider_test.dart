// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/providers/app_locale/app_locale_provider.dart';

void main() {
  group('localeFromTbCode', () {
    test('maps a ThingsBoard code to the app language', () {
      expect(localeFromTbCode('de_DE'), const Locale('de'));
      expect(localeFromTbCode('en_US'), const Locale('en'));
      expect(localeFromTbCode('ar_AE'), const Locale('ar'));
      expect(localeFromTbCode('no_NO'), const Locale('no'));
    });

    test('keeps the Chinese regions apart', () {
      expect(localeFromTbCode('zh_CN'), const Locale('zh', 'CN'));
      expect(localeFromTbCode('zh_TW'), const Locale('zh', 'TW'));
      expect(localeFromTbCode('zh_HK'), const Locale('zh', 'TW'));
      expect(localeFromTbCode('zh_SG'), const Locale('zh'));
    });

    test('accepts language-only and BCP 47 codes', () {
      expect(localeFromTbCode('fr'), const Locale('fr'));
      expect(localeFromTbCode('es-ES'), const Locale('es'));
    });

    test('returns null for a language the app does not translate', () {
      expect(localeFromTbCode('sv_SE'), isNull);
      expect(localeFromTbCode(''), isNull);
      expect(localeFromTbCode(null), isNull);
    });
  });

  test('Norwegian Bokmål and Nynorsk use the Norwegian translation', () {
    expect(localeFromTbCode('nb_NO'), const Locale('no'));
    expect(
      resolveAppLocale(const [Locale('nb', 'NO')], S.supportedLocales),
      const Locale('no'),
    );
    expect(
      resolveAppLocale(const [Locale('nn')], S.supportedLocales),
      const Locale('no'),
    );
    expect(
      resolveAppLocale(const [Locale('sv', 'SE')], S.supportedLocales),
      const Locale('en'),
    );
    expect(
      resolveAppLocale(const [Locale('zh', 'TW')], S.supportedLocales),
      const Locale('zh', 'TW'),
    );
  });

  test('a Traditional Chinese device gets the Taiwan translation', () {
    expect(
      resolveAppLocale(const [
        Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'HK',
        ),
      ], S.supportedLocales),
      const Locale('zh', 'TW'),
    );
    expect(
      resolveAppLocale(const [Locale('zh', 'MO')], S.supportedLocales),
      const Locale('zh', 'TW'),
    );
    expect(
      resolveAppLocale(const [Locale('zh', 'SG')], S.supportedLocales),
      const Locale('zh'),
    );
    // An explicit Simplified script wins over a Traditional region, Taiwan
    // included (zh_TW is a supported locale, so Flutter would match it).
    for (final region in ['HK', 'MO', 'TW']) {
      expect(
        resolveAppLocale([
          Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans',
            countryCode: region,
          ),
        ], S.supportedLocales),
        const Locale('zh'),
        reason: 'zh-Hans-$region',
      );
    }
    expect(
      resolveAppLocale(const [
        Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hans',
          countryCode: 'CN',
        ),
      ], S.supportedLocales),
      const Locale('zh', 'CN'),
    );
  });

  test('an untranslated language falls back to English, not by region', () {
    expect(
      resolveAppLocale(const [Locale('sv', 'BE')], S.supportedLocales),
      const Locale('en'),
    );
    expect(
      resolveAppLocale(const [Locale('nl', 'BE')], S.supportedLocales),
      const Locale('nl', 'BE'),
    );
  });

  test('every supported language has a native name', () {
    for (final locale in S.supportedLocales) {
      expect(nativeLanguageName(locale), isNot(locale.toString()));
    }
    expect(nativeLanguageName(const Locale('no')), 'norsk');
  });

  group('tbLocaleCode', () {
    // Walks S.supportedLocales, so a new ARB without a _tbLocaleCodes entry
    // fails here instead of saving a bare `ll` code to the user's profile.
    test('round-trips every supported locale', () {
      for (final locale in S.supportedLocales) {
        final code = tbLocaleCode(locale);
        expect(
          code,
          matches(RegExp(r'^[a-z]{2}_[A-Z]{2}$')),
          reason: '$locale',
        );
        // Plain zh is stored as zh_CN, which resolves to the zh_CN locale.
        final back = locale == const Locale('zh')
            ? const Locale('zh', 'CN')
            : locale;
        expect(localeFromTbCode(code), back, reason: '$locale');
      }
    });
  });
}
