import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class EmailVerifiedPage extends HookConsumerWidget {
  const EmailVerifiedPage({required this.emailCode, super.key});

  final String emailCode;
  Future<void> activateAndGetCredentials(
    ValueNotifier<bool> isActivating,
    ValueNotifier<LoginResponse?> loginResponse,
    BuildContext context,
  ) async {
    final tbClient = getIt<ITbClientService>().client;
    try {
      final r = await tbClient.getSignUpControllerApi().activateUserByEmailCode(
        emailCode: emailCode,
        pkgName: getIt<IDeviceInfoService>().getApplicationId(),
        platform: getIt<IDeviceInfoService>().getPlatformType().name,
      );
      loginResponse.value =
          r.data?.token != null
              ? LoginResponse(
                (b) => b
                  ..token = r.data!.token
                  ..refreshToken = r.data!.refreshToken,
              )
              : null;
      isActivating.value = false;
    } catch (e) {
      // tbContext.log.error(
      //   'EmailVerifiedPage::activateAndGetCredentials() error -> $e',
      // );
      if (context.mounted) {
        if (context.canPop()) {
          context.pop();
        } else {
          getIt<ThingsboardAppRouter>().navigateTo(
            '/login',
            replace: true,
            clearStack: true,
          );
        }
      }
    }
  }

  void handleLogin(
    ValueNotifier<LoginResponse?> loginResponse,
    ITbClientService tbClientService,
  ) {
    final response = loginResponse.value;
    if (response != null) {
      tbClientService.client.setUserFromJwtToken(
        response.token,
        response.refreshToken,
        true,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wlState = ref.watch(wlProvider);
    final isActivating = useState(true);
    final loginResponse = useState<LoginResponse?>(null);
    final tbClientService = getIt<ITbClientService>();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => activateAndGetCredentials(isActivating, loginResponse, context),
      );
      return null;
    }, []);

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
                      child: Column(
                        children: [
                          const SizedBox(height: 36),
                          Text(
                            isActivating.value
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
                          if (isActivating.value)
                            const TbProgressIndicator(size: 72),
                          if (!isActivating.value)
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
                          if (isActivating.value)
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
                          if (!isActivating.value)
                            Text(
                              S
                                  .of(context)
                                  .accountActivatedText(
                                    wlState.wlParams.appTitle ?? '',
                                  ),
                              style: const TextStyle(
                                fontSize: 14,
                                height: 24 / 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFAFAFAF),
                              ),
                            ),
                          const Spacer(),
                          if (!isActivating.value)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  onPressed:
                                      () => handleLogin(
                                        loginResponse,
                                        tbClientService,
                                      ),
                                  child: Text(S.of(context).login),
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
        ],
      ),
    );
  }
}
