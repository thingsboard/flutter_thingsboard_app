import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';

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
          children: List.generate(
            customBottomBarItems.length,
            (index) => Expanded(
              child: BottomNavbarItems(
                label: customBottomBarItems[index].title,
                icon: customBottomBarItems[index].icon,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavbarItems extends StatelessWidget {
  final String label;
  final IconData icon;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final double lineIndicatorWidth;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;

  const BottomNavbarItems({
    required this.label,
    required this.icon,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.onTap,
    required this.index,
    this.currentIndex,
    this.lineIndicatorWidth = 3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomTheme = BottomNavigationBarTheme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).primaryColor.withOpacity(.10),
            onTap: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: currentIndex == index
                        ? bottomTheme.selectedItemColor!
                        : Colors.transparent,
                    width: lineIndicatorWidth,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 26,
                    color: currentIndex == index
                        ? bottomTheme.selectedItemColor
                        : bottomTheme.unselectedItemColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: currentIndex == index
                        ? selectedTextStyle
                        : unSelectedTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
