import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class ScanListWidget extends StatelessWidget {
  const ScanListWidget(this.items, {required this.icon, this.onTap, super.key});

  final List<String> items;
  final IconData icon;
  final Function(String item)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onTap?.call(items[index]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    items[index],
                    style: TbTextStyles.bodyLarge.copyWith(
                      color: Colors.black.withValues(alpha: .76),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: items.length,
      separatorBuilder:
          (_, _) =>
              const Divider(height: 1, thickness: .05, color: Colors.black),
    );
  }
}
