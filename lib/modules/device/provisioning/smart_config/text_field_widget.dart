import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.textEditingController,
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController textEditingController;
  final bool obscureText;
  final String labelText;
  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      obscureText: obscureText,
      autofocus: true,
      autocorrect: false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: widget.labelText,
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
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() => obscureText = !obscureText);
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black.withOpacity(.54),
                  size: 24,
                ),
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }
}
