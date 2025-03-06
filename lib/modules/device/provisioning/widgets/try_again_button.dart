import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    required this.onTryAgain,
    this.label,
    super.key,
  });

  final String? label;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTryAgain,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(.12),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          label ?? S.of(context).tryAgain,
          style: TbTextStyles.labelMedium.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
