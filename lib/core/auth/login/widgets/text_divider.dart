import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Flexible(child: Divider(color: Colors.black.withValues(alpha: .12))),
        Text(text, style: TbTextStyles.bodyMedium),
        Flexible(child: Divider(color: Colors.black.withValues(alpha: .12))),
      ],
    );
  }
}
