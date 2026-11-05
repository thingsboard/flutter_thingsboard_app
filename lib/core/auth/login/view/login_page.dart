// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/di/login_di.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/widgets/full_screen_loader.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_loaded_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, required this.riderectUrl});
  final String? riderectUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final wl = ref.watch(wlProvider);
    final darkForeground = wl.loginWhiteLabelingParams.darkForeground ?? false;
    final isUserLoading = useState(false);
    useEffect(() {
      LoginDi.init();
      handleUserLoading(loginState, isUserLoading);
      // The login state doesn't change when a session whose user never loaded
      // is dropped, but the client fires this event for every session change.
      final subscription = getIt<ICommunicationService>()
          .on<UserLoadedEvent>()
          .listen((_) => handleUserLoading(loginState, isUserLoading));
      return () {
        subscription.cancel();
        LoginDi.dispose();
      };
    }, []);
    useEffect(() {
      handleUserLoading(loginState, isUserLoading);
    }, [loginState]);
    return Theme(
      data: wl.loginTheme,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            darkForeground
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(
            children: [
              const LoginWidget(),
              if (isUserLoading.value) const FullScreenLoader(),
            ],
          ),
        ),
      ),
    );
  }

  void handleUserLoading(
    LoginState loginState,
    ValueNotifier<bool> isUserLoading,
  ) {
    final client = getIt<ITbClientService>().client;
    final user = client.getAuthUser();

    // Only a full session is on its way to the home screen.
    isUserLoading.value =
        user != null &&
        !user.isMfaConfigurationToken() &&
        !user.isPreVerificationToken();
  }
}
