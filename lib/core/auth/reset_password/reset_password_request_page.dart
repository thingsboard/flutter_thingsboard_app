import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/ui/visibility_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class ResetPasswordRequestPage extends HookConsumerWidget {
  const ResetPasswordRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useMemoized(
      () => FormGroup({
        "email": FormControl(
          validators: [Validators.required, Validators.email],
        ),
      }),
    );
    final isLoading = useState(false);
    return Scaffold(
      appBar: TbAppBar(title: Text(S.of(context).passwordReset)),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    S.of(context).passwordResetText,
                    textAlign: TextAlign.center,
                    style: TbTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  TbTextField(
                    formControlName: 'email',
                    hint: S.of(context).email,
                    label: S.of(context).email,
                  ),

                  ReactiveFormConsumer(
                    builder: (context, form, _) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                                onPressed:
                                    form.invalid && form.touched
                                        ? null
                                        : () {
                                          _requestPasswordReset(
                                            context,
                                            form,
                                            ref,
                                            isLoading,
                                          );
                                        },
                                child: Text(S.of(context).requestPasswordReset),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedVisibilityWidget(
            show: isLoading.value,
            child: const FullScreenLoader(),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPasswordReset(
    BuildContext context,
    FormGroup form,
    WidgetRef ref,
    ValueNotifier<bool> isLoading,
  ) async {
    FocusScope.of(context).unfocus();
    form.markAllAsTouched();
    if (form.invalid) {
      return;
    }
    isLoading.value = true;
    final formValue = form.control('email').value.toString();
    try {
      await getIt<ITbClientService>().client.sendResetPasswordLink(formValue);
      getIt<IOverlayService>().showSuccessNotification(
        (_) => S.of(context).emailVerificationSentText,
      );
    } catch (e) {
      getIt<TbLogger>().error(e);
        getIt<IOverlayService>().showErrorNotification(
        (_) => "${S.of(context).fatalError}: $e",
      );
    }
    isLoading.value = false;
  }
}
