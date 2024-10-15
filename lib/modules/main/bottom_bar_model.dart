import 'package:flutter/material.dart';

class BottomBarModel {
  const BottomBarModel({
    required this.label,
    required this.icon,
    required this.data,
  });

  final String label;
  final IconData icon;
  final Map<String, dynamic> data;
}
