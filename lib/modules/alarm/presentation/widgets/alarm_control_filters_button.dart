import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class AlarmControlFiltersButton extends StatelessWidget {
  const AlarmControlFiltersButton({
    required this.onResetTap,
    required this.onCancelTap,
    required this.onUpdateTap,
    super.key,
  });

  final VoidCallback? onResetTap;
  final VoidCallback onCancelTap;
  final VoidCallback? onUpdateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onResetTap,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child:  Text(
            S.of(context).reset,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onCancelTap,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child:  Text(
            S.of(context).cancel,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: onUpdateTap,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                // Change your radius here
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child:  Text(
            S.of(context).update,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
