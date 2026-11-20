// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';

/// Android 13+ offers an app only the languages listed in its localeConfig,
/// in Android spelling.
void main() {
  // The app's code -> the Android one.
  const androidNames = {
    'no': 'nb',
    'pt': 'pt-BR',
    'nl_BE': 'nl-BE',
    'zh': 'zh-Hans',
    'zh_CN': 'zh-Hans',
    'zh_TW': 'zh-Hant',
  };

  test('the manifest points to the locale config', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml')
        .readAsStringSync();
    expect(manifest, contains('android:localeConfig="@xml/locales_config"'));
  });

  test('the locale config lists every app language', () {
    final config = File('android/app/src/main/res/xml/locales_config.xml')
        .readAsStringSync();
    final listed = RegExp('<locale android:name="([^"]+)"')
        .allMatches(config)
        .map((m) => m.group(1)!)
        .toSet();
    final expected = S.supportedLocales
        .map((l) => androidNames[l.toString()] ?? l.toString())
        .toSet();
    expect(listed, expected);
  });
}
