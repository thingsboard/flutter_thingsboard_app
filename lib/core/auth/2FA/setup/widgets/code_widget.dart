import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_auth_provider_login_data.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class CodeWidget extends HookWidget {
  const CodeWidget({
    super.key,
    required this.onSubmnit,
    required this.title,
    required this.resendTimeoutSeconds,
    required this.data,
    required this.resend,
  });
  final void Function(AbstractControl control) onSubmnit;
  final String title;
  final VoidCallback resend;
  final int resendTimeoutSeconds;
  final TwoFactorAuthProviderLoginData data;
  @override
  Widget build(BuildContext context) {
    final timer = useAnimationController(
      duration: Duration(seconds: resendTimeoutSeconds),
    )..forward();
    final animation = useAnimation(
      Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(CurvedAnimation(parent: timer, curve: Curves.linear)),
    );
    final currentSeconds = (animation * resendTimeoutSeconds).ceil();

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

    return ReactiveForm(
      formGroup: form,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text(
              title,
              style: TbTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            TbTextField(
              formControlName: 'code',
              label: data.nameFunction(context),
              hint: data.placeholderFunction(context),
              type: data.textInputType,
              autoFillHints: const [AutofillHints.oneTimeCode],
              autoFocus: true,
              onMaxLengthReched: () {
                FocusScope.of(context).unfocus();
                form.markAllAsTouched();
                if (form.control('code').valid) {
                  onSubmnit(form.control('code'));
                }
              },
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: currentSeconds != 0
                  ? Text(
                      S.of(context).resendCodeWait(currentSeconds),
                      style: TbTextStyles.labelMedium.copyWith(
                        color: AppColors.textDisabled,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        resend();
                        timer.reset();
                        timer.forward();
                      },
                      child: Text(S.of(context).resendCode),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
