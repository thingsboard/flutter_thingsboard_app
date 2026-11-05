// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
import 'package:thingsboard_app/utils/ui/material_icons.dart';

/// The iOS notification service extension cannot read the Dart icon maps, so
/// it ships a JSON copy of them. This keeps that copy in sync: a package
/// upgrade or a map edit that moves a codepoint fails here instead of silently
/// dropping icons from iOS notifications. Regenerate the copy with:
///
///     flutter test --update-goldens test/ios/notification_icon_map_test.dart
void main() {
  test('icon_map.json matches the Dart icon maps', () {
    final file = File('ios/NotificationServiceExtension/icon_map.json');
    final expected = {
      'material': _codepoints(materialIconsMap),
      'mdi': _codepoints(iconMap),
    };

    if (autoUpdateGoldenFiles) {
      file.writeAsStringSync(json.encode(expected));
      return;
    }

    expect(json.decode(file.readAsStringSync()), expected);
  });
}

Map<String, int> _codepoints(Map<String, IconData> icons) => {
  for (final name in icons.keys.toList()..sort()) name: icons[name]!.codePoint,
};
