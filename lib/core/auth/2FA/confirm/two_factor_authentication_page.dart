import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_avalible_providers/two_factor_avalible_providers.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_confirm_provider/two_factor_confirm_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/base_two_factor_layout.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/select_provider_type_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/two_factor_auth_code_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_view_type.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class TwoFactorAuthenticationPage extends HookConsumerWidget {
  const TwoFactorAuthenticationPage({
    super.key,
    required this.skipDefault,
    this.selectedProvider,
  });
  final TwoFaProviderType? selectedProvider;
  final bool skipDefault;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    final providers = ref.watch(twoFaConfirmAvalibleProvidersProvider);
    useEffect(() {
      if (providers is AsyncData && selectedProvider == null) {
        isLoading.value = false;
        if (skipDefault) {
          return;
        }
        if (providers.value?.length == 1) {
          context.pushReplacement(
            '${LoginRoutes.login}${LoginRoutes.mfaConfirm}?selectedProvider=${providers.value!.first.type.toShortString()}',
          );
          return;
        }
        final defaultProvider = providers.value?.firstWhereOrNull(
          (e) => e.isDefault,
        );
        if (defaultProvider != null) {
          context.pushReplacement(
             '${LoginRoutes.login}${LoginRoutes.mfaConfirm}?selectedProvider=${defaultProvider.type.toShortString()}',
          );
          return;
        }
      }
      if (providers is AsyncLoading) {
        isLoading.value = true;
      }
      return null;
    }, [providers]);

    if (selectedProvider != null && providers.value != null) {
      final info = providers.value!.firstWhere(
        (e) => e.type == selectedProvider,
      );
      final codeLoading = ref.watch(
        twoFactorConfirmProvider(
          info.type,
          info.minVerificationCodeSendPeriod,
        ).select((state) => state.loading),
      );
      useEffect(() {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await sendCode(isLoading, ref, info);
        });
        return;
      }, []);
      return BaseTwoFactorLayout(
        title: S.of(context).verifyYourIdentity,
        isLoading: codeLoading,
        child: EnterACodeWidget(selectedProvider: info),
      );
    }

    return BaseTwoFactorLayout(
      title: S.of(context).verifyYourIdentity,
      isLoading: isLoading.value,
      child: providers.value != null
          ? SelectProviderTypeWidget(
              activeProviders: const [],
              avalibleTypes: providers.value!.map((e) => e.type).toList(),
              type: TwoFaViewType.confirm,
            )
          : const SizedBox(),
    );
  }

  Future<void> sendCode(
    ValueNotifier<bool> isLoading,
    WidgetRef ref,
    TwoFaProviderInfo info,
  ) async {
    isLoading.value = true;
    await ref
        .read(
          twoFactorConfirmProvider(
            info.type,
            info.minVerificationCodeSendPeriod,
          ).notifier,
        )
        .sendCode();
    isLoading.value = false;
  }
}
