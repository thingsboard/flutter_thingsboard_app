// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/view/switch_endpoint_noauth_view.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

import '../../../../../helpers/fake_wl.dart';
import '../../../../../helpers/test_dependencies.dart';

class FakeLogin extends Login {
  @override
  LoginState build() => const LoginState(isUserLoaded: false);
}

/// Records the switches the view starts instead of talking to a server.
class FakeNoauth extends NoauthProvider {
  FakeNoauth(this.started);

  final List<SwitchEndpointParams> started;

  @override
  Future<void> switchEndpoint(SwitchEndpointParams params) async {
    started.add(params);
    state = NoAuthState(
      step: NoAuthStep.fetchingSession,
      host: params.data.uri.origin,
    );
  }
}

/// Stops at the confirmation the provider asks for and records the answer.
class ConfirmingNoauth extends NoauthProvider {
  ConfirmingNoauth(this.answers, {this.email});

  final List<bool> answers;
  final String? email;

  @override
  Future<void> switchEndpoint(SwitchEndpointParams params) async {
    state = NoAuthState(
      step: NoAuthStep.confirming,
      host: 'https://other.example',
      signsIn: email != null,
      email: email,
    );
  }

  @override
  void answerConfirmation({required bool accepted}) => answers.add(accepted);
}

void main() {
  setUp(() {
    // The notifier takes its logger from the locator when it is created.
    getIt.registerLazySingleton<TbLogger>(MockTbLogger.new);
    addTearDown(getIt.reset);
  });

  // The view used to refresh the provider inside its first build. Riverpod
  // refreshes by rebuilding the ProviderScope, which Flutter forbids during a
  // build: an assertion, so a debug build showed the red error screen and
  // never started the switch, while a release build was fine.
  testWidgets('a scanned QR login link starts the switch without a build '
      'error', (tester) async {
    final started = <SwitchEndpointParams>[];
    final link = Uri.parse(
      'https://qr.example/api/noauth/qr?secret=one-time-secret&ttl=5',
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(FakeLogin.new),
          wlProvider.overrideWith(FakeWl.new),
          noauthProviderProvider.overrideWith(() => FakeNoauth(started)),
        ],
        child: MaterialApp(
          localizationsDelegates: const [S.delegate],
          home: SwitchEndpointNoAuthView(
            arguments: SwitchEndpointArgs(secret: 'one-time-secret', uri: link),
          ),
        ),
      ),
    );
    // The loader spins forever, so the page never settles.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(tester.takeException(), isNull);
    expect(started, hasLength(1));
    expect(started.single.data.secret, 'one-time-secret');
    // The step the switch reports reaches the screen.
    expect(find.textContaining('https://qr.example'), findsOneWidget);
  });

  group('before switching', () {
    Future<void> pumpConfirmation(
      WidgetTester tester,
      List<bool> answers, {
      String? email,
    }) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            loginProvider.overrideWith(FakeLogin.new),
            wlProvider.overrideWith(FakeWl.new),
            noauthProviderProvider.overrideWith(
              () => ConfirmingNoauth(answers, email: email),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: const [S.delegate],
            home: SwitchEndpointNoAuthView(
              arguments: SwitchEndpointArgs(
                uri: Uri.parse('https://other.example/api/noauth/qr'),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
    }

    final s = lookupS(const Locale('en'));

    testWidgets('names the server the link opens', (tester) async {
      await pumpConfirmation(tester, []);

      expect(find.text('https://other.example'), findsOneWidget);
      expect(find.text(s.linkOpensSignInPage), findsOneWidget);
    });

    testWidgets('names the account a login link signs in to', (tester) async {
      await pumpConfirmation(tester, [], email: 'user@other.example');

      expect(find.text(s.linkSignsInAs('user@other.example')), findsOneWidget);
    });

    testWidgets('passes the answer to the switch', (tester) async {
      final answers = <bool>[];
      await pumpConfirmation(tester, answers);

      await tester.tap(find.text(s.cancel));
      await tester.tap(find.text(s.continueText));

      expect(answers, [false, true]);
    });
  });
}
