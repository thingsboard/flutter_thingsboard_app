import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class HelpTextWidget extends StatelessWidget {
  const HelpTextWidget(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TbTextStyles.bodyMedium.copyWith(
          color: Colors.black.withValues(alpha: 0.54),
        ),
      ),
    );
  }
}
