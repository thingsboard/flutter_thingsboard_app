// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/core/auth/signup/provider/signup_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/widgets/pinned_footer_scroll_view.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class EmailVerificationPage extends ConsumerStatefulWidget {
  const EmailVerificationPage({super.key, required this._email});
  final String _email;

  @override
  ConsumerState<EmailVerificationPage> createState() =>
      _EmailVerificationPageState();
}

class _EmailVerificationPageState extends ConsumerState<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginPageBackground(),
          SizedBox.expand(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: TbAppBar(),
              body: SafeArea(
                child: PinnedFooterScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  pinnedFooterPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  footer: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      _resendEmail();
                    },
                    child: Text(S.of(context).resend),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      SvgPicture.asset(
                        ThingsboardImage.emailVerification,
                        height: 50,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcIn,
                        ),
                        semanticsLabel: S.of(context).emailVerification,
                      ),
                      const SizedBox(height: 48),
                      Text(
                        S.of(context).emailVerification,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          height: 32 / 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            height: 24 / 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFAFAFAF),
                          ),
                          children: [
                            TextSpan(
                              text: S.of(context).emailVerificationSentText,
                            ),
                            TextSpan(
                              text: widget._email,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(
                                  Color.getAlphaFromOpacity(0.87),
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        S.of(context).emailVerificationInstructionsText,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 24 / 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFAFAFAF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _resendEmail() async {
    await ref
        .read(signupProvider.notifier)
        .resendEmailActivation(widget._email);

    if (mounted) {
      getIt<IOverlayService>().showSuccessNotification(
        (_) => S.of(context).emailVersificationSuccessfullySentNotification,
      );
    }
  }
}
