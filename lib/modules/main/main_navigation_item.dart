import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TbMainNavigationItem extends Equatable {
  const TbMainNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.path,
    this.id,
    this.showAdditionalIcon = false,
    this.additionalIconSmall,
    this.additionalIconLarge,
  });

  final Widget page;
  final String title;
  final IconData icon;
  final String path;
  final String? id;
  final bool showAdditionalIcon;
  final Widget? additionalIconSmall;
  final Widget? additionalIconLarge;

  @override
  List<Object?> get props => [
        page,
        title,
        icon,
        path,
        id,
        showAdditionalIcon,
        additionalIconSmall,
        additionalIconLarge,
      ];
}
