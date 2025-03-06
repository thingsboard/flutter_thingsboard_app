import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class TbAlertDialog extends StatelessWidget {
  const TbAlertDialog({
    required this.title,
    required this.content,
    required this.actions,
    super.key,
  });

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      titleTextStyle: TbTextStyles.titleXs.copyWith(
        color: const Color(0xff1D1B20),
      ),
      content: content,
      contentTextStyle: TbTextStyles.bodyMedium.copyWith(
        color: const Color(0xff49454F),
      ),
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
    );
  }
}
