import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/more/profle_widget.dart';
import 'package:thingsboard_app/modules/profile/model/unit_systems.dart';
import 'package:thingsboard_app/modules/profile/widget/user_delete/user_delete_button.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class ProfilePreviewWidget extends HookConsumerWidget {
  const ProfilePreviewWidget({
    super.key,
    required this.loadingNotifier,
    required this.user,
  });
  final User user;
  final ValueNotifier loadingNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = getIt<UserDetailsUseCase>()(
      UserDetailsParams(
        firstName: user.firstName ?? '',
        lastName: user.lastName ?? '',
        email: user.email,
      ),
    );
    final tableData = {
      S.of(context).email: user.email,
      S.of(context).firstName: user.firstName,
      S.of(context).lastName: user.lastName,
      S.of(context).language: getLocalizedLanguageName(
        getCurrentLocale(context, user),
        context,
      ),

      S.of(context).unitSystem: getUnitName(context),
    };

    return Column(
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 12,
            children: [
              const Icon(
                Icons.account_circle,
                color: AppColors.iconDisabled,
                size: 44,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getAuthorityName(context, user),
                    style: TbTextStyles.bodyMedium.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  Text(
                    userDetails.displayName,
                    style: TbTextStyles.titleXs.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              children: [
                Column(
                  children:
                      tableData.entries
                          .map(
                            (e) => [
                              ListTile(
                                title: Text(
                                  e.key,
                                  style: TbTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textTertiary,
                                  ),
                                ),
                                subtitle: Text(
                                  e.value?.toString() ?? ' ',
                                  style: TbTextStyles.bodyLarge.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),

                              const Divider(),
                            ],
                          )
                          .expand((e) => e)
                          .toList(),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).security, style: TbTextStyles.titleXs),
                      Column(
                        spacing: 8,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              context.push(
                                "${LoginRoutes.login}${LoginRoutes.mfaConfigure}",
                              );
                            },
                            child: Row(
                              spacing: 4,

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.key),
                                Text(
                                  S.of(context).twofactorAuthentication,
                                  style: TbTextStyles.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              _changePassword(context);
                            },
                            child: Row(
                              spacing: 4,

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.sync_lock),
                                Text(
                                  S.of(context).changePassword,
                                  style: TbTextStyles.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Commented out for CE app, uncoment this code if you need this feature
                // for your users
                // if (user.authority != Authority.SYS_ADMIN)
                //   getDeleteButton(context, ref, user)
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getUnitName(BuildContext context) => UnitSystems.fromString(
    user.additionalInfo?['unitSystem']?.toString(),
  ).getLocalizedName(context);


}

List<Locale> getAllLanguages(BuildContext context) {
  final List<Locale> fixedList = List.from(S.delegate.supportedLocales);
  fixedList.removeWhere((e) => e.languageCode == 'zh' && e.countryCode == null);

  return fixedList;
}

String getLocalizedLanguageName(Locale locale, BuildContext context) {
  return LocaleNamesLocalizationsDelegate.nativeLocaleNames[locale
          .toString()] ??
      'Unknown language';
}

Locale getCurrentLocale(BuildContext context, User user) {
  final locale = S.delegate.supportedLocales.firstWhereOrNull(
    (l) => l.toString() == user.additionalInfo?['lang']?.toString(),
  );

  return locale ?? Localizations.localeOf(context);
}

Future<void> _changePassword(BuildContext context) async {
  final res = await context.push('/profile/changePassword');
  if (res == true && context.mounted) {
    getIt<IOverlayService>().showSuccessNotification(
      (_) => S.of(context).passwordSuccessNotification,
      duration: const Duration(milliseconds: 1500),
    );
  }
}
