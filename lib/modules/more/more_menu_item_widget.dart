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
              color: !menuItem.disabled
                  ? color ?? Colors.black.withOpacity(.76)
                  : Colors.grey.withOpacity(0.5),
              size: 18,
            ),
            Visibility(
              visible: menuItem.showAdditionalIcon,
              child: menuItem.additionalIcon ?? const SizedBox.shrink(),
            ),
            const SizedBox(width: 20),
            Text(
              menuItem.title,
              style: TbTextStyles.bodyMedium.copyWith(
                color: !menuItem.disabled
                    ? color ?? Colors.black.withOpacity(.76)
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
