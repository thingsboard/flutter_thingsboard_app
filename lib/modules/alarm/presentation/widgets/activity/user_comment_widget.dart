import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/activity/alarm_activity_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/activity/alarm_activity_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/assignee/user_info_avatar_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_alert_dialog.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserCommentWidget extends StatefulWidget {
  const UserCommentWidget(this.activity, {required this.userId, super.key});

  final AlarmCommentInfo activity;
  final UserId userId;

  @override
  State<StatefulWidget> createState() => _UserCommentState();
}

class _UserCommentState extends State<UserCommentWidget> {
  @override
  Widget build(BuildContext context) {
    final userInfo = getIt<UserDetailsUseCase>()(
      UserDetailsParams(
        firstName: widget.activity.firstName,
        lastName: widget.activity.lastName,
        email: widget.activity.email!,
      ),
    );
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(widget.activity.createdTime),
    );

    final canEdit = widget.activity.userId?.id == widget.userId.id;
    if (!canEdit) {
      return _buildComment(userInfo, diff);
    }

    return FocusedMenuHolder(
      blurSize: 10,
      menuItemExtent: 44,
      duration: const Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.grey,
      bottomOffsetHeight: 100,
      menuOffset: 10,
      menuItems: [
        FocusedMenuItem(
          title: Text(S.of(context).edit, style: TbTextStyles.bodyRegular),
          trailingIcon: Icon(
            Icons.edit_rounded,
            color: Colors.black.withValues(alpha: .54),
          ),
          onPressed: () {
            context.read<AlarmActivityBloc>().add(
              AlarmEditCommentEvent(
                widget.activity.id,
                alarmId: widget.activity.alarmId,
                comment: widget.activity.comment,
              ),
            );
          },
        ),
        FocusedMenuItem(
          title: Text(
            S.of(context).delete,
            style: TbTextStyles.bodyRegular.copyWith(
              color: const Color(0xffD12730),
            ),
          ),
          trailingIcon: const Icon(
            Icons.delete_rounded,
            color: Color(0xffD12730),
          ),
          onPressed: () async {
            final delete = await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return TbAlertDialog(
                  title: Text(S.of(context).deleteComment),
                  content: Text(S.of(context).areYouSure),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        S.of(context).cancel.toUpperCase(),
                        style: TbTextStyles.labelLarge.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        S.of(context).delete.toUpperCase(),
                        style: TbTextStyles.labelLarge.copyWith(
                          color: const Color(0xffD12730),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );

            if (delete == true && context.mounted) {
              context.read<AlarmActivityBloc>().add(
                DeleteAlarmCommentEvent(
                  alarmId: widget.activity.alarmId,
                  commentId: widget.activity.id,
                ),
              );
            }
          },
        ),
      ],
      onPressed: () {},
      child: _buildComment(userInfo, diff),
    );
  }

  Widget _buildComment(UserDetailsOutput userInfo, Duration diff) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfoAvatarWidget(
          shortName: userInfo.shortName,
          color: UiUtils.colorFromString(userInfo.displayName),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${widget.activity.firstName ?? ''} ${widget.activity.lastName ?? ''}',
                  style: TbTextStyles.labelLarge.copyWith(
                    color: Colors.black.withValues(alpha: .76),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  timeago.format(DateTime.now().subtract(diff)),
                  style: TbTextStyles.bodyMedium.copyWith(
                    color: Colors.black.withValues(alpha: .38),
                  ),
                ),
                const SizedBox(width: 4),
                Visibility(
                  visible: widget.activity.comment.edited == true,
                  child: Text(
                    ' ${S.of(context).edited}',
                    style: TbTextStyles.bodyMedium.copyWith(
                      color: Colors.black.withValues(alpha: .38),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.activity.comment.text,
              style: TbTextStyles.bodyLarge.copyWith(
                color: Colors.black.withValues(alpha: .54),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
