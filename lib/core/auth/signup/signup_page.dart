import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'signup_app_secret_provider.dart';

class SignUpPage extends TbPageWidget {
  SignUpPage(TbContext tbContext) : super(tbContext);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends TbPageState<SignUpPage> {
  final _isSignUpNotifier = ValueNotifier<bool>(false);
  final _showPasswordNotifier = ValueNotifier<bool>(false);
  final _showRepeatPasswordNotifier = ValueNotifier<bool>(false);
  final _recaptchaResponseNotifier = ValueNotifier<String?>(null);

  final _signUpFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<bool> willPop() async {
    navigateTo('/login', replace: true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          LoginPageBackground(),
          Positioned.fill(
              child: Column(children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 51, 24, 24),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(children: [
                              Container(
                                  height: 40,
                                  child:
                                      tbContext.wlService.loginLogoImage != null
                                          ? tbContext.wlService.loginLogoImage!
                                          : SizedBox(height: 25))
                            ]),
                            SizedBox(height: 16),
                            if (tbContext.signUpParams!.signUpTextMessage !=
                                    null &&
                                tbContext.signUpParams!.signUpTextMessage!
                                    .isNotEmpty)
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Text(
                                            tbContext.signUpParams!
                                                .signUpTextMessage!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFFAFAFAF),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                height: 24 / 24)))
                                  ]),
                            SizedBox(height: 32),
                            FormBuilder(
                                key: _signUpFormKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    FormBuilderTextField(
                                      name: 'firstName',
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                            errorText:
                                                '${S.of(context).firstNameRequireText}')
                                      ]),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          border: OutlineInputBorder(),
                                          labelText:
                                              '${S.of(context).firstNameStar}'),
                                    ),
                                    SizedBox(height: 12),
                                    FormBuilderTextField(
                                      name: 'lastName',
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                            errorText:
                                                '${S.of(context).lastNameRequireText}')
                                      ]),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          border: OutlineInputBorder(),
                                          labelText:
                                              '${S.of(context).lastNameStar}'),
                                    ),
                                    SizedBox(height: 12),
                                    FormBuilderTextField(
                                      name: 'email',
                                      keyboardType: TextInputType.emailAddress,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                            errorText:
                                                '${S.of(context).emailRequireText}'),
                                        FormBuilderValidators.email(
                                            errorText:
                                                '${S.of(context).emailInvalidText}')
                                      ]),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          border: OutlineInputBorder(),
                                          labelText:
                                              '${S.of(context).emailStar}'),
                                    ),
                                    SizedBox(height: 12),
                                    ValueListenableBuilder(
                                        valueListenable: _showPasswordNotifier,
                                        builder: (BuildContext context,
                                            bool showPassword, child) {
                                          return FormBuilderTextField(
                                            name: 'password',
                                            obscureText: !showPassword,
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                  errorText:
                                                      '${S.of(context).passwordRequireText}')
                                            ]),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                suffixIcon: IconButton(
                                                  icon: Icon(showPassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    _showPasswordNotifier
                                                            .value =
                                                        !_showPasswordNotifier
                                                            .value;
                                                  },
                                                ),
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    '${S.of(context).createPasswordStar}'),
                                          );
                                        }),
                                    SizedBox(height: 12),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            _showRepeatPasswordNotifier,
                                        builder: (BuildContext context,
                                            bool showPassword, child) {
                                          return FormBuilderTextField(
                                            name: 'repeatPassword',
                                            obscureText: !showPassword,
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                  errorText:
                                                      '${S.of(context).passwordRequireText}')
                                            ]),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                suffixIcon: IconButton(
                                                  icon: Icon(showPassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    _showRepeatPasswordNotifier
                                                            .value =
                                                        !_showRepeatPasswordNotifier
                                                            .value;
                                                  },
                                                ),
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    '${S.of(context).repeatPasswordStar}'),
                                          );
                                        }),
                                    SizedBox(height: 24),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            _recaptchaResponseNotifier,
                                        builder: (BuildContext context,
                                            String? recaptchaResponse, child) {
                                          bool hasRecaptchaResponse =
                                              recaptchaResponse != null &&
                                                  recaptchaResponse.isNotEmpty;
                                          return TextButton(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    hasRecaptchaResponse
                                                        ? Icons
                                                            .check_box_outlined
                                                        : Icons
                                                            .check_box_outline_blank,
                                                    color: Color(0xFF666666),
                                                  ),
                                                  SizedBox(width: 24),
                                                  Text(
                                                      '${S.of(context).imNotARobot}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium)
                                                ],
                                              ),
                                              style: ButtonStyle(
                                                alignment: Alignment.centerLeft,
                                              ),
                                              onPressed: () => {
                                                    hasRecaptchaResponse
                                                        ? null
                                                        : _openRecaptcha()
                                                  });
                                        }),
                                    if (tbContext.signUpParams!
                                                .showPrivacyPolicy !=
                                            null &&
                                        tbContext
                                            .signUpParams!.showPrivacyPolicy!)
                                      FormBuilderCheckbox(
                                          title: Row(
                                            children: [
                                              Text('${S.of(context).accept}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      height: 20 / 14)),
                                              TextButton(
                                                onPressed: () {
                                                  _openPrivacyPolicy();
                                                },
                                                child: Text(
                                                  '${S.of(context).privacyPolicy}',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      height: 20 / 14),
                                                ),
                                              )
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          name: 'acceptPrivacyPolicy',
                                          initialValue: false,
                                          decoration: InputDecoration.collapsed(
                                              hintText:
                                                  '${S.of(context).privacyPolicy}')),
                                    if (tbContext
                                                .signUpParams!.showTermsOfUse !=
                                            null &&
                                        tbContext.signUpParams!.showTermsOfUse!)
                                      FormBuilderCheckbox(
                                          title: Row(
                                            children: [
                                              Text('${S.of(context).accept}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      height: 20 / 14)),
                                              TextButton(
                                                onPressed: () {
                                                  _openTermsOfUse();
                                                },
                                                child: Text(
                                                  '${S.of(context).termsOfUse}',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      height: 20 / 14),
                                                ),
                                              )
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          name: 'acceptTermsOfUse',
                                          initialValue: false,
                                          decoration: InputDecoration.collapsed(
                                              hintText:
                                                  '${S.of(context).termsOfUse}')),
                                  ],
                                ))
                          ]),
                    ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text('${S.of(context).signUp}'),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      onPressed: () {
                        _signUp();
                      },
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${S.of(context).alreadyHaveAnAccount}',
                            style: TextStyle(fontSize: 14, height: 20 / 14)),
                        TextButton(
                          onPressed: () {
                            _login();
                          },
                          child: Text(
                            '${S.of(context).signIn}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                letterSpacing: 1,
                                fontSize: 14,
                                height: 20 / 14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16)
                  ],
                ))
          ])),
          ValueListenableBuilder<bool>(
              valueListenable: _isSignUpNotifier,
              builder: (BuildContext context, bool loading, child) {
                if (loading) {
                  var data = MediaQueryData.fromView(View.of(context));
                  var bottomPadding = data.padding.top;
                  bottomPadding += kToolbarHeight;
                  return SizedBox.expand(
                      child: ClipRect(
                          child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                decoration: new BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.2)),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(bottom: bottomPadding),
                                  alignment: Alignment.center,
                                  child: TbProgressIndicator(tbContext,
                                      size: 50.0),
                                ),
                              ))));
                } else {
                  return SizedBox.shrink();
                }
              })
        ]));
  }

  void _openRecaptcha() async {
    String? recaptchaResponse = await tbContext.navigateTo(
        '/tbRecaptcha?siteKey=${tbContext.signUpParams!.captchaSiteKey!}',
        transition: TransitionType.nativeModal);
    _recaptchaResponseNotifier.value = recaptchaResponse;
  }

  void _openPrivacyPolicy() async {
    bool? acceptPrivacyPolicy = await tbContext.navigateTo(
        '/signup/privacyPolicy',
        transition: TransitionType.nativeModal);
    if (acceptPrivacyPolicy == true) {
      _signUpFormKey.currentState?.fields['acceptPrivacyPolicy']!
          .didChange(acceptPrivacyPolicy);
    }
  }

  void _openTermsOfUse() async {
    bool? acceptTermsOfUse = await tbContext.navigateTo('/signup/termsOfUse',
        transition: TransitionType.nativeModal);
    if (acceptTermsOfUse == true) {
      _signUpFormKey.currentState?.fields['acceptTermsOfUse']!
          .didChange(acceptTermsOfUse);
    }
  }

  void _login() async {
    navigateTo('/login', replace: true);
  }

  void _signUp() async {
    FocusScope.of(context).unfocus();
    if (_signUpFormKey.currentState?.saveAndValidate() ?? false) {
      var formValue = _signUpFormKey.currentState!.value;
      if (_validateSignUpRequest(formValue)) {
        var appSecret =
            await SignUpAppSecretProvider.local().getSignUpAppSecret();
        var signUpRequest = SignUpRequest(
            firstName: formValue['firstName'],
            lastName: formValue['lastName'],
            email: formValue['email'],
            password: formValue['password'],
            recaptchaResponse: _recaptchaResponseNotifier.value!,
            pkgName: tbContext.packageName,
            appSecret: appSecret);
        _isSignUpNotifier.value = true;
        try {
          var signupResult =
              await tbContext.tbClient.getSignupService().signup(signUpRequest);
          if (signupResult == SignUpResult.INACTIVE_USER_EXISTS) {
            _recaptchaResponseNotifier.value = null;
            _isSignUpNotifier.value = false;
            _promptToResendEmailVerification(formValue['email']);
          } else {
            log.info('Sign up success!');
            _isSignUpNotifier.value = false;
            _recaptchaResponseNotifier.value = null;
            navigateTo('/signup/emailVerification?email=' + formValue['email']);
          }
        } catch (e) {
          _recaptchaResponseNotifier.value = null;
          _isSignUpNotifier.value = false;
        }
      }
    }
  }

  bool _validateSignUpRequest(Map<String, dynamic> formValue) {
    if (formValue['password'] != formValue['repeatPassword']) {
      showErrorNotification('${S.of(context).passwordErrorNotification}');
      return false;
    }
    if ((formValue['password'] as String).length < 6) {
      showErrorNotification('${S.of(context).invalidPasswordLengthMessage}');
      return false;
    }
    var recaptchaResponse = _recaptchaResponseNotifier.value;
    if (recaptchaResponse == null || recaptchaResponse.isEmpty) {
      showErrorNotification('${S.of(context).confirmNotRobotMessage}');
      return false;
    }
    if (tbContext.signUpParams!.showPrivacyPolicy != null &&
        tbContext.signUpParams!.showPrivacyPolicy! &&
        formValue['acceptPrivacyPolicy'] != true) {
      showErrorNotification('${S.of(context).acceptPrivacyPolicyMessage}');
      return false;
    }
    if (tbContext.signUpParams!.showTermsOfUse != null &&
        tbContext.signUpParams!.showTermsOfUse! &&
        formValue['acceptTermsOfUse'] != true) {
      showErrorNotification('${S.of(context).acceptTermsOfUseMessage}');
      return false;
    }
    return true;
  }

  void _promptToResendEmailVerification(String email) async {
    var res = await confirm(
        title: '${S.of(context).inactiveUserAlreadyExists}',
        message: '${S.of(context).inactiveUserAlreadyExistsMessage}',
        cancel: '${S.of(context).cancel}',
        ok: '${S.of(context).resend}');
    if (res == true) {
      await tbClient
          .getSignupService()
          .resendEmailActivation(email, pkgName: tbContext.packageName);
      log.info('Resend email activation!');
      navigateTo('/signup/emailVerification?email=' + email);
    }
  }
}
