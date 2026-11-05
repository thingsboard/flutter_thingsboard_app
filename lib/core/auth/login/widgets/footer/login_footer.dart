import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/register_routes.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/more/widgets/more_page_footer.dart';

class LoginFooter extends ConsumerWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selfRegistrationEnabled =
        ref.watch(oauthProvider).value?.selfRegistrationParams != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selfRegistrationEnabled)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).newUserText, style: TbTextStyles.bodyMedium),
              TextButton(
                onPressed: () {
                  context.push(RegisterRoutes.register);
                },
                child: Text(
                  S.of(context).createAccount,
                  style: TbTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        const MorePageFooter(),
      ],
    );
  }
}
