import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/activity/alarm_activity_events.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmEditCommentTextField extends StatefulWidget {
  const AlarmEditCommentTextField(
    this.commentId, {
    required this.alarmId,
    required this.commentToEdit,
    super.key,
  });

  final AlarmId alarmId;
  final String commentId;
  final AlarmComment commentToEdit;

  @override
  State<StatefulWidget> createState() => _AlarmEditCommentState();
}

class _AlarmEditCommentState extends State<AlarmEditCommentTextField> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(.32),
          ),
        ),
        hintStyle: TbTextStyles.bodyLarge.copyWith(
          color: Colors.black.withOpacity(.38),
        ),
        hintText: S.of(context).addCommentMessage,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 24,
                color: Color(0xffD12730),
              ),
              onPressed: () {
                context
                    .read<AlarmActivityBloc>()
                    .add(const CancelAlarmCommentEditing());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                size: 24,
                color: textController.text.isNotEmpty
                    ? const Color(0xff00695C)
                    : Theme.of(context).disabledColor,
              ),
              onPressed: textController.text.isNotEmpty
                  ? () => _submitComment(context)
                  : null,
            ),
          ],
        ),
        suffixIconConstraints: const BoxConstraints(maxWidth: 96),
      ),
      textInputAction: TextInputAction.send,
      onSubmitted: (_) {
        _submitComment(context);
      },
      onChanged: (_) => setState(() {}),
    );
  }

  @override
  void initState() {
    textController.text = widget.commentToEdit.text;
    super.initState();
  }

  void _submitComment(BuildContext context) {
    if (textController.text.isNotEmpty) {
      context.read<AlarmActivityBloc>().add(
            UpdateAlarmCommentEvent(
              widget.commentId,
              alarmId: widget.alarmId,
              comment: textController.text,
            ),
          );
      textController.clear();
    }

    FocusScope.of(context).unfocus();
  }
}
