// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/main/domain/models/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/presentation/widgets/bottom_navbar_items.dart';

class TbNavigationBarWidget extends StatelessWidget {
  const TbNavigationBarWidget({
    super.key,
    required this.customBottomBarItems,
    this.currentIndex = 0,
    required this.onTap,
  });

  final List<TbMainNavigationItem> customBottomBarItems;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bottomTheme = BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: bottomTheme.backgroundColor),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: customBottomBarItems
              .mapIndexed(
                (index, item) => Expanded(
                  child: BottomNavbarItems(
                    label: item.title,
                    icon: item.icon,
                    currentIndex: currentIndex,
                    lineIndicatorWidth: 2,
                    index: index,
                    onTap: onTap,
                    selectedTextStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      letterSpacing: .4,
                      color: bottomTheme.selectedItemColor,
                    ),
                    unSelectedTextStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      letterSpacing: .4,
                      color: bottomTheme.unselectedItemColor,
                    ),
                    showAdditionalIcon: item.showAdditionalIcon,
                    additionalIcon: item.additionalIconLarge,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
