import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class EmailVerificationPage extends TbPageWidget {
  final String _email;

  EmailVerificationPage(TbContext tbContext, {required String email})
      : _email = email,
        super(tbContext);

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends TbPageState<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      LoginPageBackground(),
      SizedBox.expand(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: TbAppBar(tbContext),
              body: Stack(children: [
                SizedBox.expand(
                    child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(children: [
                          SizedBox(height: 18),
                          SvgPicture.asset(ThingsboardImage.emailVerification,
                              height: 50,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).primaryColor,
                                  BlendMode.srcIn),
                              semanticsLabel:
                                  '${S.of(context).emailVerification}'),
                          SizedBox(height: 48),
                          Text('${S.of(context).emailVerification}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  height: 32 / 24)),
                          SizedBox(height: 16),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14,
                                      height: 24 / 14,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFAFAFAF)),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${S.of(context).emailVerificationSentText}'),
                                    TextSpan(
                                        text: widget._email,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                Color.getAlphaFromOpacity(0.87),
                                                0,
                                                0,
                                                0))),
                                    TextSpan(text: '.'),
                                  ])),
                          SizedBox(height: 32),
                          Text(
                              '${S.of(context).emailVerificationInstructionsText}',
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 24 / 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFAFAFAF))),
                          Spacer(),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  child: Text('${S.of(context).resend}'),
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16)),
                                  onPressed: () {
                                    _resendEmail();
                                  },
                                )
                              ])
                        ])))
              ])))
    ]));
  }

  _resendEmail() async {
    await tbClient
        .getSignupService()
        .resendEmailActivation(widget._email, pkgName: tbContext.packageName);
    navigateTo('/signup/emailVerification?email=' + widget._email,
        replace: true);
  }
}
