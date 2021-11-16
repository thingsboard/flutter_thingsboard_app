import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'signup_app_secret_provider.dart';

class SignUpPage extends TbPageWidget {

  SignUpPage(TbContext tbContext):
        super(tbContext);

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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
            children: [
              LoginPageBackground(),
              Positioned.fill(
                child: Column(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(24, 51, 24, 24),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                          children: [
                                            Container(
                                                height: 40,
                                                child: tbContext.wlService.loginLogoImage != null ? tbContext.wlService.loginLogoImage! : SizedBox(height: 25)
                                            )
                                          ]
                                      ),
                                      SizedBox(height: 16),
                                      if (tbContext.signUpParams!.signUpTextMessage != null && tbContext.signUpParams!.signUpTextMessage!.isNotEmpty)
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  tbContext.signUpParams!.signUpTextMessage!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFFAFAFAF),
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 14,
                                                      height: 24 / 24
                                                  )
                                              )]
                                        ),
                                      SizedBox(height: 32),
                                      FormBuilder(
                                          key: _signUpFormKey,
                                          autovalidateMode: AutovalidateMode.disabled,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              FormBuilderTextField(
                                                name: 'firstName',
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context, errorText: 'First name is required.')
                                                ]),
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                    border: OutlineInputBorder(),
                                                    labelText: 'First name *'
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              FormBuilderTextField(
                                                name: 'lastName',
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context, errorText: 'Last name is required.')
                                                ]),
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Last name *'
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              FormBuilderTextField(
                                                name: 'email',
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.required(context, errorText: 'Email is required.'),
                                                  FormBuilderValidators.email(context, errorText: 'Invalid email format.')
                                                ]),
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Email *'
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              ValueListenableBuilder(
                                                  valueListenable: _showPasswordNotifier,
                                                  builder: (BuildContext context, bool showPassword, child) {
                                                    return FormBuilderTextField(
                                                      name: 'password',
                                                      obscureText: !showPassword,
                                                      validator: FormBuilderValidators.compose([
                                                        FormBuilderValidators.required(context, errorText: 'Password is required.')
                                                      ]),
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                          suffixIcon: IconButton(
                                                            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                                                            onPressed: () {
                                                              _showPasswordNotifier.value = !_showPasswordNotifier.value;
                                                            },
                                                          ),
                                                          border: OutlineInputBorder(),
                                                          labelText: 'Create a password *'
                                                      ),
                                                    );
                                                  }
                                              ),
                                              SizedBox(height: 12),
                                              ValueListenableBuilder(
                                                  valueListenable: _showRepeatPasswordNotifier,
                                                  builder: (BuildContext context, bool showPassword, child) {
                                                    return FormBuilderTextField(
                                                      name: 'repeatPassword',
                                                      obscureText: !showPassword,
                                                      validator: FormBuilderValidators.compose([
                                                        FormBuilderValidators.required(context, errorText: 'Password is required.')
                                                      ]),
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                          suffixIcon: IconButton(
                                                            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                                                            onPressed: () {
                                                              _showRepeatPasswordNotifier.value = !_showRepeatPasswordNotifier.value;
                                                            },
                                                          ),
                                                          border: OutlineInputBorder(),
                                                          labelText: 'Repeat your password *'
                                                      ),
                                                    );
                                                  }
                                              ),
                                              SizedBox(height: 24),
                                              ValueListenableBuilder(
                                                  valueListenable: _recaptchaResponseNotifier,
                                                  builder: (BuildContext context, String? recaptchaResponse, child) {
                                                    bool hasRecaptchaResponse = recaptchaResponse != null && recaptchaResponse.isNotEmpty;
                                                    return TextButton(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              hasRecaptchaResponse ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                                                              color: Color(0xFF666666),
                                                            ),
                                                            SizedBox(width: 24),
                                                            Text('I\'m not a robot',
                                                                style: Theme.of(context).textTheme.bodyText2)
                                                          ],
                                                        ),
                                                        style: ButtonStyle(
                                                          alignment: Alignment.centerLeft,
                                                        ),
                                                        onPressed: () => {
                                                          hasRecaptchaResponse ? null : _openRecaptcha()
                                                        }
                                                    );
                                                  }
                                              ),
                                              if (tbContext.signUpParams!.showPrivacyPolicy != null && tbContext.signUpParams!.showPrivacyPolicy!)
                                                FormBuilderCheckbox(
                                                    title: Row(
                                                      children: [
                                                        Text('Accept', style: TextStyle(
                                                            fontSize: 14,
                                                            height: 20 / 14
                                                        )),
                                                        TextButton(
                                                          onPressed: () {
                                                            _openPrivacyPolicy();
                                                          },
                                                          child: Text(
                                                            'Privacy Policy',
                                                            style: TextStyle(color: Theme.of(context).colorScheme.primary,
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
                                                    decoration: InputDecoration.collapsed(hintText: 'Privacy policy')
                                                ),
                                              if (tbContext.signUpParams!.showTermsOfUse != null && tbContext.signUpParams!.showTermsOfUse!)
                                                FormBuilderCheckbox(
                                                    title: Row(
                                                      children: [
                                                        Text('Accept', style: TextStyle(
                                                            fontSize: 14,
                                                            height: 20 / 14
                                                        )),
                                                        TextButton(
                                                          onPressed: () {
                                                            _openTermsOfUse();
                                                          },
                                                          child: Text(
                                                            'Terms of Use',
                                                            style: TextStyle(color: Theme.of(context).colorScheme.primary,
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
                                                    decoration: InputDecoration.collapsed(hintText: 'Terms of Use')
                                                ),
                                            ],
                                          )
                                      )
                                    ]
                                ),
                              )
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                child: Text('Sign up'),
                                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                                onPressed: () {
                                  _signUp();
                                },
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account?', style: TextStyle(
                                      fontSize: 14,
                                      height: 20 / 14
                                  )),
                                  TextButton(
                                    onPressed: () {
                                      _login();
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(color: Theme.of(context).colorScheme.primary,
                                          letterSpacing: 1,
                                          fontSize: 14,
                                          height: 20 / 14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 16)
                            ],
                          )
                      )
                    ]
                )
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _isSignUpNotifier,
                  builder: (BuildContext context, bool loading, child) {
                    if (loading) {
                      var data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
                      var bottomPadding = data.padding.top;
                      bottomPadding += kToolbarHeight;
                      return SizedBox.expand(
                          child: ClipRect(
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                  child: Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.grey.shade200.withOpacity(0.2)
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: bottomPadding),
                                      alignment: Alignment.center,
                                      child: TbProgressIndicator(tbContext, size: 50.0),
                                    ),
                                  )
                              )
                          )
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }
              )
            ]
        )
    );
  }

  void _openRecaptcha() async {
    String? recaptchaResponse = await tbContext.navigateTo('/tbRecaptcha?siteKey=${tbContext.signUpParams!.captchaSiteKey!}', transition: TransitionType.nativeModal);
    _recaptchaResponseNotifier.value = recaptchaResponse;
  }

  void _openPrivacyPolicy() async {
    bool? acceptPrivacyPolicy = await tbContext.navigateTo('/signup/privacyPolicy', transition: TransitionType.nativeModal);
    if (acceptPrivacyPolicy == true) {
      _signUpFormKey.currentState?.fields['acceptPrivacyPolicy']!.didChange(acceptPrivacyPolicy);
    }
  }

  void _openTermsOfUse() async {
    bool? acceptTermsOfUse = await tbContext.navigateTo('/signup/termsOfUse', transition: TransitionType.nativeModal);
    if (acceptTermsOfUse == true) {
      _signUpFormKey.currentState?.fields['acceptTermsOfUse']!.didChange(acceptTermsOfUse);
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
        var appSecret = await SignUpAppSecretProvider.local().getSignUpAppSecret();
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
          var signupResult = await tbContext.tbClient.getSignupService().signup(
              signUpRequest);
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
      showErrorNotification('Entered passwords must be same!');
      return false;
    }
    if ((formValue['password'] as String).length < 6) {
      showErrorNotification('Your password must be at least 6 characters long');
      return false;
    }
    var recaptchaResponse = _recaptchaResponseNotifier.value;
    if (recaptchaResponse == null || recaptchaResponse.isEmpty) {
      showErrorNotification('You must confirm that you are not a robot');
      return false;
    }
    if (tbContext.signUpParams!.showPrivacyPolicy != null && tbContext.signUpParams!.showPrivacyPolicy!
        && formValue['acceptPrivacyPolicy'] != true) {
      showErrorNotification('You must accept our Privacy Policy');
      return false;
    }
    if (tbContext.signUpParams!.showTermsOfUse != null && tbContext.signUpParams!.showTermsOfUse!
        && formValue['acceptTermsOfUse'] != true) {
      showErrorNotification('You must accept our Terms of Use');
      return false;
    }
    return true;
  }

  void _promptToResendEmailVerification(String email) async {
    var res = await confirm(
        title: 'Inactive user already exists',
        message: 'There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email.',
        cancel: 'Cancel',
        ok: 'Resend');
    if (res == true) {
      await tbClient.getSignupService().resendEmailActivation(email, pkgName: tbContext.packageName);
      log.info('Resend email activation!');
      navigateTo('/signup/emailVerification?email=' + email);
    }
  }


}
