import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class RegionWidget extends StatelessWidget {
  const RegionWidget({
    required this.title,
    required this.subTitle,
    required this.selected,
    this.onTap,
    super.key,
  });

  final String title;
  final String subTitle;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TbTextStyles.labelMedium.copyWith(
                  color:
                      selected
                          ? Theme.of(context).primaryColor
                          : Colors.black.withValues(alpha: .76),
                ),
              ),
              Text(
                subTitle,
                style: TbTextStyles.labelSmall.copyWith(
                  color: Colors.black.withValues(alpha: .38),
                ),
              ),
            ],
          ),
          Visibility(
            visible: selected,
            child: Icon(
              Icons.check_outlined,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
