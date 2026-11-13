// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_auth_provider_login_data.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

final twoFactorAuthProvidersLoginData =
    <TwoFaProviderType, TwoFactorAuthProviderLoginData>{
      TwoFaProviderType.TOTP: TwoFactorAuthProviderLoginData(
        codeLength: 6,
        setupSuccessDescription: (context) =>
            S.of(context).totpSetupSuccessDescription,
        textInputType: TextInputType.number,
        nameFunction: (context) => S.of(context).mfaProviderTopt,
        setupTitleFunction: (context) => S.of(context).enableAuthenticatorApp,
        setupDescriptionFunction: (context) =>
            S.of(context).twoFaTotpDescription,
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
        setupTitleFunction: (context) => S.of(context).enableSmsAuthenticator,
        setupDescriptionFunction: (context) =>
            S.of(context).twoFaSmsDescription,
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
        setupTitleFunction: (context) => S.of(context).enableEmailAuthenticator,
        setupDescriptionFunction: (context) =>
            S.of(context).twoFaEmailDescription,
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
        setupTitleFunction: (context) => S.of(context).getBackupCode,
        setupDescriptionFunction: (context) =>
            S.of(context).twoFaBackupCodeDescription,
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
