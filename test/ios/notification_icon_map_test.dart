// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/material_icons.dart';
import 'package:thingsboard_app/utils/ui/mdi_icons.g.dart';

/// The iOS notification service extension ships a JSON copy of the Dart icon
/// maps; this keeps it in sync. Regenerate the copy with:
///
///     flutter test --update-goldens test/ios/notification_icon_map_test.dart
void main() {
  test('icon_map.json matches the Dart icon maps', () {
    final file = File('ios/NotificationServiceExtension/icon_map.json');
    final expected = {
      'material': _codepoints(materialIconsMap),
      'mdi': _codepoints(mdiIcons),
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
