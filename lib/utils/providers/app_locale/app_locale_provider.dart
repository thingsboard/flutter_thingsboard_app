// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/generated/l10n.dart';

part 'app_locale_provider.g.dart';

/// The app language chosen by the user, or null to follow the device.
@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  @override
  Locale? build() => null;

  void set(Locale? locale) => state = locale;
}

/// ThingsBoard stores the user language as `ll_CC` (`de_DE`), one region per
/// language; the app translations are per language, apart from Chinese and
/// Belgian Dutch (`nl_BE`).
const _tbLocaleCodes = {
  'ar': 'ar_AE',
  'ca': 'ca_ES',
  'cs': 'cs_CZ',
  'da': 'da_DK',
  'de': 'de_DE',
  'el': 'el_GR',
  'en': 'en_US',
  'es': 'es_ES',
  'fr': 'fr_FR',
  'hi': 'hi_IN',
  'it': 'it_IT',
  'ja': 'ja_JP',
  'ka': 'ka_GE',
  'ko': 'ko_KR',
  'lt': 'lt_LT',
  'lv': 'lv_LV',
  'nl': 'nl_NL',
  'no': 'no_NO',
  'pl': 'pl_PL',
  'pt': 'pt_BR',
  'ro': 'ro_RO',
  'sl': 'sl_SI',
  'tr': 'tr_TR',
  'uk': 'uk_UA',
  'vi': 'vi_VN',
  'zh': 'zh_CN',
};

const _nativeLanguageNames = {
  'ar': 'العربية',
  'ca': 'català',
  'cs': 'čeština',
  'da': 'dansk',
  'de': 'Deutsch',
  'el': 'Ελληνικά',
  'en': 'English',
  'es': 'español',
  'fr': 'français',
  'hi': 'हिन्दी',
  'it': 'italiano',
  'ja': '日本語',
  'ka': 'ქართული',
  'ko': '한국어',
  'lt': 'lietuvių',
  'lv': 'latviešu',
  'nl': 'Nederlands',
  'nl_BE': 'Nederlands (België)',
  'no': 'norsk',
  'pl': 'polski',
  'pt': 'português (Brasil)',
  'ro': 'română',
  'sl': 'slovenščina',
  'tr': 'Türkçe',
  'uk': 'українська',
  'vi': 'Tiếng Việt',
  'zh': '中文',
  'zh_CN': '中文 (中国)',
  'zh_TW': '中文 (台湾)',
};

/// The name of an app language in that language.
String nativeLanguageName(Locale locale) =>
    _nativeLanguageNames[locale.toString()] ??
    _nativeLanguageNames[locale.languageCode] ??
    locale.toString();

/// The ThingsBoard language code for an app locale.
String tbLocaleCode(Locale locale) => locale.countryCode != null
    ? locale.toString()
    : _tbLocaleCodes[locale.languageCode] ?? locale.toString();

/// The app locale for a ThingsBoard language code, as the web UI resolves
/// it: the exact locale, else the same language; null when unsupported.
Locale? localeFromTbCode(String? code) {
  if (code == null || code.isEmpty) return null;
  final normalized = _traditionalChinese(code.replaceAll('-', '_'));
  final language = _languageAlias(normalized.split('_').first);
  return S.supportedLocales.firstWhereOrNull(
        (l) => l.toString() == normalized,
      ) ??
      S.supportedLocales.firstWhereOrNull(
        (l) => l.languageCode == language && l.countryCode == null,
      );
}

/// Norwegian devices report Bokmål (nb) or Nynorsk (nn); the app has one
/// Norwegian translation, 'no'.
String _languageAlias(String language) =>
    language == 'nb' || language == 'nn' ? 'no' : language;

/// Hong Kong and Macao write Traditional Chinese, as Taiwan does; the app has
/// one Traditional translation, `zh_TW` (plain `zh` is Simplified).
String _traditionalChinese(String code) =>
    code == 'zh_HK' || code == 'zh_MO' ? 'zh_TW' : code;

bool _isTraditionalChinese(Locale l) =>
    l.languageCode == 'zh' &&
    (l.scriptCode == 'Hant' || l.countryCode == 'HK' || l.countryCode == 'MO');

/// MaterialApp.localeListResolutionCallback: Flutter's default resolution
/// with the language aliases applied and Traditional Chinese sent to `zh_TW`.
Locale resolveAppLocale(
  List<Locale>? locales,
  Iterable<Locale> supportedLocales,
) => basicLocaleListResolution(
  locales
      ?.map(
        (l) => _isTraditionalChinese(l)
            ? const Locale('zh', 'TW')
            : Locale.fromSubtags(
                languageCode: _languageAlias(l.languageCode),
                scriptCode: l.scriptCode,
                countryCode: l.countryCode,
              ),
      )
      .toList(),
  supportedLocales,
);
