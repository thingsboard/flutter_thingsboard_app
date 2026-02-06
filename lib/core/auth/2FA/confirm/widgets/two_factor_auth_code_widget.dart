import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/design_tokens.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_confirm_state.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_confirm_provider/two_factor_confirm_provider.dart';
import 'package:thingsboard_app/core/auth/2FA/two_fa_providers_helper.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

const noResendCodeProviders = {
  TwoFaProviderType.BACKUP_CODE,
  TwoFaProviderType.TOTP,
};

class EnterACodeWidget extends HookConsumerWidget {
  const EnterACodeWidget({super.key, required this.selectedProvider});
  final TwoFaProviderInfo selectedProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = getTwoFaProviderData(selectedProvider.type);
    final timerDuration = selectedProvider.minVerificationCodeSendPeriod ?? 0;
    final form = useMemoized(
      () => FormGroup({
        'code': FormControl(
          validators: [
            Validators.required,
            Validators.minLength(data.codeLength),
            Validators.maxLength(data.codeLength),
          ],
        ),
      }),
    );
    final timer = useAnimationController(
      duration: Duration(seconds: timerDuration),
    )..forward();
    final state = ref.watch(
      twoFactorConfirmProvider(
        selectedProvider.type,
        selectedProvider.minVerificationCodeSendPeriod,
      ),
    );
    ref.listen(
      twoFactorConfirmProvider(
        selectedProvider.type,
        selectedProvider.minVerificationCodeSendPeriod,
      ),
      (prev, next) {
        if (prev?.resendAvalible == true && !next.resendAvalible) {
          timer.reset();
          timer.reverse();
        }
        if ([
          CodeState.invalid,
          CodeState.tooManyRequests,
        ].contains(next.codeState)) {
          form.control('code').setErrors({
            (next.codeState == CodeState.invalid
                    ? TbValicationMessages.invalidCode
                    : TbValicationMessages.tooManyRequests):
                {},
          });
        }
      },
    );
    final animation = useAnimation(
      Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(CurvedAnimation(parent: timer, curve: Curves.linear)),
    );
    final currentSeconds = (animation * timerDuration).ceil();
    return Center(
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          spacing: 20,
          children: [
            Text(
              data.descFunction(context, selectedProvider.contact),
              style: TbTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            TbTextField(
              autoFocus: true,
              formControlName: 'code',
              label: data.placeholderFunction(context),
              onSubmit: () {
                submitCode(context, form, ref);
              },
              onMaxLengthReched: () {
                Future(() async {
                  if (context.mounted) {
                    await submitCode(context, form, ref);
                  }
                });
              },
              type: data.textInputType,
              autoFillHints: const [AutofillHints.oneTimeCode],
            ),
            if (!noResendCodeProviders.contains(selectedProvider.type))
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    !state.resendAvalible
                        ? Text(
                          S.of(context).resendCodeWait(currentSeconds),
                          style: TbTextStyles.labelMedium.copyWith(
                            color: AppColors.textDisabled,
                          ),
                        )
                        : TextButton(
                          style: TextButton.styleFrom(
                            padding: DesignTokens.paddigZero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            resendCode(ref, form);
                          },
                          child: Text(S.of(context).resendCode),
                        ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      context.push(
                        '${LoginRoutes.login}${LoginRoutes.mfaConfirm}?skipDefault=true',
                      );
                    },
                    child: Text(S.of(context).tryAnotherWay),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitCode(
    BuildContext context,
    FormGroup form,
    WidgetRef ref,
  ) async {
    FocusScope.of(context).unfocus();
    form.markAllAsTouched();

    if (form.invalid) {
      return;
    }
    final value = form.control('code').value.toString();
    await ref
        .read(
          twoFactorConfirmProvider(
            selectedProvider.type,
            selectedProvider.minVerificationCodeSendPeriod,
          ).notifier,
        )
        .verifyCode(value);
  }

  void resendCode(WidgetRef ref, FormGroup form) {
    ref
        .read(
          twoFactorConfirmProvider(
            selectedProvider.type,
            selectedProvider.minVerificationCodeSendPeriod,
          ).notifier,
        )
        .sendCode();
    form.control('code').patchValue('');
  }
}
