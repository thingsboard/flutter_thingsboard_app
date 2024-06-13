import 'package:flutter/material.dart';

class AlarmFilterWidget extends StatelessWidget {
  const AlarmFilterWidget({
    required this.filterTitle,
    required this.child,
    super.key,
  });

  final String filterTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.12),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filterTitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.76),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
