import 'package:flutter/material.dart';

class NavigationItemData {
  const NavigationItemData({
    required this.title,
    required this.icon,
    required this.path,
    this.id,
    this.showNotificationBadge = false,
  });

  final String title;
  final IconData icon;
  final String path;
  final String? id;
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
          showNotificationBadge == other.showNotificationBadge;

  @override
  int get hashCode =>
      title.hashCode ^
      icon.hashCode ^
      path.hashCode ^
      id.hashCode ^
      showNotificationBadge.hashCode;
}