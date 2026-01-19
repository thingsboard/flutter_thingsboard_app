import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thingsboard_app/modules/main/model/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/widgets/bottom_navbar_items.dart';

class TbNavigationBarWidget extends StatelessWidget {
  const TbNavigationBarWidget({
    super.key,
    this.backgroundColor,
    required this.customBottomBarItems,
    this.currentIndex = 0,
    required this.onTap,
    this.lineIndicatorWidth = 2,
    this.gradient,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
  });

  final Color? backgroundColor;
  final List<TbMainNavigationItem> customBottomBarItems;
  final int currentIndex;
  final double lineIndicatorWidth;
  final ValueChanged<int> onTap;
  final LinearGradient? gradient;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  @override
  Widget build(BuildContext context) {
    final bottomTheme = BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? bottomTheme.backgroundColor,
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: customBottomBarItems.mapIndexed((index, item) =>  Expanded(
              child: BottomNavbarItems(
                label: item.title,
                icon: item.icon,
                currentIndex: currentIndex,
                lineIndicatorWidth: lineIndicatorWidth,
                index: index,
                onTap: onTap,
                selectedTextStyle: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  letterSpacing: .4,
                  color: bottomTheme.selectedItemColor,
                ),
                unSelectedTextStyle: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  letterSpacing: .4,
                  color: bottomTheme.unselectedItemColor,
                ),
                showAdditionalIcon:
                    item.showAdditionalIcon,
                additionalIcon: item.additionalIconLarge,
              ),
            ),).toList()
    
          
         
        ),
      ),
    );
  }
}
