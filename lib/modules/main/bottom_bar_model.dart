import 'package:flutter/material.dart';

enum BottomBarType { page, dashboard }

class BottomBarModel {
  const BottomBarModel({
    required this.label,
    required this.icon,
    required this.type,
    required this.data,
  });

  final String label;
  final Widget icon;
  final BottomBarType type;
  final Map<String, dynamic> data;
}
