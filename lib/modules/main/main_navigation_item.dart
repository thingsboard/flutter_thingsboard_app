import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TbMainNavigationItem extends Equatable {
  const TbMainNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.path,
    this.id,
  });

  final Widget page;
  final String title;
  final IconData icon;
  final String path;
  final String? id;

  @override
  List<Object?> get props => [page, title, icon, path, id];
}
