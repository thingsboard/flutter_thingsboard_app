import 'package:flutter/material.dart';

class BottomNavbarItems extends StatelessWidget {
  const BottomNavbarItems({
    required this.label,
    required this.icon,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.onTap,
    required this.index,
    this.currentIndex,
    this.lineIndicatorWidth = 3,
    this.showAdditionalIcon = false,
    this.additionalIcon,
    super.key,
  });

  final String label;
  final IconData icon;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final double lineIndicatorWidth;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final bool showAdditionalIcon;
  final Widget? additionalIcon;

  @override
  Widget build(BuildContext context) {
    final bottomTheme = BottomNavigationBarTheme.of(context);
    final isSelected = currentIndex == index;

    return SafeArea(
      left: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).primaryColor.withValues(alpha: .10),
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color:
                        isSelected
                            ? bottomTheme.selectedItemColor!
                            : Colors.transparent,
                    width: isSelected ? lineIndicatorWidth : 0,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
             
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: showAdditionalIcon ? 18 : 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 26,
                          color:
                              isSelected
                                  ? bottomTheme.selectedItemColor
                                  : bottomTheme.unselectedItemColor,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 30,
                            maxWidth: 30,
                          ),
                          child: Visibility(
                            visible: showAdditionalIcon,
                            child: additionalIcon ?? const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: isSelected ? selectedTextStyle : unSelectedTextStyle,
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
