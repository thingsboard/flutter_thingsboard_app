import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ChangePasswordPage extends TbContextWidget {
  ChangePasswordPage(TbContext tbContext) : super(tbContext);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends TbContextState<ChangePasswordPage> {
  final _isLoadingNotifier = ValueNotifier<bool>(false);

  final _showCurrentPasswordNotifier = ValueNotifier<bool>(false);
  final _showNewPasswordNotifier = ValueNotifier<bool>(false);
  final _showNewPassword2Notifier = ValueNotifier<bool>(false);

  final _changePasswordFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TbAppBar(
          tbContext,
          title: Text('${S.of(context).changePassword}'),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                      child: FormBuilder(
                    key: _changePasswordFormKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 16),
                          ValueListenableBuilder(
                              valueListenable: _showCurrentPasswordNotifier,
                              builder: (BuildContext context, bool showPassword,
                                  child) {
                                return FormBuilderTextField(
                                  name: 'currentPassword',
                                  obscureText: !showPassword,
                                  autofocus: true,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText:
                                            '${S.of(context).currentPasswordRequireText}')
                                  ]),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          _showCurrentPasswordNotifier.value =
                                              !_showCurrentPasswordNotifier
                                                  .value;
                                        },
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText:
                                          '${S.of(context).currentPasswordStar}'),
                                );
                              }),
                          SizedBox(height: 24),
                          ValueListenableBuilder(
                              valueListenable: _showNewPasswordNotifier,
                              builder: (BuildContext context, bool showPassword,
                                  child) {
                                return FormBuilderTextField(
                                  name: 'newPassword',
                                  obscureText: !showPassword,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText:
                                            '${S.of(context).newPasswordRequireText}')
                                  ]),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          _showNewPasswordNotifier.value =
                                              !_showNewPasswordNotifier.value;
                                        },
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText:
                                          '${S.of(context).newPasswordStar}'),
                                );
                              }),
                          SizedBox(height: 24),
                          ValueListenableBuilder(
                              valueListenable: _showNewPassword2Notifier,
                              builder: (BuildContext context, bool showPassword,
                                  child) {
                                return FormBuilderTextField(
                                  name: 'newPassword2',
                                  obscureText: !showPassword,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText:
                                            '${S.of(context).newPassword2RequireText}')
                                  ]),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          _showNewPassword2Notifier.value =
                                              !_showNewPassword2Notifier.value;
                                        },
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText:
                                          '${S.of(context).newPassword2Star}'),
                                );
                              }),
                          SizedBox(height: 24),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(16),
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                _changePassword();
                              },
                              child: Center(
                                  child:
                                      Text('${S.of(context).changePassword}')))
                        ]),
                  ))),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _isLoadingNotifier,
                builder: (BuildContext context, bool loading, child) {
                  if (loading) {
                    return SizedBox.expand(
                        child: Container(
                      color: Color(0x99FFFFFF),
                      child: Center(child: TbProgressIndicator(size: 50.0)),
                    ));
                  } else {
                    return SizedBox.shrink();
                  }
                })
          ],
        ));
  }

  Future<void> _changePassword() async {
    FocusScope.of(context).unfocus();
    if (_changePasswordFormKey.currentState?.saveAndValidate() ?? false) {
      var formValue = _changePasswordFormKey.currentState!.value;
      String currentPassword = formValue['currentPassword'];
      String newPassword = formValue['newPassword'];
      String newPassword2 = formValue['newPassword2'];
      if (newPassword != newPassword2) {
        showErrorNotification('${S.of(context).passwordErrorNotification}');
      } else {
        _isLoadingNotifier.value = true;
        try {
          await Future.delayed(Duration(milliseconds: 300));
          await tbClient.changePassword(currentPassword, newPassword);
          pop(true);
        } catch (e) {
          _isLoadingNotifier.value = false;
        }
      }
    }
  }
}
