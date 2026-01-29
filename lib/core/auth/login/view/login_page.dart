import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/di/login_di.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, required this.riderectUrl});
  final String? riderectUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final isUserLoading = useState(false);
    useEffect(() {
      LoginDi.init();
      handleUserLoading(loginState, isUserLoading);
      return () => LoginDi.dispose();
    }, []);
    useEffect(() {
      handleUserLoading(loginState, isUserLoading);
    }, [loginState]);
    return Scaffold(
      body: Stack(
        children: [
          const LoginPageBackground(),
          const LoginWidget(),
          if (isUserLoading.value) const FullScreenLoader(),
        ],
      ),
    );
  }

  void handleUserLoading(
    LoginState loginState,
    ValueNotifier<bool> isUserLoading,
  ) {
    final client = getIt<ITbClientService>().client;
    final user = client.getAuthUser();

    if (user != null &&
        (!user.isMfaConfigurationToken() || !user.isPreVerificationToken())) {
      isUserLoading.value = true;
    }
    if (user != null &&
        (user.isMfaConfigurationToken() || user.isPreVerificationToken())) {
      isUserLoading.value = false;
    }
  }
}
