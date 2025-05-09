import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class EmailVerifiedPage extends TbPageWidget {
  final String _emailCode;

  EmailVerifiedPage(TbContext tbContext, {super.key, required String emailCode})
      : _emailCode = emailCode,
        super(tbContext);

  @override
  State<StatefulWidget> createState() => _EmailVerifiedPageState();
}

class _EmailVerifiedPageState extends TbPageState<EmailVerifiedPage> {
  final _activatingNotifier = ValueNotifier<bool>(true);
  LoginResponse? _loginResponse;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _activateAndGetCredentials(context),
    );

    return Scaffold(
      body: Stack(
        children: [
          const LoginPageBackground(),
          SizedBox.expand(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _activatingNotifier,
                        builder: (context, activating, child) {
                          return Column(
                            children: [
                              const SizedBox(height: 36),
                              Text(
                                activating
                                    ? S.of(context).activatingAccount
                                    : S.of(context).accountActivated,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  height: 32 / 24,
                                ),
                              ),
                              const SizedBox(height: 78),
                              if (activating)
                                TbProgressIndicator(tbContext, size: 72),
                              if (!activating)
                                SvgPicture.asset(
                                  ThingsboardImage.emailVerified,
                                  height: 85,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: S.of(context).emailVerified,
                                ),
                              const SizedBox(height: 77),
                              if (activating)
                                Text(
                                  S.of(context).activatingAccountText,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 24 / 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFAFAFAF),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              if (!activating)
                                Text(
                                  S.of(context).accountActivatedText(
                                        tbContext.wlService.wlParams.appTitle!,
                                      ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 24 / 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFAFAFAF),
                                  ),
                                ),
                              const Spacer(),
                              if (!activating)
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        _login();
                                      },
                                      child: Text(S.of(context).login),
                                    ),
                                  ],
                                ),
                            ],
                          );
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
    );
  }

  _activateAndGetCredentials(BuildContext context) async {
    try {
      _loginResponse =
          await tbClient.getSignupService().activateUserByEmailCode(
                widget._emailCode,
                pkgName: tbContext.packageName,
                platform: tbContext.platformType,
              );
      _activatingNotifier.value = false;
    } catch (e) {
      tbContext.log.error(
        'EmailVerifiedPage::_activateAndGetCredentials() error -> $e',
      );
      if (context.mounted) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          tbContext.navigateTo('/login', replace: true, clearStack: true);
        }
      }
    }
  }

  _login() {
    tbClient.setUserFromJwtToken(
      _loginResponse!.token,
      _loginResponse!.refreshToken,
      true,
    );
  }
}
