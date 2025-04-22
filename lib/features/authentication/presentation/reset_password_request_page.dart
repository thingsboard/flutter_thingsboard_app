import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/features/authentication/presentation/widgets/login_page_background.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/ui/tost_notifications_extension.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ResetPasswordRequestPage extends StatelessWidget {
  ResetPasswordRequestPage({super.key});

  final _isLoadingNotifier = ValueNotifier<bool>(false);
  final _resetPasswordFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginPageBackground(),
          SizedBox.expand(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: TbAppBar(
                title: Text(S.of(context).passwordReset),
              ),
              body: Stack(
                children: [
                  SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: FormBuilder(
                        key: _resetPasswordFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              S.of(context).passwordResetText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 14,
                                height: 24 / 14,
                              ),
                            ),
                            const SizedBox(height: 61),
                            FormBuilderTextField(
                              name: 'email',
                              autofocus: true,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                    errorText: S.of(context).emailRequireText,
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: S.of(context).emailInvalidText,
                                  ),
                                ],
                              ),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: '${S.of(context).email} *',
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                _requestPasswordReset(context);
                              },
                              child: Text(
                                S.of(context).requestPasswordReset,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isLoadingNotifier,
                    builder: (BuildContext context, bool loading, child) {
                      if (loading) {
                        return SizedBox.expand(
                          child: Container(
                            color: const Color(0x99FFFFFF),
                            child: const Center(
                              child: TbProgressIndicator(size: 50.0),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _requestPasswordReset(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (_resetPasswordFormKey.currentState?.saveAndValidate() ?? false) {
      var formValue = _resetPasswordFormKey.currentState!.value;
      String email = formValue['email'];
      _isLoadingNotifier.value = true;

      try {
        await Future.delayed(const Duration(milliseconds: 300));

        // TODO rework!
        await getIt<ITbClientService>().sendResetPasswordLink(email);
        _isLoadingNotifier.value = false;
        if (context.mounted) {
          context.showSuccessNotification(
            S.of(context).passwordResetLinkSuccessfullySentNotification,
          );
        }
      } catch (e) {
        _isLoadingNotifier.value = false;
      }
    }
  }
}
