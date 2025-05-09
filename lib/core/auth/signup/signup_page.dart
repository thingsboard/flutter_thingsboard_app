import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_action.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_client.dart';
import 'package:thingsboard_app/core/auth/login/bloc/bloc.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/auth/oauth2/app_secret_provider.dart';
import 'package:thingsboard_app/core/auth/signup/signup_field_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class SignUpPage extends TbPageWidget {
  SignUpPage(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends TbPageState<SignUpPage> {
  final _isSignUpNotifier = ValueNotifier<bool>(false);
  final _recaptchaResponseNotifier = ValueNotifier<String?>(null);

  final _signUpFormKey = GlobalKey<FormBuilderState>();
  bool _showPassword = false;

  @override
  Future<bool> willPop() async {
    navigateTo('/login', replace: true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(tbClient: tbClient, tbContext: tbContext)
        ..add(
          AuthFetchEvent(
            packageName: tbContext.packageName,
            platformType: tbContext.platformType,
          ),
        ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state) {
            case AuthLoadingState():
              return SizedBox.expand(
                child: Container(
                  color: const Color(0x99FFFFFF),
                  child: Center(
                    child: TbProgressIndicator(tbContext, size: 50.0),
                  ),
                ),
              );

            case AuthDataState():
              return Scaffold(
                body: Stack(
                  children: [
                    const LoginPageBackground(),
                    Positioned.fill(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(24, 51, 24, 24),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: tbContext.wlService
                                                      .loginLogoImage !=
                                                  null
                                              ? tbContext
                                                  .wlService.loginLogoImage!
                                              : const SizedBox(height: 25),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    if (state.selfRegistrationParams!.title !=
                                            null &&
                                        state.selfRegistrationParams!.title!
                                            .isNotEmpty)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              state.selfRegistrationParams!
                                                  .title!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFFAFAFAF),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                height: 24 / 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    FormBuilder(
                                      key: _signUpFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              final field = state
                                                  .selfRegistrationParams!
                                                  .fields[index];
                                              final passwordFiled = field.id ==
                                                      SignUpFieldsId.password ||
                                                  field.id ==
                                                      SignUpFieldsId
                                                          .repeat_password;

                                              return SingUpFieldWidget(
                                                field: state
                                                    .selfRegistrationParams!
                                                    .fields[index],
                                                suffixIcon: passwordFiled
                                                    ? IconButton(
                                                        icon: Icon(
                                                          _showPassword
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _showPassword =
                                                                !_showPassword;
                                                          });
                                                        },
                                                      )
                                                    : null,
                                                obscureText: passwordFiled
                                                    ? !_showPassword
                                                    : false,
                                              );
                                            },
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 12),
                                            itemCount: state
                                                .selfRegistrationParams!
                                                .fields
                                                .length,
                                          ),
                                          const SizedBox(height: 24),
                                          ValueListenableBuilder(
                                            valueListenable:
                                                _recaptchaResponseNotifier,
                                            builder: (
                                              BuildContext context,
                                              String? recaptchaResponse,
                                              child,
                                            ) {
                                              bool hasRecaptchaResponse =
                                                  recaptchaResponse != null &&
                                                      recaptchaResponse
                                                          .isNotEmpty;
                                              return TextButton(
                                                style: const ButtonStyle(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                                onPressed: () =>
                                                    hasRecaptchaResponse
                                                        ? null
                                                        : _openRecaptcha(
                                                            state
                                                                .selfRegistrationParams!,
                                                            state
                                                                .recaptchaClient,
                                                          ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      hasRecaptchaResponse
                                                          ? Icons
                                                              .check_box_outlined
                                                          : Icons
                                                              .check_box_outline_blank,
                                                      color: const Color(
                                                        0xFF666666,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 24),
                                                    Text(
                                                      S.of(context).imNotARobot,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          if (state.selfRegistrationParams!
                                              .showPrivacyPolicy)
                                            FormBuilderCheckbox(
                                              title: Row(
                                                children: [
                                                  Text(
                                                    S.of(context).accept,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      height: 20 / 14,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      _openPrivacyPolicy();
                                                    },
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .privacyPolicy,
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        letterSpacing: 1,
                                                        fontSize: 14,
                                                        height: 20 / 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              name: 'acceptPrivacyPolicy',
                                              initialValue: false,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText:
                                                    S.of(context).privacyPolicy,
                                              ),
                                            ),
                                          if (state.selfRegistrationParams!
                                              .showTermsOfUse)
                                            FormBuilderCheckbox(
                                              title: Row(
                                                children: [
                                                  Text(
                                                    S.of(context).accept,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      height: 20 / 14,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      _openTermsOfUse();
                                                    },
                                                    child: Text(
                                                      S.of(context).termsOfUse,
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        letterSpacing: 1,
                                                        fontSize: 14,
                                                        height: 20 / 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              name: 'acceptTermsOfUse',
                                              initialValue: false,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText:
                                                    S.of(context).termsOfUse,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    _signUp(state.selfRegistrationParams!);
                                  },
                                  child: Text(
                                    S.of(context).signUp,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).alreadyHaveAnAccount,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        height: 20 / 14,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _login();
                                      },
                                      child: Text(
                                        S.of(context).signIn,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          letterSpacing: 1,
                                          fontSize: 14,
                                          height: 20 / 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isSignUpNotifier,
                      builder: (BuildContext context, bool loading, child) {
                        if (loading) {
                          final data =
                              MediaQueryData.fromView(View.of(context));
                          var bottomPadding = data.padding.top;
                          bottomPadding += kToolbarHeight;

                          return SizedBox.expand(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5.0,
                                  sigmaY: 5.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.2),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      bottom: bottomPadding,
                                    ),
                                    alignment: Alignment.center,
                                    child: TbProgressIndicator(
                                      tbContext,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
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
              );
          }
        },
      ),
    );
  }

  void _openRecaptcha(
    MobileSelfRegistrationParams signUpParams,
    RecaptchaClient? recaptchaClient,
  ) async {
    try {
      if (signUpParams.recaptcha.version == 'enterprise') {
        _recaptchaResponseNotifier.value = await recaptchaClient?.execute(
          RecaptchaAction.SIGNUP(),
          timeout: 10000,
        );
      } else {
        final recaptchaResponse = await tbContext.navigateTo(
          '/tbRecaptcha?siteKey=${signUpParams.recaptcha.siteKey}'
          '&version=${signUpParams.recaptcha.version}'
          '&logActionName=${signUpParams.recaptcha.logActionName}',
          transition: TransitionType.nativeModal,
        );

        _recaptchaResponseNotifier.value = recaptchaResponse;
      }
    } on PlatformException catch (e) {
      tbContext.showErrorNotification(e.message ?? '');
    } catch (e) {
      tbContext.showErrorNotification(e.toString());
    }
  }

  void _openPrivacyPolicy() async {
    bool? acceptPrivacyPolicy = await tbContext.navigateTo(
      '/signup/privacyPolicy',
      transition: TransitionType.nativeModal,
    );
    if (acceptPrivacyPolicy == true) {
      _signUpFormKey.currentState?.fields['acceptPrivacyPolicy']!
          .didChange(acceptPrivacyPolicy);
    }
  }

  void _openTermsOfUse() async {
    bool? acceptTermsOfUse = await tbContext.navigateTo(
      '/signup/termsOfUse',
      transition: TransitionType.nativeModal,
    );
    if (acceptTermsOfUse == true) {
      _signUpFormKey.currentState?.fields['acceptTermsOfUse']!
          .didChange(acceptTermsOfUse);
    }
  }

  void _login() async {
    navigateTo('/login', replace: true);
  }

  void _signUp(MobileSelfRegistrationParams signUpParams) async {
    FocusScope.of(context).unfocus();
    if (_signUpFormKey.currentState?.saveAndValidate() ?? false) {
      final formValue = _signUpFormKey.currentState!.value;
      if (_validateSignUpRequest(formValue, signUpParams)) {
        final appSecret = await AppSecretProvider.local().getAppSecret(
          tbContext.platformType,
        );
        final signUpRequest = SignUpRequest(
          fields: Map<SignUpFieldsId, String>.fromEntries(
            signUpParams.fields
                .where((e) => e.id != SignUpFieldsId.undefined)
                .map(
                  (e) => MapEntry(
                    e.id,
                    '${formValue[e.id.toShortString()]}',
                  ),
                )
                .where((e) => e.value != 'null'),
          ),
          recaptchaResponse: _recaptchaResponseNotifier.value!,
          pkgName: tbContext.packageName,
          appSecret: appSecret,
          platform: tbContext.platformType,
        );

        _isSignUpNotifier.value = true;

        try {
          final signupResult =
              await tbContext.tbClient.getSignupService().signup(signUpRequest);
          if (signupResult == SignUpResult.INACTIVE_USER_EXISTS) {
            _recaptchaResponseNotifier.value = null;
            _isSignUpNotifier.value = false;
            _promptToResendEmailVerification(
              formValue[SignUpFieldsId.email.toShortString()],
            );
          } else {
            log.info('Sign up success!');
            _isSignUpNotifier.value = false;
            _recaptchaResponseNotifier.value = null;
            navigateTo(
              '/signup/emailVerification?'
              'email=${formValue[SignUpFieldsId.email.toShortString()]}',
            );
          }
        } catch (_) {
          _recaptchaResponseNotifier.value = null;
          _isSignUpNotifier.value = false;
        }
      }
    }
  }

  bool _validateSignUpRequest(
    Map<String, dynamic> formValue,
    MobileSelfRegistrationParams signUpParams,
  ) {
    if (formValue[SignUpFieldsId.password.toShortString()] !=
        formValue[SignUpFieldsId.repeat_password.toShortString()]) {
      showErrorNotification(S.of(context).passwordErrorNotification);
      return false;
    } else if (formValue[SignUpFieldsId.password.toShortString()].length < 6) {
      showErrorNotification(S.of(context).invalidPasswordLengthMessage);
      return false;
    }

    final recaptchaResponse = _recaptchaResponseNotifier.value;
    if (recaptchaResponse == null || recaptchaResponse.isEmpty) {
      showErrorNotification(S.of(context).confirmNotRobotMessage);
      return false;
    }
    if (signUpParams.showPrivacyPolicy &&
        formValue['acceptPrivacyPolicy'] != true) {
      showErrorNotification(S.of(context).acceptPrivacyPolicyMessage);
      return false;
    }

    if (signUpParams.showTermsOfUse && formValue['acceptTermsOfUse'] != true) {
      showErrorNotification(S.of(context).acceptTermsOfUseMessage);
      return false;
    }

    return true;
  }

  void _promptToResendEmailVerification(String email) async {
    final res = await confirm(
      title: S.of(context).inactiveUserAlreadyExists,
      message: S.of(context).inactiveUserAlreadyExistsMessage,
      cancel: S.of(context).cancel,
      ok: S.of(context).resend,
    );

    if (res == true) {
      await tbClient.getSignupService().resendEmailActivation(
            email,
            pkgName: tbContext.packageName,
            platform: tbContext.platformType,
          );
      log.info('Resend email activation!');
      navigateTo('/signup/emailVerification?email=$email');
    }
  }
}
