import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmFilterWidget extends StatelessWidget {
  const AlarmFilterWidget({
    required this.filterTitle,
    required this.child,
    this.action,
    this.onActionTap,
    this.padding,
    super.key,
  });

  final String filterTitle;
  final Widget child;
  final Widget? action;
  final VoidCallback? onActionTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.12),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  filterTitle,
                  style: TbTextStyles.labelLarge.copyWith(
                    color: Colors.black.withOpacity(0.76),
                  ),
                ),
                Visibility(
                  visible: action != null,
                  child: InkWell(
                    onTap: onActionTap,
                    child: action,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: padding ?? const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: child,
          ),
        ],
      ),
    );
  }
}
