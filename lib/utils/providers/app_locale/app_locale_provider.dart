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
/// language; the app translations are per language, apart from Chinese.
const _tbLocaleCodes = {
  'ar': 'ar_AE',
  'da': 'da_DK',
  'de': 'de_DE',
  'el': 'el_GR',
  'en': 'en_US',
  'es': 'es_ES',
  'fr': 'fr_FR',
  'it': 'it_IT',
  'nl': 'nl_NL',
  'no': 'no_NO',
  'vi': 'vi_VN',
  'zh': 'zh_CN',
};

const _nativeLanguageNames = {
  'ar': 'العربية',
  'da': 'dansk',
  'de': 'Deutsch',
  'el': 'Ελληνικά',
  'en': 'English',
  'es': 'español',
  'fr': 'français',
  'it': 'italiano',
  'nl': 'Nederlands',
  'no': 'norsk',
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
  final normalized = code.replaceAll('-', '_');
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

/// MaterialApp.localeListResolutionCallback: Flutter's default resolution
/// with the language aliases applied.
Locale resolveAppLocale(
  List<Locale>? locales,
  Iterable<Locale> supportedLocales,
) => basicLocaleListResolution(
  locales
      ?.map(
        (l) => Locale.fromSubtags(
          languageCode: _languageAlias(l.languageCode),
          scriptCode: l.scriptCode,
          countryCode: l.countryCode,
        ),
      )
      .toList(),
  supportedLocales,
);
