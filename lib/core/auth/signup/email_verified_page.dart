import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class EmailVerifiedPage extends TbPageWidget {

  final String _emailCode;

  EmailVerifiedPage(TbContext tbContext, {required String emailCode}):
        _emailCode = emailCode,
        super(tbContext);

  @override
  _EmailVerifiedPageState createState() => _EmailVerifiedPageState();

}

class _EmailVerifiedPageState extends TbPageState<EmailVerifiedPage> {

  final _activatingNotifier = ValueNotifier<bool>(true);
  LoginResponse? _loginResponse;

  @override
  void initState() {
    super.initState();
    _activateAndGetCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack( children: [
          LoginPageBackground(),
          SizedBox.expand(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                      children: [
                        SizedBox.expand(
                            child: Padding(
                                padding: EdgeInsets.all(24),
                                child: ValueListenableBuilder<bool>(
                                    valueListenable: _activatingNotifier,
                                    builder: (BuildContext context, bool activating, child) {
                                        return Column(
                                          children: [
                                            SizedBox(height: 36),
                                            Text(activating ? 'Activating account...' : 'Account successfully activated!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                                height: 32 / 24
                                            )),
                                            SizedBox(height: 78),
                                            if (activating) TbProgressIndicator(tbContext, size: 72),
                                            if (!activating) SvgPicture.asset(ThingsboardImage.emailVerified,
                                               height: 85,
                                                color: Theme.of(context).primaryColor,
                                                semanticsLabel: 'Email verified'),
                                            SizedBox(height: 77),
                                            if (activating) Text('Your account is currently activating.\nPlease wait...',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  height: 24 / 14,
                                                                  fontWeight: FontWeight.normal,
                                                                  color: Color(0xFFAFAFAF)
                                                              ),
                                                              textAlign: TextAlign.center),
                                            if (!activating) Text('Congratulations!\n'
                                                  'Your ${tbContext.wlService.wlParams.appTitle} account has been activated.\n'
                                                  'Now you can login to your ${tbContext.wlService.wlParams.appTitle} space.',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    height: 24 / 14,
                                                    fontWeight: FontWeight.normal,
                                                    color: Color(0xFFAFAFAF)
                                                )),
                                            Spacer(),
                                            if (!activating) Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  ElevatedButton(
                                                    child: Text('Login'),
                                                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                                                    onPressed: () {
                                                      _login();
                                                    },
                                                  )
                                            ])
                                          ],
                                        );
                                      }
                                )
                            )
                        )
                      ]
                  )
              )
          )
        ])
    );
  }

  _activateAndGetCredentials() async {
    try {
      _loginResponse =
      await tbClient.getSignupService().activateUserByEmailCode(
          widget._emailCode, pkgName: tbContext.packageName, requestConfig: RequestConfig(ignoreErrors: false));
      _activatingNotifier.value = false;
    } catch (_) {}
  }

  _login() {
    tbClient.setUserFromJwtToken(_loginResponse!.token, _loginResponse!.refreshToken, true);
  }
}
