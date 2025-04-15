import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/modules/device/provisioning/widgets/help_message_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({
    required this.helpMessage,
    required this.textFieldLabel,
    super.key,
  });

  final String helpMessage;
  final String textFieldLabel;

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final textCtrl = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close_outlined),
        ),
        title: Text(
          S.of(context).confirmation,
          style: TbTextStyles.titleXs.copyWith(
            color: Colors.black.withOpacity(.87),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              TextField(
                controller: textCtrl,
                obscureText: obscureText,
                autofocus: true,
                autocorrect: false,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: widget.textFieldLabel,
                  labelStyle: TbTextStyles.labelSmall.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  isDense: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => obscureText = !obscureText);
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black.withOpacity(.54),
                      size: 24,
                    ),
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              HelpTextWidget(widget.helpMessage),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                  onPressed: textCtrl.text.isNotEmpty
                      ? () => Navigator.of(context).pop(textCtrl.text)
                      : null,
                  child: Text(
                    S.of(context).next,
                    style: TbTextStyles.labelMedium.copyWith(
                      color: textCtrl.text.isEmpty
                          ? Colors.black.withOpacity(.38)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textCtrl.dispose();
    super.dispose();
  }
}
