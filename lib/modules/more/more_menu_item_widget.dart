import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class MoreMenuItemWidget extends StatelessWidget {
  const MoreMenuItemWidget(
    this.menuItem, {
    required this.onTap,
    this.color,
    super.key,
  });

  final TbMainNavigationItem menuItem;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color?.withOpacity(.06) ??
          Theme.of(context).primaryColor.withOpacity(.06),
      highlightColor: color?.withOpacity(.06) ??
          Theme.of(context).primaryColor.withOpacity(.06),
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              menuItem.icon,
              color: color ?? Colors.black.withOpacity(.76),
              size: 18,
            ),
            Visibility(
              visible: menuItem.showAdditionalIcon,
              child: menuItem.additionalIconSmall ?? const SizedBox.shrink(),
            ),
            SizedBox(width: menuItem.showAdditionalIcon ? 12 : 20),
            Text(
              menuItem.title,
              style: TbTextStyles.bodyMedium.copyWith(
                color: color ?? Colors.black.withOpacity(.76),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
