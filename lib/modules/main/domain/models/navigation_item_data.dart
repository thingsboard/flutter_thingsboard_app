// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class NavigationItemData {
  const NavigationItemData({
    required this.title,
    required this.icon,
    required this.path,
    this.id,
    this.label,
    this.showNotificationBadge = false,
  });

  final String title;
  final IconData icon;
  final String path;
  final String? id;

  /// Non-blank title given to the page in the mobile bundle layout. Null when
  /// the page keeps its default title, which is then localized on display.
  final String? label;
  final bool showNotificationBadge;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationItemData &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          icon == other.icon &&
          path == other.path &&
          id == other.id &&
          label == other.label &&
          showNotificationBadge == other.showNotificationBadge;

  @override
  int get hashCode =>
      title.hashCode ^
      icon.hashCode ^
      path.hashCode ^
      id.hashCode ^
      label.hashCode ^
      showNotificationBadge.hashCode;
}
