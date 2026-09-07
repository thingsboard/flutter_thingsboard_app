import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/noauth_loading_widget.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class SwitchEndpointNoAuthView extends HookConsumerWidget {
  const SwitchEndpointNoAuthView({required this.arguments, super.key});

  static const _errorDismissDelay = Duration(seconds: 5);
  // HomeHandler navigates once the user is fully loaded; this is the escape
  // hatch for the case where that never happens (e.g. a rejected session).
  static const _userLoadTimeout = Duration(seconds: 12);

  final SwitchEndpointArgs arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noAuth = ref.watch(noauthProviderProvider);
    final errorExitTimer = useRef<Timer?>(null);
    final userLoadTimer = useRef<Timer?>(null);

    useEffect(() {
      ref.invalidate(noauthProviderProvider);
      ref
          .read(noauthProviderProvider.notifier)
          .switchEndpoint(SwitchEndpointParams(data: arguments));

      return () {
        errorExitTimer.value?.cancel();
        userLoadTimer.value?.cancel();
      };
    }, const []);

    // HomeHandler owns the navigation once the user is loaded: drop the
    // fallback instead of racing it.
    ref.listen(loginProvider, (prev, next) {
      if (next.isFullyAuthenticated()) {
        userLoadTimer.value?.cancel();
      }
    });

    ref.listen(noauthProviderProvider, (prev, next) {
      if (next.failure != null) {
        userLoadTimer.value?.cancel();
        errorExitTimer.value?.cancel();
        errorExitTimer.value = Timer(
          _errorDismissDelay,
          () => _leaveScreen(context),
        );

        return;
      }

      if (next.isDone) {
        // A switch with a login secret ends authenticated: HomeHandler
        // navigates to the home page once the user is fully loaded. A
        // host-only switch (QR without a secret) ends unauthenticated: show
        // the login page of the new host.
        final authenticated =
            getIt<ITbClientService>().client.isAuthenticated();
        if (!context.mounted) {
          return;
        }
        if (!authenticated) {
          context.go(LoginRoutes.login);
        } else if (ref.read(loginProvider).isFullyAuthenticated()) {
          // Already fully logged in (e.g. the same QR was scanned twice):
          // HomeHandler won't see a state transition, navigate ourselves.
          final homePath =
              ref.read(navigationProvider.notifier).resolveHomePath();
          context.go(homePath ?? LoginRoutes.login);
        } else {
          userLoadTimer.value?.cancel();
          userLoadTimer.value = Timer(_userLoadTimeout, () {
            if (context.mounted) {
              context.go(LoginRoutes.login);
            }
          });
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (noAuth.failure != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 50),
                      const SizedBox(height: 10),
                      Text(
                        _errorMessage(context, noAuth),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          errorExitTimer.value?.cancel();
                          _leaveScreen(context);
                        },
                        child: Text(S.of(context).goBack),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const NoAuthLoadingWidget(),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 80,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            _stepMessage(context, noAuth),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _leaveScreen(BuildContext context) {
    if (!context.mounted) {
      return;
    }
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(LoginRoutes.login);
    }
  }

  String _stepMessage(BuildContext context, NoAuthState state) {
    final host = state.host ?? '';

    return switch (state.step) {
      NoAuthStep.fetchingSession => S.of(context).gettingDataFromHost(host),
      NoAuthStep.loggingIn => S.of(context).loggingYouIntoHost(host),
      NoAuthStep.switchingHost => S.of(context).switchingToNewHost(host),
      null => '',
    };
  }

  String _errorMessage(BuildContext context, NoAuthState state) {
    final host = state.host ?? '';
    final serverMessage = state.serverMessage;

    return switch (state.failure) {
      NoAuthFailure.connectionFailed => S
          .of(context)
          .failedToConnectToHost(host),
      NoAuthFailure.tokenExchangeFailed => S
          .of(context)
          .failedToObtainLoginTokenFromHost(host),
      // The server answers a revoked pair with "Token has expired": hardcoded
      // English, and wrong about the cause.
      NoAuthFailure.sessionInvalid =>
        S.of(context).qrCodeSessionIsNoLongerValid,
      // Server messages are hardcoded English: the last resort, not the first
      // choice.
      NoAuthFailure.unknown || null =>
        (serverMessage != null && serverMessage.isNotEmpty)
            ? serverMessage
            : S.of(context).somethingWentWrong,
    };
  }
}
