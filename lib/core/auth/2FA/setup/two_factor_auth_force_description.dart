// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

/// The 2FA setup an administrator requires: the session can only set up a
/// method, so Log Out is the only other way out.
class TwoFactorAuthForceDescription extends ConsumerWidget {
  const TwoFactorAuthForceDescription({this.email, super.key});

  final String? email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = this.email;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 24,
                  children: [
                    SvgPicture.asset(
                      ThingsboardImage.twoFaSetup,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: 140,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Text(
                            S.of(context).twofactorAuthenticationIsRequired,
                            style: TbTextStyles.titleSmallSb,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            email != null
                                ? S.of(context).twoFaRequiredByAdmin(email)
                                : S
                                      .of(context)
                                      .setUpAVerificationMethodToContinueWithYourLogin,
                            style: TbTextStyles.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () {
                      context.pushReplacement(
                        '${LoginRoutes.login}${LoginRoutes.mfaConfigure}?force=true',
                      );
                    },
                    child: Text(S.of(context).setUpAVerificationMethod),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(loginProvider.notifier).logout();
                      context.go(LoginRoutes.login);
                    },
                    child: Text(S.of(context).logout),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: TbAppBar(
        title: Text(S.of(context).verificationRequired),
        canGoBack: false,
      ),
    );
  }
}
