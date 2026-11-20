// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';

/// iOS offers an app only the languages listed in CFBundleLocalizations, and
/// debug and release builds use separate files: both must list every app
/// language, in iOS spelling.
void main() {
  List<String> localizations(String name) {
    final plist = File('ios/Runner/$name').readAsStringSync();
    final array = RegExp(
      r'<key>CFBundleLocalizations</key>\s*<array>([\s\S]*?)</array>',
    ).firstMatch(plist)!.group(1)!;
    return RegExp('<string>([^<]+)</string>')
        .allMatches(array)
        .map((m) => m.group(1)!)
        .toList();
  }

  // The app's code -> the iOS one; plain zh is covered by zh-Hans.
  const iosNames = {
    'no': 'nb',
    'pt': 'pt-BR',
    'nl_BE': 'nl-BE',
    'zh_CN': 'zh-Hans',
    'zh_TW': 'zh-Hant',
  };

  test('both plists list the same languages', () {
    expect(
      localizations('Info-Debug.plist').toSet(),
      localizations('Info-Release.plist').toSet(),
    );
  });

  test('the plists list every app language', () {
    final expected = S.supportedLocales
        .where((l) => l.toString() != 'zh')
        .map((l) => iosNames[l.toString()] ?? l.toString())
        .toSet();
    expect(localizations('Info-Release.plist').toSet(), expected);
  });
}
