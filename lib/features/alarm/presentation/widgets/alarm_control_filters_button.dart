import 'package:flutter/material.dart';

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
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child: const Text(
            'Reset',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onCancelTap,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: onUpdateTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                // Change your radius here
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
          child: const Text(
            'Update',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
