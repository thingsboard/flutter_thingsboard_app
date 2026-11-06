// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/notification/presentation/widgets/notification_icon.dart';
import 'package:thingsboard_app/utils/ui/material_icons.dart';
import 'package:thingsboard_app/utils/ui/mdi_icons.g.dart';

void main() {
  group('toNotificationIconData', () {
    test('resolves material icon names', () {
      expect(toNotificationIconData('warning'), isNotNull);
      expect(
        toNotificationIconData('notifications'),
        equals(materialIconsMap['notifications']),
      );
    });

    test('resolves mdi icon names, hyphenated web names included', () {
      expect(toNotificationIconData('mdi:bell'), mdiIcons['bell']);
      // The iOS extension ports this camelCase mapping; see icon_map.json.
      expect(toNotificationIconData('mdi:ab-testing'), mdiIcons['abtesting']);
    });

    test('returns null for unknown or missing names', () {
      expect(toNotificationIconData(null), isNull);
      expect(toNotificationIconData('no_such_icon_name'), isNull);
    });
  });

  group('toNotificationIconColor', () {
    test('parses 6-digit hex colors', () {
      expect(
        toNotificationIconColor('#F44336'),
        equals(const Color(0xFFF44336)),
      );
    });

    test('parses 8-digit hex colors with alpha as the last byte', () {
      expect(
        toNotificationIconColor('#F4433680'),
        equals(const Color(0x80F44336)),
      );
    });

    test('falls back to black54 on missing or invalid input', () {
      expect(toNotificationIconColor(null), equals(Colors.black54));
      expect(toNotificationIconColor('not-a-color'), equals(Colors.black54));
    });
  });
}
