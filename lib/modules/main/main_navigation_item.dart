import 'package:flutter/material.dart';

class TbMainNavigationItem {
  final Widget page;
  String title;
  final IconData icon;
  final String path;

  TbMainNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.path,
  });
}
