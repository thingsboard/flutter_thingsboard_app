import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/activity/system_activity_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/activity/user_comment_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class ActivityBuilderWidget extends StatelessWidget {
  const ActivityBuilderWidget(this.activity, {required this.userId, super.key});

  final AlarmCommentInfo activity;
  final UserId userId;

  @override
  Widget build(BuildContext context) {
    if (activity.type == AlarmCommentType.OTHER) {
      return UserCommentWidget(activity, userId: userId);
    }

    return SystemActivityWidget(activity);
  }
}
