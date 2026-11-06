// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/providers/app_locale/app_locale_provider.dart';

void main() {
  test('English is the fallback for an untranslated device language', () {
    // Flutter falls back to the first supported locale (l10n.yaml).
    expect(S.supportedLocales.first, const Locale('en'));
  });

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
      expect(localeFromTbCode('zh_HK'), const Locale('zh'));
    });

    test('accepts language-only and BCP 47 codes', () {
      expect(localeFromTbCode('fr'), const Locale('fr'));
      expect(localeFromTbCode('es-ES'), const Locale('es'));
    });

    test('returns null for a language the app does not translate', () {
      expect(localeFromTbCode('uk_UA'), isNull);
      expect(localeFromTbCode(''), isNull);
      expect(localeFromTbCode(null), isNull);
    });
  });

  group('tbLocaleCode', () {
    test('gives the ThingsBoard code of an app language', () {
      expect(tbLocaleCode(const Locale('de')), 'de_DE');
      expect(tbLocaleCode(const Locale('en')), 'en_US');
      expect(tbLocaleCode(const Locale('zh', 'TW')), 'zh_TW');
    });

    test('round-trips every supported locale', () {
      for (final code in [
        'ar_AE', 'da_DK', 'de_DE', 'el_GR', 'en_US', 'es_ES', 'fr_FR', //
        'it_IT', 'nl_NL', 'no_NO', 'vi_VN', 'zh_CN', 'zh_TW',
      ]) {
        expect(tbLocaleCode(localeFromTbCode(code)!), code);
      }
    });
  });
}
