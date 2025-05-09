import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class EmailVerificationPage extends TbPageWidget {
  final String _email;

  EmailVerificationPage(TbContext tbContext, {super.key, required String email})
      : _email = email,
        super(tbContext);

  @override
  State<StatefulWidget> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends TbPageState<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginPageBackground(),
          SizedBox.expand(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: TbAppBar(tbContext),
              body: SafeArea(
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
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
                                    text:
                                        S.of(context).emailVerificationSentText,
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
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    _resendEmail();
                                  },
                                  child: Text(S.of(context).resend),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _resendEmail() async {
    await tbClient.getSignupService().resendEmailActivation(
          widget._email,
          pkgName: tbContext.packageName,
          platform: tbContext.platformType,
        );

    navigateTo(
      '/signup/emailVerification?email=${widget._email}',
      replace: true,
    );
    showSuccessNotification(
      S.of(context).emailVersificationSuccessfullySentNotification,
    );
  }
}
