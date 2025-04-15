import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class ReturnToDashboardButton extends StatelessWidget {
  const ReturnToDashboardButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
        onPressed: onTap,
        child: Text(
          S.of(context).returnToDashboard,
          style: TbTextStyles.labelMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
