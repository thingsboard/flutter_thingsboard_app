import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/features/authentication/presentation/widgets/login_page_background.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/tost_notifications_extension.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

typedef ProviderDescFunction = String Function(
  BuildContext context,
  String? contact,
);
typedef TextFunction = String Function(BuildContext context);

class TwoFactorAuthProviderLoginData {
  TwoFactorAuthProviderLoginData({
    required this.nameFunction,
    required this.descFunction,
    required this.placeholderFunction,
    required this.icon,
  });

  TextFunction nameFunction;
  ProviderDescFunction descFunction;
  TextFunction placeholderFunction;
  String icon;
}

final twoFactorAuthProvidersLoginData =
    <TwoFaProviderType, TwoFactorAuthProviderLoginData>{
  TwoFaProviderType.TOTP: TwoFactorAuthProviderLoginData(
    nameFunction: (context) => S.of(context).mfaProviderTopt,
    descFunction: (context, contact) => S.of(context).totpAuthDescription,
    placeholderFunction: (context) => S.of(context).toptAuthPlaceholder,
    icon: 'cellphone-key',
  ),
  TwoFaProviderType.SMS: TwoFactorAuthProviderLoginData(
    nameFunction: (context) => S.of(context).mfaProviderSms,
    descFunction: (context, contact) =>
        S.of(context).smsAuthDescription(contact ?? ''),
    placeholderFunction: (context) => S.of(context).smsAuthPlaceholder,
    icon: 'message-reply-text-outline',
  ),
  TwoFaProviderType.EMAIL: TwoFactorAuthProviderLoginData(
    nameFunction: (context) => S.of(context).mfaProviderEmail,
    descFunction: (context, contact) =>
        S.of(context).emailAuthDescription(contact ?? ''),
    placeholderFunction: (context) => S.of(context).emailAuthPlaceholder,
    icon: 'email-outline',
  ),
  TwoFaProviderType.BACKUP_CODE: TwoFactorAuthProviderLoginData(
    nameFunction: (context) => S.of(context).mfaProviderBackupCode,
    descFunction: (context, contact) => S.of(context).backupCodeAuthDescription,
    placeholderFunction: (context) => S.of(context).backupCodeAuthPlaceholder,
    icon: 'lock-outline',
  ),
};

class TwoFactorAuthenticationPage extends StatefulWidget {
  const TwoFactorAuthenticationPage({super.key});

  @override
  State<StatefulWidget> createState() => _TwoFactorAuthenticationPageState();
}

