import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).newUserText,
          style: TbTextStyles.labelSmall,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).createAccount,
            style: TbTextStyles.labelSmall,
          ),
        ),
      ],
    );
  }
}
