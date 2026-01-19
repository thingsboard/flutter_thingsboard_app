import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class TwoFactorAuthForceDescription extends StatelessWidget {
  const TwoFactorAuthForceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 24,
                  children: [
                    SvgPicture.asset(
                      ThingsboardImage.twoFaSetup,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: 140,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.of(context).twofactorAuthenticationIsRequired,
                          style: TbTextStyles.titleSmallSb,
                        ),
                        Text(
                          S
                              .of(context)
                              .setUpAVerificationMethodToContinueWithYourLogin,
                          style: TbTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.pushReplacement(
                      '${LoginRoutes.login}${LoginRoutes.mfaConfigure}?force=true',
                    );
                  },
                  child: const Text('Set up verification method'),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: TbAppBar(title: Text(S.of(context).verificationRequired)),
    );
  }
}
