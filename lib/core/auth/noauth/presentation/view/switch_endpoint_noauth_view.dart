// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/widgets/noauth_loading_widget.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
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
      // An effect runs inside the first build, and Riverpod refreshes a
      // provider by rebuilding the ProviderScope, which Flutter forbids during
      // a build: an assertion, so a debug build showed the red error screen
      // and never started the switch. Start once the build is over.
      var disposed = false;
      Future.microtask(() {
        if (disposed) {
          return;
        }
        ref.invalidate(noauthProviderProvider);
        ref
            .read(noauthProviderProvider.notifier)
            .switchEndpoint(SwitchEndpointParams(data: arguments));
      });

      return () {
        disposed = true;
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
      if (next.isCancelled) {
        _leaveScreen(context);
        return;
      }
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
        final authenticated = getIt<ITbClientService>().client
            .isAuthenticated();
        if (!context.mounted) {
          return;
        }
        if (!authenticated) {
          context.go(LoginRoutes.login);
        } else if (ref.read(loginProvider).isFullyAuthenticated()) {
          // Already fully logged in (e.g. the same QR was scanned twice):
          // HomeHandler won't see a state transition, navigate ourselves.
          final homePath = ref
              .read(navigationProvider.notifier)
              .resolveHomePath();
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
                        style: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
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

            if (noAuth.step == NoAuthStep.confirming) {
              return _LinkConfirmation(
                host: noAuth.host ?? '',
                signsIn: noAuth.signsIn,
                signedIn: noAuth.signedIn,
                email: noAuth.email,
                onAnswer: (accepted) => ref
                    .read(noauthProviderProvider.notifier)
                    .answerConfirmation(accepted: accepted),
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
      NoAuthStep.confirming || null => '',
    };
  }

  String _errorMessage(BuildContext context, NoAuthState state) {
    final host = state.host ?? '';
    final serverMessage = state.serverMessage;

    return switch (state.failure) {
      NoAuthFailure.connectionFailed =>
        S.of(context).failedToConnectToHost(host),
      NoAuthFailure.tokenExchangeFailed =>
        S.of(context).failedToObtainLoginTokenFromHost(host),
      // The server answers a revoked pair with "Token has expired": hardcoded
      // English, and wrong about the cause.
      NoAuthFailure.sessionInvalid =>
        S.of(context).qrCodeSessionIsNoLongerValid,
      NoAuthFailure.otherServerNotAllowed =>
        S.of(context).linkToOtherServerNotAllowed,
      // Server messages are hardcoded English: the last resort, not the first
      // choice.
      NoAuthFailure.unknown || null =>
        (serverMessage != null && serverMessage.isNotEmpty)
            ? serverMessage
            : S.of(context).somethingWentWrong,
    };
  }
}

/// Where the link leads, before anything changes: the server, and the account
/// when the link signs in. Nothing is switched until the user continues.
/// Laid out like the other full-screen decisions of the login flow.
class _LinkConfirmation extends StatelessWidget {
  const _LinkConfirmation({
    required this.host,
    required this.signsIn,
    required this.signedIn,
    required this.email,
    required this.onAnswer,
  });

  final String host;
  final bool signsIn;
  final bool signedIn;
  final String? email;
  final void Function(bool accepted) onAnswer;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final insecure = Uri.tryParse(host)?.isScheme('http') ?? false;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 24,
                children: [
                  SvgPicture.asset(
                    ThingsboardImage.connectMobile,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ),
                    width: 140,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Text(
                        s.openThisLinkTitle,
                        style: TbTextStyles.titleSmallSb,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      _HostBox(host: host),
                      const SizedBox(height: 4),
                      Text(
                        switch ((signsIn, email)) {
                          (false, _) when signedIn => s.linkOpensSignInPage,
                          (false, _) => s.linkOpensSignInPageOnly,
                          (true, final String email) => s.linkSignsInAs(email),
                          (true, null) => s.linkSignsIn,
                        },
                        style: TbTextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      if (insecure)
                        Text(
                          s.serverConnectionNotSecure,
                          style: TbTextStyles.bodyMedium.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: () => onAnswer(true),
                child: Text(s.continueText),
              ),
              TextButton(
                onPressed: () => onAnswer(false),
                child: Text(s.cancel),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// The server the link leads to, on its own so it can be read and checked.
class _HostBox extends StatelessWidget {
  const _HostBox({required this.host});

  final String host;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: primary.withAlpha(20),
        border: Border.all(color: primary.withAlpha(80)),
        borderRadius: BorderRadius.circular(8),
      ),
      // An address reads left to right in any language.
      child: SelectableText(
        host,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TbTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
