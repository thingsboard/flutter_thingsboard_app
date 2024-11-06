import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmStatusButton extends StatelessWidget {
  const AlarmStatusButton({required this.text, required this.onTap, super.key});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: TbTextStyles.titleXs,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
