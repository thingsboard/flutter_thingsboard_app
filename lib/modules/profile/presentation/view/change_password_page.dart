// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _isLoadingNotifier = ValueNotifier<bool>(false);
  final IOverlayService overlayService = getIt();
  final _showCurrentPasswordNotifier = ValueNotifier<bool>(false);
  final _showNewPasswordNotifier = ValueNotifier<bool>(false);
  final _showNewPassword2Notifier = ValueNotifier<bool>(false);

  final _form = FormGroup({
    'currentPassword': FormControl<String>(validators: [Validators.required]),
    'newPassword': FormControl<String>(validators: [Validators.required]),
    'newPassword2': FormControl<String>(validators: [Validators.required]),
  });

  @override
  void dispose() {
    _form.dispose();
    _isLoadingNotifier.dispose();
    _showCurrentPasswordNotifier.dispose();
    _showNewPasswordNotifier.dispose();
    _showNewPassword2Notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(title: Text(S.of(context).changePassword)),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: ReactiveForm(
                  formGroup: _form,
                  // Lets the password manager offer and save the new password.
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        ValueListenableBuilder(
                          valueListenable: _showCurrentPasswordNotifier,
                          builder:
                              (BuildContext context, bool showPassword, child) {
                                return ReactiveTextField<String>(
                                  textDirection: TextDirection.ltr,
                                  formControlName: 'currentPassword',
                                  autofillHints: const [AutofillHints.password],
                                  obscureText: !showPassword,
                                  autofocus: true,
                                  validationMessages: {
                                    ValidationMessage.required: (_) => S
                                        .of(context)
                                        .currentPasswordRequireText,
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        _showCurrentPasswordNotifier.value =
                                            !_showCurrentPasswordNotifier.value;
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                    labelText:
                                        "${S.of(context).currentPassword} *",
                                  ),
                                );
                              },
                        ),
                        const SizedBox(height: 24),
                        ValueListenableBuilder(
                          valueListenable: _showNewPasswordNotifier,
                          builder:
                              (BuildContext context, bool showPassword, child) {
                                return ReactiveTextField<String>(
                                  textDirection: TextDirection.ltr,
                                  formControlName: 'newPassword',
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  obscureText: !showPassword,
                                  validationMessages: {
                                    ValidationMessage.required: (_) =>
                                        S.of(context).newPasswordRequireText,
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        _showNewPasswordNotifier.value =
                                            !_showNewPasswordNotifier.value;
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                    labelText: '${S.of(context).newPassword} *',
                                  ),
                                );
                              },
                        ),
                        const SizedBox(height: 24),
                        ValueListenableBuilder(
                          valueListenable: _showNewPassword2Notifier,
                          builder:
                              (BuildContext context, bool showPassword, child) {
                                return ReactiveTextField<String>(
                                  textDirection: TextDirection.ltr,
                                  formControlName: 'newPassword2',
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  obscureText: !showPassword,
                                  validationMessages: {
                                    ValidationMessage.required: (_) =>
                                        S.of(context).newPassword2RequireText,
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        _showNewPassword2Notifier.value =
                                            !_showNewPassword2Notifier.value;
                                      },
                                    ),
                                    border: const OutlineInputBorder(),
                                    labelText:
                                        '${S.of(context).newPassword2} *',
                                  ),
                                );
                              },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            alignment: AlignmentDirectional.centerStart,
                          ),
                          onPressed: () {
                            _changePassword();
                          },
                          child: Center(
                            child: Text(S.of(context).changePassword),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isLoadingNotifier,
            builder: (BuildContext context, bool loading, child) {
              if (loading) {
                return const SizedBox.expand(
                  child: ColoredBox(
                    color: Color(0x99FFFFFF),
                    child: Center(child: TbProgressIndicator(size: 50.0)),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _changePassword() async {
    FocusScope.of(context).unfocus();
    _form.markAllAsTouched();
    if (_form.valid) {
      final formValue = _form.value;
      final String currentPassword = formValue['currentPassword'].toString();
      final String newPassword = formValue['newPassword'].toString();
      final String newPassword2 = formValue['newPassword2'].toString();
      if (newPassword != newPassword2) {
        overlayService.showErrorNotification(
          (_) => S.of(context).passwordErrorNotification,
        );
      } else {
        _isLoadingNotifier.value = true;
        try {
          await Future.delayed(const Duration(milliseconds: 300));
          final client = getIt<ITbClientService>().client;
          // Stores the JWT pair the server rotates on a password change, so
          // the session stays valid.
          await client.changePassword(currentPassword, newPassword);
          if (mounted) {
            context.pop(true);
          }
        } catch (e) {
          _isLoadingNotifier.value = false;
        }
      }
    }
  }
}
