import 'package:flutter/material.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class SystemActivityWidget extends StatelessWidget {
  const SystemActivityWidget(this.activity, {super.key});

  final AlarmCommentInfo activity;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(activity.createdTime),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          timeago.format(DateTime.now().subtract(diff)),
          style: TbTextStyles.labelMedium.copyWith(
            color: Colors.black.withValues(alpha: .38),
          ),
        ),
        Text(
          activity.comment.text,
          style: TbTextStyles.bodyLarge.copyWith(
            color: Colors.black.withValues(alpha: .54),
          ),
        ),
      ],
    );
  }
}
