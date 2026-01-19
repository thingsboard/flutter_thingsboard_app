import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/modules/main/model/main_navigation_item.dart';

class MoreMenuItemWidget extends StatelessWidget {
  const MoreMenuItemWidget(
    this.menuItem, {
    required this.onTap,
    this.color,
    this.showTrailing = true,
    super.key,
  });

  final TbMainNavigationItem menuItem;
  final VoidCallback onTap;
  final Color? color;
  final bool showTrailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    
      onTap: onTap,
   
      
      horizontalTitleGap: 0,
      leading:  Icon(menuItem.icon, color: color ?? AppColors.iconSecondary, size: 24,),
      title: Text(
        menuItem.title,
        style: TbTextStyles.bodyMedium.copyWith(
          color: color ?? AppColors.textSecondary,
        ),
      ),
      trailing: showTrailing ?  Icon(Icons.chevron_right, color: color ?? AppColors.iconDisabled,) : null,
    );


  }
}
