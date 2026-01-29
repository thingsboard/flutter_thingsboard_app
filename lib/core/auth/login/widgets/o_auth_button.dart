import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton({super.key, required this.logo, required this.onTap, this.title});
  final Widget logo;
  final VoidCallback onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
   style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.bordersLight,), padding: const EdgeInsets.all(16)),
      onPressed: onTap,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          logo,
          if(title != null) 
          Text(title!, style: TbTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary, height: 1), )
        ],
      ),
    );
  }
}
