// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/code_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/setup/widgets/totp_configure_widget.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_code_rejection.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_app/widgets/pinned_footer_scroll_view.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class EmailConfigureWidget extends TwoFaConfigWidget<EmailTwoFaAccountConfig> {
  const EmailConfigureWidget({
    required super.config,
    required super.loading,
    required super.onConfigured,
    super.alternative,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeSent = useState(false);
    final providerData = getTwoFaProviderData(TwoFaProviderType.EMAIL);
    final form = useMemoized(
      () => FormGroup({
        'email': FormControl(
          value: config.email,
          validators: [Validators.required, Validators.email],
        ),
        'code': FormControl(
          validators: [
            Validators.required,
            Validators.maxLength(6),
            Validators.minLength(6),
          ],
        ),
      }),
    );
    if (!codeSent.value) {
      return ReactiveForm(
        formGroup: form,
        child: PinnedFooterScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          footer: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              SizedBox(
                width: double.infinity,
                child: ReactiveFormConsumer(
                  builder: (context, formGroup, _) {
                    return FilledButton(
                      onPressed:
                          formGroup.control('email').invalid || loading.value
                          ? null
                          : () async {
                              await _handleSendCode(form, codeSent);
                            },
                      child: loading.value
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
              ?alternative,
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                S.of(context).enterAnEmailToUseAsYourAuthenticator,
                style: TbTextStyles.bodyMedium,
              ),
              TbTextField(
                formControlName: 'email',
                label: S.of(context).email,
                type: TextInputType.emailAddress,
                autoFillHints: const [AutofillHints.email],
              ),
            ],
          ),
        ),
      );
    }
    return CodeWidget(
      alternative: alternative,
      resend: () async {
        await _sendCode(form);
      },
      data: providerData,
      onSubmnit: (control) async {
        await _onCodeSubmit(
          control,
          form,
          ref.read(loginProvider.notifier).logout,
        );
      },
      title: providerData.descFunction(
        context,
        form.control('email').value?.toString() ?? '',
      ),
      resendTimeoutSeconds: 30,
    );
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
      final email = form.control('email').value?.toString();
      if (email == null || email.isEmpty) {
        throw Exception('Email is required');
      }

      final updatedConfig = config.rebuild((b) => b..email = email);
      await getIt<ITbClientService>().client
          .getTwoFactorAuthConfigControllerApi()
          .submitTwoFaAccountConfig(twoFaAccountConfig: updatedConfig);
      return true;
    } catch (e) {
      return false;
    } finally {
      loading.value = false;
    }
  }

  Future<void> _onCodeSubmit(
    AbstractControl<dynamic> control,
    FormGroup form,
    Future<void> Function() logout,
  ) async {
    final code = control.value?.toString();
    if (code == null || code.isEmpty) {
      return;
    }

    final email = form.control('email').value?.toString();
    if (email == null || email.isEmpty) {
      return;
    }

    loading.value = true;
    try {
      final updatedConfig = config.rebuild((b) => b..email = email);
      await getIt<ITbClientService>().client
          .getTwoFactorAuthConfigControllerApi()
          .verifyAndSaveTwoFaAccountConfig(
            twoFaAccountConfig: updatedConfig,
            verificationCode: code,
            extra: silentRequestExtra(),
          );
      onConfigured();
    } catch (e) {
      control.showCodeRejection(e, logout: logout);
    } finally {
      loading.value = false;
    }
  }
}
