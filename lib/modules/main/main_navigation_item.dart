import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

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

  static final mainPageStateMap = <String>{};

  static bool isMainPageState(TbContext tbContext, String path) {
    if (tbContext.isAuthenticated) {
      return mainPageStateMap.contains(path);
    } else {
      return false;
    }
  }
}
