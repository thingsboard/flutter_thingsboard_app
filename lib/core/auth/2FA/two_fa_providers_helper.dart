import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_auth_provider_login_data.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

final twoFactorAuthProvidersLoginData =
    <TwoFaProviderType, TwoFactorAuthProviderLoginData>{
      TwoFaProviderType.TOTP: TwoFactorAuthProviderLoginData(
        codeLength: 6,
        setupSuccessDescription: (context) =>
            S.of(context).totpSetupSuccessDescription,
        textInputType: TextInputType.number,
        nameFunction: (context) => S.of(context).mfaProviderTopt,
        descFunction: (context, contact) => S.of(context).totpAuthDescription,
        placeholderFunction: (context) => S.of(context).toptAuthPlaceholder,
        // translate-me-ignore-next-line
        icon: 'cellphone-key',
      ),
      TwoFaProviderType.SMS: TwoFactorAuthProviderLoginData(
        setupSuccessDescription: (context) =>
            S.of(context).smsSetupSuccessDescription,
        textInputType: TextInputType.number,
        codeLength: 6,
        nameFunction: (context) => S.of(context).mfaProviderSms,
        descFunction: (context, contact) =>
            S.of(context).smsAuthDescription(contact ?? ''),
        placeholderFunction: (context) => S.of(context).smsAuthPlaceholder,
        icon: 'message-reply-text-outline',
      ),
      TwoFaProviderType.EMAIL: TwoFactorAuthProviderLoginData(
        setupSuccessDescription: (context) =>
            S.of(context).emailSetupSuccessDescription,
        textInputType: TextInputType.number,
        codeLength: 6,
        nameFunction: (context) => S.of(context).mfaProviderEmail,
        descFunction: (context, contact) =>
            S.of(context).emailAuthDescription(contact ?? ''),
        placeholderFunction: (context) => S.of(context).emailAuthPlaceholder,
        // translate-me-ignore-next-line
        icon: 'email-outline',
      ),
      TwoFaProviderType.BACKUP_CODE: TwoFactorAuthProviderLoginData(
        setupSuccessDescription: (context) =>
            S.of(context).backupCodeSetupSuccessDescription,
        textInputType: TextInputType.text,
        nameFunction: (context) => S.of(context).mfaProviderBackupCode,
        descFunction: (context, contact) =>
            S.of(context).backupCodeAuthDescription,
        placeholderFunction: (context) =>
            S.of(context).backupCodeAuthPlaceholder,
        // translate-me-ignore-next-line
        icon: 'lock-outline',
        codeLength: 8,
      ),
    };
TwoFactorAuthProviderLoginData getTwoFaProviderData(TwoFaProviderType type) {
  return twoFactorAuthProvidersLoginData[type]!;
}
