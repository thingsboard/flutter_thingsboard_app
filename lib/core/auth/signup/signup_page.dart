import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_action.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_client.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/core/auth/signup/provider/signup_provider.dart';
import 'package:thingsboard_app/core/auth/signup/signup_field_widget.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oauthData = ref.watch(oauthProvider);
    final signupState = ref.watch(signupProvider);
    final wlState = ref.watch(wlProvider);
    final recaptchaResponse = useState<String?>(null);
    final log = useMemoized(() => TbLogger());

    return switch (oauthData) {
      AsyncData(:final value) => _SignUpPageContent(
        loginMobileInfo: value,
        signupState: signupState,
        wlState: wlState,
        recaptchaResponse: recaptchaResponse,
        log: log,
      ),
      _ => const Scaffold(
        body: SizedBox.expand(
          child: ColoredBox(
            color: Color(0x99FFFFFF),
            child: Center(child: TbProgressIndicator(size: 50.0)),
          ),
        ),
      ),
    };
  }
}

class _SignUpPageContent extends HookConsumerWidget {
  const _SignUpPageContent({
    required this.loginMobileInfo,
    required this.signupState,
    required this.wlState,
    required this.recaptchaResponse,
    required this.log,
  });

  final LoginMobileInfo loginMobileInfo;
  final SignupState signupState;
  final WlState wlState;
  final ValueNotifier<String?> recaptchaResponse;
  final TbLogger log;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selfRegistrationParams = loginMobileInfo.selfRegistrationParams;
    final signUpFields = selfRegistrationParams?.fields?.toList() ?? [];
    final form = useMemoized(
      () => FormGroup(
        {
          if (selfRegistrationParams?.showPrivacyPolicy ?? false)
            "privacyPolicy": FormControl<bool>(
              validators: [Validators.requiredTrue],
            ),
          if (selfRegistrationParams?.showTermsOfUse ?? false)
            "termsOfUse": FormControl<bool>(
              validators: [Validators.requiredTrue],
            ),
          "recaptcha": FormControl<bool>(validators: [Validators.requiredTrue]),
          ...Map<String, AbstractControl>.fromEntries(
            signUpFields.map((e) {
              return MapEntry(
                e.id.name,
                FormControl(
                  validators: [
                    if (e.required_ ?? false) Validators.required,
                    if (e.id == SignUpFieldId.PASSWORD ||
                        e.id == SignUpFieldId.REPEAT_PASSWORD)
                      Validators.minLength(6),
                  ],
                ),
              );
            }),
          ),
        },
        validators: [
          if (signUpFields.any((f) => f.id == SignUpFieldId.REPEAT_PASSWORD))
            Validators.mustMatch(
              SignUpFieldId.PASSWORD.name,
              SignUpFieldId.REPEAT_PASSWORD.name,
            ),
        ],
      ),
    );
    if (selfRegistrationParams == null) {
      return const Scaffold(
        body: Center(child: Text('Self registration is not available')),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          getIt<ThingsboardAppRouter>().navigateTo('/login', replace: true);
        }
      },
      child: ReactiveForm(
        formGroup: form,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                const LoginPageBackground(),
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 50, child: wlState.logo),
                                if (selfRegistrationParams.title != null &&
                                    selfRegistrationParams.title!.isNotEmpty)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          selfRegistrationParams.title!,
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
                                AutofillGroup(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    spacing: 16,
                                    children: [
                                      ListView.separated(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final field = signUpFields[index];
                                          final passwordFiled =
                                              field.id ==
                                                  SignUpFieldId.PASSWORD ||
                                              field.id ==
                                                  SignUpFieldId.REPEAT_PASSWORD;

                                          return SingUpFieldWidget(
                                            field: signUpFields[index],
                                            obscureText: passwordFiled,
                                          );
                                        },
                                        separatorBuilder:
                                            (_, _) =>
                                                const SizedBox(height: 12),
                                        itemCount: signUpFields.length,
                                      ),
                                      ReactiveCheckboxListTile(
                                        onChanged: (control) {
                                          final hasResponse =
                                              recaptchaResponse.value != null &&
                                              recaptchaResponse
                                                  .value!
                                                  .isNotEmpty;
                                          if (!hasResponse) {
                                            _openRecaptcha(
                                              context,
                                              selfRegistrationParams,
                                              recaptchaResponse,
                                            );
                                          }
                                        },
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 4,
                                            ),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        dense: true,
                                        formControlName: 'recaptcha',
                                        title: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                final hasResponse =
                                                    recaptchaResponse.value !=
                                                        null &&
                                                    recaptchaResponse
                                                        .value!
                                                        .isNotEmpty;
                                                if (!hasResponse) {
                                                  _openRecaptcha(
                                                    context,
                                                    selfRegistrationParams,
                                                    recaptchaResponse,
                                                  );
                                                }
                                              },
                                              child: Text(
                                                S.of(context).imNotARobot,
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (selfRegistrationParams
                                              .showPrivacyPolicy ??
                                          false)
                                        ReactiveCheckboxListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                vertical: 4,
                                              ),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          dense: true,
                                          formControlName: 'privacyPolicy',
                                          title: Row(
                                            children: [
                                              Text(
                                                S.of(context).accept,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  height: 20 / 14,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _openPrivacyPolicy(
                                                    context,
                                                    form,
                                                  );
                                                },
                                                child: Text(
                                                  " ${S.of(context).privacyPolicy}",
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                    letterSpacing: 1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    height: 20 / 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (selfRegistrationParams
                                              .showTermsOfUse ??
                                          false)
                                        ReactiveCheckboxListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                vertical: 4,
                                              ),
                                          formControlName: 'termsOfUse',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          dense: true,
                                          title: Row(
                                            children: [
                                              Text(
                                                S.of(context).accept,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  height: 20 / 14,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _openTermsOfUse(
                                                    context,
                                                    form,
                                                  );
                                                },
                                                child: Text(
                                                  " ${S.of(context).termsOfUse}",
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                    letterSpacing: 1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    height: 20 / 14,
                                                  ),
                                                ),
                                              ),
                                            ],
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
                            ReactiveFormConsumer(
                              builder:
                                  (context, formGroup, child) => ElevatedButton(
                                    onPressed:
                                        form.invalid
                                            ? null
                                            : () {
                                              _signUp(
                                                context,
                                                ref,
                                                form,
                                                selfRegistrationParams,
                                                signUpFields,
                                                recaptchaResponse,
                                                log,
                                              );
                                            },
                                    child: Text(S.of(context).signUp),
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
                                    _login(context);
                                  },
                                  child: Text(
                                    S.of(context).signIn,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                if (signupState.isSigningUp)
                  SizedBox.expand(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withValues(alpha: .2),
                          ),
                          child: const Center(
                            child: TbProgressIndicator(size: 50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _openRecaptcha(
  BuildContext context,
  SignUpSelfRegistrationParams signUpParams,
  ValueNotifier<String?> recaptchaResponseNotifier,
) async {
  try {
    final captcha = signUpParams.captcha;
    if (captcha == null) return;
    if (captcha.version == 'enterprise') {
      // Get recaptcha client for enterprise version
      RecaptchaClient? client;
      final deviceService = getIt<IDeviceInfoService>();
      final enterpriseCaptcha =
          captcha is EnterpriseCaptchaParams ? captcha : null;
      if (deviceService.getPlatformType() == PlatformType.IOS) {
        client = await Recaptcha.fetchClient(enterpriseCaptcha?.iosKey ?? '');
      } else if (deviceService.getPlatformType() == PlatformType.ANDROID) {
        client = await Recaptcha.fetchClient(
          enterpriseCaptcha?.androidKey ?? '',
        );
      }

      recaptchaResponseNotifier.value = await client?.execute(
        RecaptchaAction.SIGNUP(),
        timeout: 10000,
      );
    } else {
      final v3Captcha = captcha is V3CaptchaParams ? captcha : null;
      final String? recaptchaResponse = await getIt<ThingsboardAppRouter>()
          .navigateTo(
            '/tbRecaptcha?siteKey=${v3Captcha?.siteKey ?? ''}'
            '&version=${captcha.version}'
            '&logActionName=${v3Captcha?.logActionName ?? ''}',
            transition: TransitionType.nativeModal,
          );

      recaptchaResponseNotifier.value = recaptchaResponse;
    }
  } on PlatformException catch (e) {
    getIt<IOverlayService>().showErrorNotification((_) => e.message ?? '');
  } catch (e) {
    getIt<IOverlayService>().showErrorNotification((_) => e.toString());
  }
}

Future<void> _openPrivacyPolicy(BuildContext context, FormGroup group) async {
  final bool? acceptPrivacyPolicy = await getIt<ThingsboardAppRouter>()
      .navigateTo('/privacyPolicy', transition: TransitionType.nativeModal);
  group.control('privacyPolicy').updateValue(acceptPrivacyPolicy);
}

Future<void> _openTermsOfUse(BuildContext context, FormGroup group) async {
  final bool? acceptTermsOfUse = await getIt<ThingsboardAppRouter>().navigateTo(
    '/termsOfUse',
    transition: TransitionType.nativeModal,
  );
  group.control('termsOfUse').updateValue(acceptTermsOfUse);
}

Future<void> _login(BuildContext context) async {
  getIt<ThingsboardAppRouter>().navigateTo('/login', replace: true);
}

Future<void> _signUp(
  BuildContext context,
  WidgetRef ref,
  FormGroup form,
  SignUpSelfRegistrationParams signUpParams,
  List<SignUpField> signUpFields,
  ValueNotifier<String?> recaptchaResponseNotifier,
  TbLogger log,
) async {
  FocusScope.of(context).unfocus();
  if (form.valid) {
    final formValue = form.value;
    final fields = Map<SignUpFieldId, String>.fromEntries(
      signUpFields
          .where((e) => e.id != SignUpFieldId.unknownDefaultOpenApi)
          .map((e) => MapEntry(e.id, '${formValue[e.id.name]}'))
          .where((e) => e.value != 'null'),
    );

    final signUpRequest = await ref
        .read(signupProvider.notifier)
        .createSignUpRequest(
          fields: fields,
          recaptchaResponse: recaptchaResponseNotifier.value!,
        );

    try {
      final signupResult = await ref
          .read(signupProvider.notifier)
          .signup(signUpRequest);

      if (signupResult == SignUpResult.INACTIVE_USER_EXISTS) {
        recaptchaResponseNotifier.value = null;
        if (context.mounted) {
          _promptToResendEmailVerification(
            context,
            ref,
            formValue[SignUpFieldId.EMAIL.name].toString(),
          );
        }
      } else {
        final encoded = Uri.encodeQueryComponent(
          formValue[SignUpFieldId.EMAIL.name].toString(),
        );

        log.info('Sign up success!');
        recaptchaResponseNotifier.value = null;
        getIt<ThingsboardAppRouter>().navigateTo(
          '/emailVerification?email=$encoded',
        );
      }
    } catch (_) {
      recaptchaResponseNotifier.value = null;
      form.control('recaptcha').updateValue(false);
    }
  }
}

bool _validateSignUpRequest(
  BuildContext context,
  Map<String, dynamic> formValue,
  SignUpSelfRegistrationParams signUpParams,
  String? recaptchaResponse,
) {
  if (formValue[SignUpFieldId.PASSWORD.name] !=
      formValue[SignUpFieldId.REPEAT_PASSWORD.name]) {
    getIt<IOverlayService>().showErrorNotification(
      (_) => S.of(context).passwordErrorNotification,
    );
    return false;
  } else if (formValue[SignUpFieldId.PASSWORD.name].toString().length < 6) {
    getIt<IOverlayService>().showErrorNotification(
      (_) => S.of(context).invalidPasswordLengthMessage,
    );
    return false;
  }

  if (recaptchaResponse == null || recaptchaResponse.isEmpty) {
    getIt<IOverlayService>().showErrorNotification(
      (_) => S.of(context).confirmNotRobotMessage,
    );
    return false;
  }
  if ((signUpParams.showPrivacyPolicy ?? false) &&
      formValue['acceptPrivacyPolicy'] != true) {
    getIt<IOverlayService>().showErrorNotification(
      (_) => S.of(context).acceptPrivacyPolicyMessage,
    );
    return false;
  }

  if ((signUpParams.showTermsOfUse ?? false) &&
      formValue['acceptTermsOfUse'] != true) {
    getIt<IOverlayService>().showErrorNotification(
      (_) => S.of(context).acceptTermsOfUseMessage,
    );
    return false;
  }

  return true;
}

Future<void> _promptToResendEmailVerification(
  BuildContext context,
  WidgetRef ref,
  String email,
) async {
  final res = await getIt<IOverlayService>().showConfirmDialog(
    content:
        (_) => DialogContent(
          title: S.of(context).inactiveUserAlreadyExists,
          message: S.of(context).inactiveUserAlreadyExistsMessage,
          cancel: S.of(context).cancel,
          ok: S.of(context).resend,
        ),
  );

  if (res == true) {
    await ref.read(signupProvider.notifier).resendEmailActivation(email);

    final log = TbLogger();
    log.info('Resend email activation!');
    final encoded = Uri.encodeQueryComponent(email);

    getIt<ThingsboardAppRouter>().navigateTo(
      '/emailVerification?email=$encoded',
    );
  }
}
