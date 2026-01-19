import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/modules/profile/model/unit_systems.dart';
import 'package:thingsboard_app/modules/profile/widget/profile_preview_widget.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_async_bottom_sheet_builder.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_bottom_sheet_builder.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_country_picker.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_drop_down_text_field.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class ProfileEditPage extends HookConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginProvider);
    final user = login.user!;
    final loading = useState(false);
    final allLanguages = useMemoized(() => getAllLanguages(context));
    final canPop = useState(true);

    final form = useMemoized(
      () => FormGroup({
        "email": FormControl(
          validators: [Validators.email, Validators.required],
          value: user.email,
        ),
        "firstName": FormControl(value: user.firstName?.toString()),
        "lastName": FormControl(value: user.lastName?.toString()),
        "additionalInfo": FormGroup({
          "homeDashboardHideToolbar": FormControl<bool>(
            validators: [],
            value:
                bool.tryParse(
                  (user.additionalInfo?['homeDashboardHideToolbar']).toString(),
                ) ??
                true,
          ),
          "unitSystem": FormControl(
            validators: [Validators.required],
            value: UnitSystems.fromString(
              user.additionalInfo?['unitSystem']?.toString(),
            ),
          ),
          "lang": FormControl<Locale>(
            validators: [Validators.required],
            value: getCurrentLocale(context, user),
          ),
          'homeDashboardId': FormControl<DashboardInfo>(),
        }),

        "phone": FormControl<PhoneNumber>(
          value:
              (user.phone != null && user.phone.toString().isNotEmpty)
                  ? PhoneNumber.parse(user.phone!)
                  : null,
          validators: [PhoneValidators.valid],
        ),
        "countryCode": FormControl<Country>(
          validators: [Validators.required],
          value: CountryService().findByCode('US'),
        ),
      }),
    );
    useEffect(() {
      final String? id = user.additionalInfo?['homeDashboardId']?.toString();
      getHomeDashboardInfo(id, loading, form);
      return null;
    }, []);
    useEffect(() {
      final listener = form.valueChanges.listen((e) {
        canPop.value = false;
      });
      return () {
        listener.cancel();
      };
    }, []);
    final phoneController = useMemoized(
      () => PhoneController(
        initialValue: PhoneNumber(isoCode: IsoCode.fromJson('US'), nsn: ''),
      ),
    );
    return Scaffold(
      appBar: TbAppBar(
        title: Text(
          '${S.of(context).edit} ${S.of(context).profile.toLowerCase()}',
        ),
        leading: IconButton(
          onPressed: () async {
            if (!canPop.value) {
              final cancel = await onCancelEditing(context);
              if (cancel && context.mounted) {
                context.pop();
              }
            } else {
              if (context.mounted) {
                context.pop();
              }
            }
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 16,
                        ),
                        child: ReactiveForm(
                          formGroup: form,
                          child: Column(
                            spacing: 24,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: AppColors.iconDisabled,
                                  ),
                                  Expanded(
                                    child: TbTextField(
                                      formControlName: 'email',
                                      label: S.of(context).email,
                                      hint: S.of(context).email,
                                      autoFillHints: const [
                                        AutofillHints.email,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 36),
                                  Expanded(
                                    child: TbTextField(
                                      formControlName: 'firstName',
                                      label: S.of(context).firstName,
                                      hint: S.of(context).firstName,
                                      autoFillHints: const [
                                        AutofillHints.givenName,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 36),
                                  Expanded(
                                    child: TbTextField(
                                      formControlName: 'lastName',
                                      label: S.of(context).lastName,
                                      hint: S.of(context).lastName,
                                      autoFillHints: const [
                                        AutofillHints.familyName,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 12,
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: AppColors.iconDisabled,
                                  ),
                                  Expanded(
                                    child: TbDropDownTextField<Country>(
                                      formControlName: 'countryCode',
                                      selectedItemBuilder:
                                          (value) =>
                                              getCountryDisplayName(value),
                                      label: S.of(context).country,
                                      bottomSheetBuilder:
                                          (_, val) => const TbCountryPicker(),
                                      onSelected: (val) {
                                        phoneController.value = PhoneNumber(
                                          isoCode: IsoCode.fromJson(
                                            val!.countryCode,
                                          ),
                                          nsn: phoneController.value.nsn,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 36),
                                  Expanded(
                                    child: ReactivePhoneFormField<PhoneNumber>(
                                      controller: phoneController,
                                      countryButtonStyle: CountryButtonStyle(
                                        textStyle: TbTextStyles.bodyLarge,
                                        showFlag: false,
                                        showDropdownIcon: false,
                                      ),
                                      style: TbTextStyles.bodyLarge,
                                      decoration: InputDecoration(
                                        hintText: S.of(context).phone,
                                        isDense: true,
                                        border: const OutlineInputBorder(),
                                        helperText:
                                            S.of(context).phoneNumberHelperText,
                                      ),
                                      formControlName: 'phone',
                                      focusNode: FocusNode(),
                                      valueAccessor: PhoneNumberValueAccessor(),
                                      isCountryButtonPersistent: true,
                                      isCountrySelectionEnabled: false,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 12,
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: AppColors.iconDisabled,
                                  ),
                                  Expanded(
                                    child: TbDropDownTextField<Locale>(
                                      formControlName: 'additionalInfo.lang',
                                      label: S.of(context).language,
                                      onSelected: (val) => S.load(val!),
                                      selectedItemBuilder:
                                          (val) => getLocalizedLanguageName(
                                            val!,
                                            context,
                                          ),
                                      bottomSheetBuilder:
                                          (
                                            _,
                                            val,
                                          ) => TbBottomSheetBuilder<Locale>(
                                            allItems: allLanguages,

                                            title: S.of(context).language,
                                            listTitleBuilder:
                                                (context, item) =>
                                                    getLocalizedLanguageName(
                                                      item,
                                                      context,
                                                    ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 12,
                                children: [
                                  const Icon(
                                    Icons.square_foot,
                                    color: AppColors.iconDisabled,
                                  ),
                                  Expanded(
                                    child: TbDropDownTextField<UnitSystems>(
                                      bottomSheetBuilder:
                                          (_, val) =>
                                              TbBottomSheetBuilder<UnitSystems>(
                                                allItems: UnitSystems.values,

                                                title: S.of(context).unitSystem,
                                                listTitleBuilder:
                                                    (context, item) =>
                                                        item.getLocalizedName(
                                                          context,
                                                        ),
                                              ),
                                      formControlName:
                                          'additionalInfo.unitSystem',
                                      label: S.of(context).unitSystem,
                                      selectedItemBuilder:
                                          (value) =>
                                              value!.getLocalizedName(context),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 12,
                                children: [
                                  const Icon(
                                    Icons.dashboard,
                                    color: AppColors.iconDisabled,
                                  ),
                                  Expanded(
                                    child: TbDropDownTextField<DashboardInfo>(
                                      formControlName:
                                          'additionalInfo.homeDashboardId',
                                      selectedItemBuilder: (val) => val?.title,
                                      hint: S.of(context).homeDashboard,

                                      bottomSheetBuilder:
                                          (_, val) => TbAsyncBottomSheetBuilder<
                                            PageLink,
                                            DashboardInfo
                                          >(
                                            selectedValue: val,

                                            repository:
                                                getIt<
                                                  DashboardsPaginationRepository
                                                >(),
                                            title: S.of(context).homeDashboard,
                                            listTitleBuilder:
                                                (context, item) => item.title,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReactiveCheckbox(
                                    formControlName:
                                        'additionalInfo.homeDashboardHideToolbar',
                                  ),
                                  Text(
                                    S.of(context).hideHomeDashboardToolbar,
                                    style: TbTextStyles.bodyLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      spacing: 8,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(S.of(context).applyChanges),
                            onPressed: () {
                              _saveProfile(
                                context,
                                form,
                                loading,
                                user,
                                ref,
                                canPop,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.borderError,
                            ),
                            onPressed: () async {
                              await onDiscardPressed(context);
                            },
                            child: Text(S.of(context).discardChanges),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedVisibilityWidget(
              show: loading.value,
              child: const FullScreenLoader(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getHomeDashboardInfo(
    String? id,
    ValueNotifier<bool> loading,
    FormGroup form,
  ) async {
    if (id != null) {
      try {
        loading.value = true;
        final info = await getIt<ITbClientService>().client
            .getDashboardService()
            .getDashboardInfo(id);
        form
            .control('additionalInfo.homeDashboardId')
            .patchValue(info, updateParent: false, emitEvent: true);
      } catch (e) {
        // getIt<IOverlayService>().showErrorNotification(
        //   (_) => 'Error fetching home dashboard info $e',
        // );
      }
      loading.value = false;
    }
  }

  Future<void> onDiscardPressed(BuildContext context) async {
    final original = S.of(context).discardChanges;
    String titleString = original;
    if (original.isNotEmpty) {
      titleString = titleString[0].toUpperCase() + titleString.substring(1);
    }
    final discard = await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              titleString,
              style: TbTextStyles.titleXs.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            content: Text(
              S.of(context).thisActionCannotBeUndone,
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
                child: Text(S.of(context).yesDiscard),
              ),
            ],
          ),
    );
    if (discard == true && context.mounted) {
      context.pushReplacement('/profile/edit');
    }
  }
}

Future<void> _saveProfile(
  BuildContext context,
  FormGroup form,
  ValueNotifier isLoading,
  User user,
  WidgetRef ref,
  ValueNotifier<bool> canPop,
) async {
  FocusScope.of(context).unfocus();
  if (form.invalid) {
    return;
  }
  final newUser = user;
  newUser.email = form.control('email').value.toString();
  newUser.firstName = form.control('firstName').value?.toString();
  newUser.lastName = form.control('lastName').value?.toString();
  newUser.phone = (form.control('phone').value as PhoneNumber?)?.international;

  newUser.additionalInfo ??= {};
  final additionalInfoForm = form.control('additionalInfo') as FormGroup;
  newUser.additionalInfo!['homeDashboardHideToolbar'] =
      additionalInfoForm.control('homeDashboardHideToolbar').value;
  newUser.additionalInfo!['lang'] =
      (additionalInfoForm.control('lang').value as Locale).toString();
  newUser.additionalInfo!['unitSystem'] =
      (additionalInfoForm.control('unitSystem').value as UnitSystems).name
          .toUpperCase();
  newUser.additionalInfo!['homeDashboardId'] =
      (additionalInfoForm.control('homeDashboardId').value as DashboardInfo?)
          ?.id
          ?.id;
  isLoading.value = true;
  final overlayService = getIt<IOverlayService>();
  try {
    await getIt<ITbClientService>().client.getUserService().saveUser(newUser);
    await ref.read(loginProvider.notifier).loadUser();
    isLoading.value = false;
    canPop.value = true;
    overlayService.showSuccessNotification(
      (_) => S.of(context).profileSuccessNotification,
      duration: const Duration(milliseconds: 1500),
    );
   
  } catch (e) {
    isLoading.value = false;
    overlayService.showErrorNotification((_) => S.of(context).errorOccured(e));
  }
}

Future<bool> onCancelEditing(BuildContext context) async {
  final cancel = await getIt<IOverlayService>().showConfirmDialog(
    content:
        (_) => DialogContent(
          title: S.of(context).unsavedChanges,
          message: S.of(context).youHaveUnsavedChangesAreYouSureYouWantTo,
          cancel: S.of(context).cancel,
        ),
  );
  return cancel ?? false;
}

String getCountryDisplayName(Country? country) {
  return '${country?.flagEmoji} ${country?.name}';
}
