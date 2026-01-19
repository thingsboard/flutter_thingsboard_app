import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/step_chip.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

abstract class TwoFaConfigWidget<T extends TwoFaAccountConfig>
    extends HookConsumerWidget {
  const TwoFaConfigWidget({
    super.key,
    required this.config,
    required this.loading,
    required this.onConfigured,
  });

  final T config;
  final ValueNotifier<bool> loading;
  final VoidCallback onConfigured;
}

class TotpConfigureWidget extends TwoFaConfigWidget<TotpTwoFaAccountConfig> {
  const TotpConfigureWidget({
    required super.config,
    required super.loading,
    required super.onConfigured,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = Uri.parse(config.authUrl);
    final code = url.queryParameters['secret'] ?? '';

    final form = useMemoized(
      () => FormGroup({
        'verificationCode': FormControl(
          validators: [
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(6),
          ],
        ),
      }),
    );

    return ReactiveForm(
      formGroup: form,
      child: Column(
        spacing: 32,
        children: [
          StepChip(
            leading: '1',
            title: S
                .of(context)
                .copy32digitsKeyToYourAuthenticationAppOrScanQrcode,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).digitsCode(32),
                    suffixIcon: TextButton(
                      child: Text(S.of(context).copy),
                      onPressed: () => _copySecretToClipboard(context, code),
                    ),
                  ),
                  controller: TextEditingController(text: code),
                ),
                Center(
                  child: SvgPicture.string(
                    Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.medium,
                    ).toSvg(config.authUrl, height: 120, width: 120),
                  ),
                ),
              ],
            ),
          ),
          StepChip(
            leading: '2',
            title: S.of(context).enter6digitsKeyFromYourAppHere,
            content: TbTextField(
              type: TextInputType.number,
              autoFillHints: const [AutofillHints.oneTimeCode],
              formControlName: 'verificationCode',
              label: S.of(context).digitsCode(6),
              hint: S.of(context).digitsCode(6),
              onMaxLengthReched: () => _handleCodeSubmit(context, form),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _copySecretToClipboard(BuildContext context, String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    getIt<IOverlayService>().showSuccessNotification(
      duration: const Duration(seconds: 3),
      (_) => S.of(context).copiedToClipboard,
    );
  }

  Future<void> _handleCodeSubmit(BuildContext context, FormGroup form) async {
    FocusScope.of(context).unfocus();
    final verificationCode = form.control('verificationCode').value?.toString();

    if (verificationCode == null || verificationCode.isEmpty) {
      return;
    }

    loading.value = true;
    try {
      await getIt<ITbClientService>().client
          .getTwoFactorAuthService()
          .verifyAndSaveTwoFaAccountConfig(
            config,
            verificationCode: verificationCode,
          );
      onConfigured();
    } catch (e) {
      form.control('verificationCode').setErrors({
        TbValicationMessages.invalidCode: {},
      });
    } finally {
      loading.value = false;
    }
  }
}
