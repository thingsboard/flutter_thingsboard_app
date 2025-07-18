import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/activity/alarm_activity_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/activity/alarm_activity_events.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class AlarmCommentTextField extends StatefulWidget {
  const AlarmCommentTextField(this.alarmId, {super.key});

  final AlarmId alarmId;

  @override
  State<StatefulWidget> createState() => _AlarmCommentTextFieldState();
}

class _AlarmCommentTextFieldState extends State<AlarmCommentTextField> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withValues(alpha: .32),
          ),
        ),
        hintStyle: TbTextStyles.bodyLarge.copyWith(
          color: Colors.black.withValues(alpha: .38),
        ),
        hintText: S.of(context).addCommentMessage,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_rounded, size: 24),
          onPressed:
              textController.text.isNotEmpty
                  ? () => _submitComment(context)
                  : null,
        ),
        suffixIconConstraints: const BoxConstraints(maxWidth: 34),
      ),
      textInputAction: TextInputAction.send,
      onSubmitted: (_) {
        _submitComment(context);
      },
      onChanged: (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _submitComment(BuildContext context) {
    if (textController.text.isNotEmpty) {
      context.read<AlarmActivityBloc>().add(
        PostAlarmCommentEvent(widget.alarmId, comment: textController.text),
      );
      textController.clear();
    }

    FocusScope.of(context).unfocus();
  }
}