class _TwoFactorAuthenticationPageState
    extends State<TwoFactorAuthenticationPage> {
  final _twoFactorAuthFormKey = GlobalKey<FormBuilderState>();
  final _selectedProvider = ValueNotifier<TwoFaProviderType?>(null);
  TwoFaProviderType? _prevProvider;
  int? _minVerificationPeriod;
  final _allowProviders = [];
  final _disableSendButton = ValueNotifier<bool>(false);
  final _showResendAction = ValueNotifier<bool>(false);
  final _hideResendButton = ValueNotifier<bool>(true);
  Timer? _timer;
  Timer? _tooManyRequestsTimer;
  final _countDownTime = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    var providersInfo =
        getIt<ILegacyService>().tbContext.twoFactorAuthProviders;

    for (final provider in TwoFaProviderType.values) {
      final providerConfig = providersInfo!.firstWhereOrNull(
        (config) => config.type == provider,
      );

      if (providerConfig != null) {
        if (providerConfig.isDefault) {
          _minVerificationPeriod =
              providerConfig.minVerificationCodeSendPeriod ?? 30;
          _selectedProvider.value = providerConfig.type;
        }

        _allowProviders.add(providerConfig.type);
      }
    }

    if (_selectedProvider.value != TwoFaProviderType.TOTP) {
      _sendCode();
      _showResendAction.value = true;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updatedTime();
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_tooManyRequestsTimer != null) {
      _tooManyRequestsTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await _goBack();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const LoginPageBackground(),
            SizedBox.expand(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: TbAppBar(
                  title: Text(S.of(context).verifyYourIdentity),
                ),
                body: Stack(
                  children: [
                    SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: ValueListenableBuilder<TwoFaProviderType?>(
                          valueListenable: _selectedProvider,
                          builder: (context, providerType, child) {
                            if (providerType == null) {
                              final children = <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    S.of(context).selectWayToVerify,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      height: 24 / 16,
                                    ),
                                  ),
                                ),
                              ];

                              for (final type in _allowProviders) {
                                var providerData =
                                    twoFactorAuthProvidersLoginData[type]!;
                                Widget? icon;
                                var iconData = MdiIcons.fromString(
                                  providerData.icon,
                                );
                                if (iconData != null) {
                                  icon = Icon(
                                    iconData,
                                    size: 24,
                                    color: Theme.of(context).primaryColor,
                                  );
                                } else {
                                  icon = Icon(
                                    Icons.login,
                                    size: 24,
                                    color: Theme.of(context).primaryColor,
                                  );
                                }
                                children.add(
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.all(16),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      onPressed: () async =>
                                          await _selectProvider(type),
                                      icon: icon,
                                      label: Text(
                                        providerData.nameFunction(context),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return ListView(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                children: children,
                              );
                            } else {
                              final providerConfig = getIt<ILegacyService>()
                                  .tbContext
                                  .twoFactorAuthProviders
                                  ?.firstWhereOrNull(
                                    (config) => config.type == providerType,
                                  );
                              if (providerConfig == null) {
                                return const SizedBox.shrink();
                              }

                              final providerDescription =
                                  twoFactorAuthProvidersLoginData[providerType]!
                                      .descFunction;

                              return FormBuilder(
                                key: _twoFactorAuthFormKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 16),
                                    Text(
                                      providerDescription(
                                        context,
                                        providerConfig.contact,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 14,
                                        height: 24 / 14,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    _buildVerificationCodeField(
                                      context,
                                      providerType,
                                    ),
                                    const Spacer(),
                                    ValueListenableBuilder<bool>(
                                      valueListenable: _disableSendButton,
                                      builder: (
                                        context,
                                        disableSendButton,
                                        child,
                                      ) {
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                          ),
                                          onPressed: disableSendButton
                                              ? null
                                              : () => _sendVerificationCode(
                                                    context,
                                                  ),
                                          child: Text(
                                            S.of(context).continueText,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 49,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ValueListenableBuilder<bool>(
                                            valueListenable: _showResendAction,
                                            builder: (
                                              context,
                                              showResendActionValue,
                                              child,
                                            ) {
                                              if (showResendActionValue) {
                                                return Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      ValueListenableBuilder<
                                                          int>(
                                                        valueListenable:
                                                            _countDownTime,
                                                        builder: (
                                                          context,
                                                          countDown,
                                                          child,
                                                        ) {
                                                          if (countDown > 0) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 12,
                                                              ),
                                                              child: Text(
                                                                S
                                                                    .of(context)
                                                                    .resendCodeWait(
                                                                      countDown,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                    0xFF7F7F7F,
                                                                  ),
                                                                  fontSize: 12,
                                                                  height:
                                                                      24 / 12,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return const SizedBox
                                                                .shrink();
                                                          }
                                                        },
                                                      ),
                                                      ValueListenableBuilder<
                                                          bool>(
                                                        valueListenable:
                                                            _hideResendButton,
                                                        builder: (
                                                          context,
                                                          hideResendButton,
                                                          child,
                                                        ) {
                                                          if (!hideResendButton) {
                                                            return TextButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 16,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                _sendCode();
                                                              },
                                                              child: Text(
                                                                S
                                                                    .of(context)
                                                                    .resendCode,
                                                              ),
                                                            );
                                                          } else {
                                                            return const SizedBox
                                                                .shrink();
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return const SizedBox.shrink();
                                              }
                                            },
                                          ),
                                          if (_allowProviders.length > 1)
                                            Expanded(
                                              child: TextButton(
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 16,
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await _selectProvider(
                                                    null,
                                                  );
                                                },
                                                child: Text(
                                                  S.of(context).tryAnotherWay,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormBuilderTextField _buildVerificationCodeField(
    BuildContext context,
    TwoFaProviderType providerType,
  ) {
    int maxLengthInput = 6;
    TextInputType keyboardType = TextInputType.number;
    String pattern = '[0-9]*';

    if (providerType == TwoFaProviderType.BACKUP_CODE) {
      maxLengthInput = 8;
      pattern = '[0-9abcdef]*';
      keyboardType = TextInputType.text;
    }

    final validators = <FormFieldValidator<String>>[
      FormBuilderValidators.required(
        errorText: S.of(context).verificationCodeInvalid,
      ),
      FormBuilderValidators.equalLength(
        maxLengthInput,
        errorText: S.of(context).verificationCodeInvalid,
      ),
      FormBuilderValidators.match(
        pattern,
        errorText: S.of(context).verificationCodeInvalid,
      ),
    ];

    final providerFormData = twoFactorAuthProvidersLoginData[providerType]!;

    return FormBuilderTextField(
      name: 'verificationCode',
      autofocus: true,
      maxLength: maxLengthInput,
      keyboardType: keyboardType,
      validator: FormBuilderValidators.compose(validators),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: providerFormData.placeholderFunction(context),
      ),
    );
  }

  Future<void> _sendVerificationCode(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (_twoFactorAuthFormKey.currentState?.saveAndValidate() ?? false) {
      var formValue = _twoFactorAuthFormKey.currentState!.value;
      String verificationCode = formValue['verificationCode'];
      try {
        // TODO: rework. Must be in BLoC
        await getIt<ITbClientService>().checkTwoFaVerificationCode(
          _selectedProvider.value!,
          verificationCode,
          requestConfig: RequestConfig(ignoreErrors: true),
        );
      } catch (e) {
        if (e is ThingsboardError) {
          if (e.status == 400) {
            if (context.mounted) {
              _twoFactorAuthFormKey.currentState!.fields['verificationCode']!
                  .invalidate(S.of(context).verificationCodeIncorrect);
            }
          } else if (e.status == 429) {
            if (context.mounted) {
              _twoFactorAuthFormKey.currentState!.fields['verificationCode']!
                  .invalidate(S.of(context).verificationCodeManyRequest);
            }
            _disableSendButton.value = true;
            if (_tooManyRequestsTimer != null) {
              _tooManyRequestsTimer!.cancel();
            }
            _tooManyRequestsTimer = Timer(const Duration(seconds: 5), () {
              _twoFactorAuthFormKey.currentState!.fields['verificationCode']!
                  .validate();
              _disableSendButton.value = false;
            });
          } else {
            if (context.mounted) {
              context.showErrorNotification(
                e.message ?? 'Code verification failed!',
              );
            }
          }
        } else {
          if (context.mounted) {
            context.showErrorNotification('Code verification failed!');
          }
        }
      }
    }
  }

  Future<void> _selectProvider(TwoFaProviderType? type) async {
    _prevProvider = type == null ? _selectedProvider.value : null;
    _selectedProvider.value = type;
    _showResendAction.value = false;
    if (type != null) {
      var providersInfo =
          getIt<ILegacyService>().tbContext.twoFactorAuthProviders;
      var providerConfig =
          providersInfo!.firstWhereOrNull((config) => config.type == type)!;
      if (type != TwoFaProviderType.TOTP &&
          type != TwoFaProviderType.BACKUP_CODE) {
        _sendCode();
        _showResendAction.value = true;
        _minVerificationPeriod =
            providerConfig.minVerificationCodeSendPeriod ?? 30;
      }
    }
  }

  Future<void> _sendCode() async {
    _hideResendButton.value = true;
    _countDownTime.value = 0;
    try {
      await getIt<ILegacyService>()
          .tbContext
          .tbClient
          .getTwoFactorAuthService()
          .requestTwoFaVerificationCode(
            _selectedProvider.value!,
            requestConfig: RequestConfig(ignoreErrors: true),
          );
    } finally {
      _countDownTime.value = _minVerificationPeriod!;
    }
  }

  Future<bool> _goBack() async {
    if (_prevProvider != null) {
      await _selectProvider(_prevProvider);
    } else {
      // TODO: rework. Must be inside a state manager(BLoC)
      getIt<ICommunicationService>().fire(const GlobalLogoutEvent());
    }
    return false;
  }

  void _updatedTime() {
    if (_countDownTime.value > 0) {
      _countDownTime.value--;
      if (_countDownTime.value == 0) {
        _hideResendButton.value = false;
      }
    }
  }
}
