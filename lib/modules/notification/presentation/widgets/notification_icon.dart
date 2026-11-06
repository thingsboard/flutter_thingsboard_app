// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart' hide Notification;
import 'package:thingsboard_app/utils/ui/material_icons.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key, required this.notification});

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    final config =
        notification.additionalConfig?.asMap['icon'] as Map<String, dynamic>? ??
        {};

    return Icon(
      toNotificationIconData(config['icon']?.toString()) ?? Icons.notifications,
      color: toNotificationIconColor(config['color']?.toString()),
    );
  }
}

IconData? toNotificationIconData(String? name) {
  if (name == null) {
    return null;
  }

  if (name.contains('mdi')) {
    // translate-me-ignore-next-line
    return mdiIconFromString(name.split('mdi:').last);
  }

  return materialIconsMap[name];
}

Color toNotificationIconColor(String? data) {
  if (data != null) {
    var hexColor = data.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else if (hexColor.length == 8) {
      final alpha = hexColor.substring(6, 8);
      hexColor = '$alpha${hexColor.substring(0, 6)}';
    }
    final value = int.tryParse(hexColor, radix: 16);
    if (value != null) {
      return Color(value);
    }
  }

  return Colors.black54;
}
