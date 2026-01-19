import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/code_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_country_picker.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_drop_down_text_field.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class PhoneConfigureWidget extends TwoFaConfigWidget<SmsTwoFaAccountConfig> {
  const PhoneConfigureWidget({
    required super.config,
    required super.loading,
    required super.onConfigured,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeSent = useState(false);
    final providerData = getTwoFaProviderData(TwoFaProviderType.SMS);

    final form = useMemoized(
      () => FormGroup({
        'phone': FormControl<PhoneNumber>(
          validators: [PhoneValidators.valid, PhoneValidators.required],
        ),
        'countryCode': FormControl<Country>(
          value: CountryService().findByCode('US'),
        ),
      }),
    );

    final phoneController = useMemoized(
      () => PhoneController(
        initialValue: PhoneNumber(isoCode: IsoCode.fromJson('US'), nsn: ''),
      ),
    );

    if (!codeSent.value) {
      return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      S.of(context).enterAPhoneNumberToUseAsYourAuthenticator,
                      style: TbTextStyles.bodyMedium,
                    ),
                    TbDropDownTextField<Country>(
                      formControlName: 'countryCode',
                      selectedItemBuilder:
                          (country) => _getCountryDisplayName(country!),
                      label: S.of(context).country,
                      bottomSheetBuilder:
                          (context, value) => const TbCountryPicker(),
                      onSelected: (country) {
                        if (country != null) {
                          phoneController.value = PhoneNumber(
                            isoCode: IsoCode.fromJson(country.countryCode),
                            nsn: phoneController.value.nsn,
                          );
                        }
                      },
                    ),
                    PhoneTextField(phoneController: phoneController),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ReactiveFormConsumer(
                builder: (context, formGroup, _) {
                  return FilledButton(
                    onPressed:
                        formGroup.control('phone').invalid || loading.value
                            ? null
                            : () async {
                              await _handleSendCode(form, codeSent);
                            },
                    child:
                        loading.value
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : Text(S.of(context).sendCode),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    final PhoneNumber phoneNumber = form.control('phone').value as PhoneNumber;
    return CodeWidget(
      resend: () async {
        await _sendCode(form);
      },
      data: providerData,
      onSubmnit: (control) async {
        await _onCodeSubmit(control, form);
      },
      title: providerData.descFunction(context, phoneNumber.international),
      resendTimeoutSeconds: 30,
    );
  }

  String _getCountryDisplayName(Country country) {
    return '${country.flagEmoji} ${country.name}';
  }

  Future<void> _handleSendCode(
    FormGroup form,
    ValueNotifier<bool> codeSent,
  ) async {
    if (await _sendCode(form)) {
      codeSent.value = true;
    }
  }

  Future<bool> _sendCode(FormGroup form) async {
    loading.value = true;
    try {
      final PhoneNumber? phoneNumber =
          form.control('phone').value as PhoneNumber;
      if (phoneNumber == null) {
        throw Exception('Phone number is required');
      }

      config.phoneNumber = phoneNumber.international;
      await getIt<ITbClientService>().client
          .getTwoFactorAuthService()
          .submitTwoFaAccountConfig(config);
      return true;
    } catch (e) {
      // getIt<IOverlayService>().showErrorNotification(
      //   (ctx) => S.of(ctx).errorSendingCode(e.toString()),
      // );
      return false;
    } finally {
      loading.value = false;
    }
  }

  Future<void> _onCodeSubmit(
    AbstractControl<dynamic> control,
    FormGroup form,
  ) async {
    final code = control.value?.toString();
    if (code == null || code.isEmpty) {
      return;
    }

    loading.value = true;
    try {
      final phoneNumber = form.control('phone').value as PhoneNumber;

      config.phoneNumber = phoneNumber.international;
      await getIt<ITbClientService>().client
          .getTwoFactorAuthService()
          .verifyAndSaveTwoFaAccountConfig(config, verificationCode: code);
      onConfigured();
    } catch (e) {
      control.setErrors({TbValicationMessages.invalidCode: {}});
    } finally {
      loading.value = false;
    }
  }
}

class PhoneTextField extends HookWidget {
  const PhoneTextField({super.key, required this.phoneController});

  final PhoneController phoneController;

  @override
  Widget build(BuildContext context) {
    
    return ReactivePhoneFormField<PhoneNumber>(
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
        helperText: S.of(context).phoneNumberHelperText,
      ),
    
      formControlName: 'phone',
      focusNode: FocusNode(),
      valueAccessor: PhoneNumberValueAccessor(),
      isCountryButtonPersistent: true,
      isCountrySelectionEnabled: false,
    );
  }
}
