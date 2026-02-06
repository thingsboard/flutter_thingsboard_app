import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_avalible_providers/two_factor_setup_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TwoFactorAuthConfigSuccess extends ConsumerWidget {
  const TwoFactorAuthConfigSuccess({
    super.key,
    required this.type,
    required this.isForce,
  });
  final TwoFaProviderType type;
  final bool isForce;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = getTwoFaProviderData(type);
    final platformConfig = ref.watch(twoFactorSetupAvalibleProvidersProvider);
    final userSettings = ref.watch(acountTwoFactorSettingsProvider);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 24,
                      children: [
                        SvgPicture.asset(
                          ThingsboardImage.twoFaConfigured,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryColor,
                            BlendMode.srcIn,
                          ),
                          width: 140,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${data.nameFunction(context)} successfully enabled',
                                style: TbTextStyles.titleSmallSb,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                data.setupSuccessDescription(context),
                                style: TbTextStyles.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (isForce) {
                              ref.read(loginProvider.notifier).logout();
                              context.pushReplacement(LoginRoutes.login);
                              return;
                            }
                            context.pop();
                          },
                          child: Text(
                            isForce ? S.of(context).loginToApp : S.of(context).done,
                          ),
                        ),
                      ),
                      if (isForce && (userSettings.value?.configs.length != platformConfig.value?.length))

                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              context.pushReplacement(
                                "${LoginRoutes.login}${LoginRoutes.mfaConfigure}?force=$isForce",
                              );
                            },
                            child: Text(S.of(context).addVerificationMethod),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
                 if(platformConfig.isLoading || userSettings.isLoading)
          const FullScreenLoader(),
        ],
      ),
    );
  }
}
