import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:thingsboard_app/utils/ui/tb_alert_dialog.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TbAlertDialog(
      title: const Text('Exit device provisioning'),
      content: Text(S.of(context).areYouSure),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            S.of(context).cancel.toUpperCase(),
            style: TbTextStyles.labelLarge.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text(
            S.of(context).yes.toUpperCase(),
            style: TbTextStyles.labelLarge.copyWith(
              color: Colors.black.withOpacity(.87),
            ),
          ),
        ),
      ],
    );
  }
}
