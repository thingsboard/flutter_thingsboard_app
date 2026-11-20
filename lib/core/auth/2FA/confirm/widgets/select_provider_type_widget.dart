// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/error_state_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/providers/two_factor_setup_account_settings_provider/two_factor_setup_account_settings_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_view_type.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/ui/material_icons.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_bottom_sheet_builder.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class SelectProviderTypeWidget extends HookConsumerWidget {
  const SelectProviderTypeWidget({
    super.key,
    required this.type,
    required this.avalibleTypes,
    required this.activeProviders,
    this.defaultProvider,
  });
  final List<TwoFaProviderType> avalibleTypes;
  final List<TwoFaProviderType> activeProviders;
  final TwoFaViewType type;
  final TwoFaProviderType? defaultProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final isForce = type == TwoFaViewType.force;
    final filtered = switch (type) {
      TwoFaViewType.setup => avalibleTypes,

      TwoFaViewType.force =>
        (activeProviders.isEmpty
                ? avalibleTypes.where((e) => e != TwoFaProviderType.BACKUP_CODE)
                : avalibleTypes.where((e) => !activeProviders.contains(e)))
            .toList(),

      TwoFaViewType.confirm => avalibleTypes,
    }.toList();

    if (avalibleTypes.isEmpty) {
      return ErrorStateWidget(
        title: S.of(context).no2faProvidersFound,
        description: S.of(context).pleaseContactYourSystemAdministrator,
      );
    }

    return Stack(
      children: [
        Center(
          child: Column(
            spacing: 20,
            children: [
              if (type == TwoFaViewType.setup)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.notificationSuccess.withValues(
                      alpha: 0.06,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    S
                        .of(context)
                        .twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou,
                    style: TbTextStyles.bodyMedium.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                Text(
                  type == TwoFaViewType.confirm
                      ? S.of(context).selectWayToVerify
                      : S.of(context).setUpAVerificationMethod,
                  style: TbTextStyles.bodyMedium,
                ),
              Column(
                spacing: 12,
                children: [
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final provider = filtered[index];
                      final bool isEnabled =
                          !(activeProviders.isEmpty &&
                              provider == TwoFaProviderType.BACKUP_CODE);
                      final data = getTwoFaProviderData(provider);
                      final bool isSelected = activeProviders.contains(
                        provider,
                      );
                      final recommended =
                          !isSelected && provider == TwoFaProviderType.TOTP;
                      return type == TwoFaViewType.setup
                          ? ListTile(
                              enabled: isEnabled,
                              onTap: () async {
                                if (isSelected) {
                                  return await deactivateProvider(
                                    context,
                                    ref,
                                    provider,
                                  );
                                }

                                context.push(
                                  '${LoginRoutes.login}${LoginRoutes.mfaConfigure}?selectedProvider=${provider.name}&force=$isForce',
                                );
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              horizontalTitleGap: 16,
                              minLeadingWidth: 24,
                              dense: true,
                              leading: getIcon(
                                data.icon,
                                context,
                                isEnabled
                                    ? AppColors.iconSecondary
                                    : AppColors.iconDisabled,
                              ),
                              title: _ProviderName(
                                name: data.nameFunction(context),
                                recommended: recommended,
                                style: TbTextStyles.bodyLarge.copyWith(
                                  color: isEnabled
                                      ? AppColors.textPrimary
                                      : AppColors.textDisabled,
                                ),
                              ),
                              subtitle: Text(
                                data.setupDescriptionFunction(context),
                                style: TbTextStyles.bodyMedium.copyWith(
                                  color: isEnabled
                                      ? AppColors.textTertiary
                                      : AppColors.textDisabled,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 8,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:
                                          (isSelected
                                                  ? AppColors
                                                        .notificationSuccess
                                                  : AppColors.black)
                                              .withValues(alpha: .06),
                                    ),
                                    child: Text(
                                      isSelected
                                          ? S.of(context).active
                                          : S.of(context).inactive,
                                      textAlign: TextAlign.center,

                                      style: TbTextStyles.bodyMedium.copyWith(
                                        color: isSelected
                                            ? AppColors.notificationSuccess
                                            : AppColors.textSecondary,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isSelected
                                        ? Icons.close
                                        : Icons.chevron_right,
                                    color: AppColors.iconDisabled,
                                    size: 24,
                                  ),
                                ],
                              ),
                            )
                          : OutlinedButton.icon(
                              onPressed: () {
                                context.push(
                                  '${LoginRoutes.login}${type == TwoFaViewType.confirm ? LoginRoutes.mfaConfirm : LoginRoutes.mfaConfigure}?selectedProvider=${provider.name}&force=$isForce',
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 10,
                                ),
                                alignment: isForce
                                    ? AlignmentDirectional.centerStart
                                    : null,
                              ),
                              label: isForce
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        _ProviderName(
                                          name: data.nameFunction(context),
                                          recommended: recommended,
                                        ),
                                        Text(
                                          data.setupDescriptionFunction(
                                            context,
                                          ),
                                          style: TbTextStyles.bodyMedium
                                              .copyWith(
                                                color: AppColors.textTertiary,
                                              ),
                                        ),
                                      ],
                                    )
                                  : Text(data.nameFunction(context)),
                              icon: getIcon(
                                data.icon,
                                context,
                                Theme.of(context).primaryColor,
                              ),
                            );
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemCount: filtered.length,
                  ),
                  if (defaultProvider != null &&
                      activeProviders
                              .where((e) => e != TwoFaProviderType.BACKUP_CODE)
                              .length >
                          1 &&
                      type == TwoFaViewType.setup)
                    Builder(
                      builder: (context) {
                        final data = getTwoFaProviderData(defaultProvider!);
                        return InkWell(
                          onTap: () async {
                            final info =
                                await showModalBottomSheet<TwoFaProviderType?>(
                                  context: context,
                                  builder: (context) =>
                                      TbBottomSheetBuilder<TwoFaProviderType>(
                                        itemBuilder: (context, search, item) {
                                          final data = getTwoFaProviderData(
                                            item,
                                          );
                                          return InkWell(
                                            onTap: () => context.pop(item),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                spacing: 16,
                                                children: [
                                                  getIcon(
                                                    data.icon,
                                                    context,
                                                    AppColors.iconSecondary,
                                                  ),
                                                  Text(
                                                    data.nameFunction(context),

                                                    textHeightBehavior:
                                                        const TextHeightBehavior(
                                                          applyHeightToFirstAscent:
                                                              false, // Disable height for ascent
                                                          applyHeightToLastDescent:
                                                              false,
                                                        ),
                                                    style:
                                                        TbTextStyles.bodyLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        title: 'Select method',
                                        allItems: activeProviders
                                            .where(
                                              (e) =>
                                                  e !=
                                                  TwoFaProviderType.BACKUP_CODE,
                                            )
                                            .toList(),
                                      ),
                                  showDragHandle: false,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                );
                            if (info != null) {
                              loading.value = true;
                              try {
                                await getIt<ITbClientService>().client
                                    .getTwoFactorAuthConfigControllerApi()
                                    .updateTwoFaAccountConfig(
                                      providerType: info,
                                      twoFaAccountConfigUpdateRequest:
                                          TwoFaAccountConfigUpdateRequest(
                                            (b) => b..useByDefault = true,
                                          ),
                                    );
                                await Future.delayed(
                                  const Duration(milliseconds: 200),
                                );
                                ref.invalidate(acountTwoFactorSettingsProvider);
                              } catch (_) {
                                // The global error handler shows the error.
                              }
                              loading.value = false;
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Main two-factor authentication method',
                                    style: TbTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textTertiary,
                                    ),
                                  ),
                                  Text(
                                    data.nameFunction(context),
                                    style: TbTextStyles.bodyLarge,
                                  ),
                                ],
                              ),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
        AnimatedVisibilityWidget(
          show: loading.value,
          child: const FullScreenLoader(),
        ),
      ],
    );
  }

  Future<void> deactivateProvider(
    BuildContext context,
    WidgetRef ref,
    TwoFaProviderType providerType,
  ) async {
    final data = getTwoFaProviderData(providerType);
    final bool res =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              S
                  .of(context)
                  .areYouSureYouWantToDeactivate(data.nameFunction(context)),
              style: TbTextStyles.titleXs.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            content: Text(
              S.of(context).thisWillMakeYourAccountLessSecure,
              style: TbTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textError,
                ),
                onPressed: () => context.pop(true),
                child: Text(S.of(context).yesDeactivate),
              ),
            ],
          ),
        ) ??
        false;
    if (res == false) {
      return;
    }
    try {
      await getIt<ITbClientService>().client
          .getTwoFactorAuthConfigControllerApi()
          .deleteTwoFaAccountConfig(providerType: providerType);

      ref.invalidate(acountTwoFactorSettingsProvider);
    } catch (e) {
      // getIt<IOverlayService>().showErrorNotification(
      //   (_) => 'Error disabling provider: $e',
      // );
    }
  }
}

class _ProviderName extends StatelessWidget {
  const _ProviderName({
    required this.name,
    required this.recommended,
    this.style,
  });

  final String name;
  final bool recommended;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(name, style: style),
        if (recommended)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.notificationSuccess.withValues(alpha: .06),
            ),
            child: Text(
              S.of(context).recommended,
              style: TbTextStyles.labelSmall.copyWith(
                color: AppColors.notificationSuccess,
              ),
            ),
          ),
      ],
    );
  }
}

Widget getIcon(String iconName, BuildContext context, Color color) {
  Widget icon;
  final iconData = mdiIconFromString(iconName);
  if (iconData != null) {
    icon = Icon(iconData, size: 24, color: color);
  } else {
    icon = Icon(Icons.login, size: 24, color: color);
  }
  return icon;
}
