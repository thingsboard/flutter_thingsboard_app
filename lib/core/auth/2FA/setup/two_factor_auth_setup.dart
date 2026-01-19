import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_auth_provider_login_data.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/base_two_factor_layout.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/select_provider_type_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_avalible_providers/two_factor_setup_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_provider/two_factor_setup_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/backup_code_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/email_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/phone_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_view_type.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TwoFactorAuthSetup extends HookConsumerWidget {
  const TwoFactorAuthSetup({
    super.key,
    required this.isForce,
    this.selectedProvider,
    //  = TwoFaProviderType.SMS,
  });
  final TwoFaProviderType? selectedProvider;
  final bool isForce;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final providers = ref.watch(twoFactorSetupAvalibleProvidersProvider);
    final userConfig = ref.watch(acountTwoFactorSettingsProvider);

    useEffect(() {
      isLoading.value =
          providers.isLoading ||
          userConfig.isLoading ||
          userConfig.isRefreshing;
                  if (providers.hasError || userConfig.hasError) {
          ref.read(loginProvider.notifier).logout();
        }
      return null;
    }, [providers, userConfig]);

    if (selectedProvider != null) {
      final config = ref.watch(generateConfigProvider(selectedProvider!));

      useEffect(() {
        isLoading.value = config.isLoading || config.isRefreshing;
        if (config.hasError) {
          ref.read(loginProvider.notifier).logout();
        }
        return null;
      }, [config]);

      final data = getTwoFaProviderData(selectedProvider!);

      return BaseTwoFactorLayout(
        title: _getSelectedProviderTitle(data, context, selectedProvider!),
        isLoading: isLoading.value,
        child: config.when(
          data:
              (configData) => Column(
                children: [
                  Expanded(
                    child: _buildProviderWidget(
                      selectedProvider!,
                      configData,
                      isLoading,
                      ref,
                      context,
                    ),
                  ),
                  if (isForce)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            context.push(
                              '${LoginRoutes.login}${LoginRoutes.mfaConfigure}?force=$isForce',
                            );
                          },
                          child: Text(S.of(context).tryAnotherWay),
                        ),
                      ),
                    ),
                ],
              ),
          loading: () => const SizedBox.shrink(),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      );
    }
    if (userConfig.hasValue) {
      return BaseTwoFactorLayout(
        title: S.of(context).twofactorAuthentication,
        isLoading: isLoading.value,
        child:
            providers.value != null &&
                    !(userConfig.isLoading || userConfig.isRefreshing)
                ? SelectProviderTypeWidget(
                  defaultProvider:
                      userConfig.value?.configs.entries
                          .firstWhereOrNull((e) => e.value.useByDefault)
                          ?.key,
                  activeProviders:
                      userConfig.value?.configs.keys.toList() ?? [],
                  avalibleTypes: providers.value!,
                  type: isForce ? TwoFaViewType.force : TwoFaViewType.setup,
                )
                : const Center(child: CircularProgressIndicator()),
      );
    }
    return const SizedBox();
  }

  Widget _buildProviderWidget(
    TwoFaProviderType provider,
    TwoFaAccountConfig config,
    ValueNotifier<bool> loading,
    WidgetRef ref,
    BuildContext context,
  ) {
    void onConfigured() => _onMfaConfigured(ref, context, provider);

    return switch (provider) {
      TwoFaProviderType.TOTP => TotpConfigureWidget(
        onConfigured: onConfigured,
        loading: loading,
        config: config as TotpTwoFaAccountConfig,
      ),
      TwoFaProviderType.SMS => PhoneConfigureWidget(
        onConfigured: onConfigured,
        loading: loading,
        config: config as SmsTwoFaAccountConfig,
      ),
      TwoFaProviderType.EMAIL => EmailConfigureWidget(
        onConfigured: onConfigured,
        loading: loading,
        config: config as EmailTwoFaAccountConfig,
      ),
      TwoFaProviderType.BACKUP_CODE => BackupCodeConfigureWidget(
        onConfigured: onConfigured,
        loading: loading,
        config: config as BackupCodeTwoFaAccountConfig,
      ),
    };
  }

  String _getSelectedProviderTitle(
    TwoFactorAuthProviderLoginData data,
    BuildContext context,
    TwoFaProviderType provider,
  ) {
    if (provider == TwoFaProviderType.BACKUP_CODE) {
      return 'Get backup code';
    }
    final providerName = data.nameFunction(context).toLowerCase();
    final suffix = provider == TwoFaProviderType.TOTP ? '' : 'authenticator';
    return 'Enable $providerName $suffix'.trim();
  }

  void _onMfaConfigured(
    WidgetRef ref,
    BuildContext context,
    TwoFaProviderType configuredType,
  ) {
    ref.invalidate(acountTwoFactorSettingsProvider);
    final route =
        '${LoginRoutes.login}${LoginRoutes.mfaForceSuccess}${'?force=$isForce'}&selectedProvider=${configuredType.toShortString()}';
    context.pushReplacement(route, extra: configuredType);
  }
}
