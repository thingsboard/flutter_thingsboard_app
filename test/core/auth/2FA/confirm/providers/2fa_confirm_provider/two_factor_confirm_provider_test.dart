// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/models/two_factor_confirm_state.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_confirm_provider/two_factor_confirm_provider.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../../../helpers/connection_error.dart';
import '../../../../../../helpers/test_dependencies.dart';

class MockTwoFactorAuthControllerApi extends Mock
    implements TwoFactorAuthControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class FakeLogin extends Login {
  int loggedOut = 0;

  @override
  LoginState build() => const LoginState(isUserLoaded: true);

  @override
  Future<void> logout() async => loggedOut++;
}

void main() {
  late MockTwoFactorAuthControllerApi api;
  late MockOverlayService overlay;
  late MockThingsboardClient client;
  late MockTbClientService clientService;
  late FakeLogin login;
  late ProviderContainer container;
  final provider = twoFactorConfirmProvider(TwoFaProviderType.EMAIL, null);

  setUpAll(() {
    registerFallbackValue(TwoFaProviderType.EMAIL);
    registerFallbackValue((BuildContext _) => '');
  });

  setUp(() {
    api = MockTwoFactorAuthControllerApi();
    client = MockThingsboardClient();
    when(client.getTwoFactorAuthControllerApi).thenReturn(api);
    clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    when(() => clientService.reportUnsupportedServer(any())).thenReturn(false);
    overlay = MockOverlayService();
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService());
    login = FakeLogin();
    container = ProviderContainer(
      retry: (_, _) => null,
      overrides: [loginProvider.overrideWith(() => login)],
    );
    addTearDown(container.dispose);
    container.listen(provider, (_, _) {});
  });

  void stubSend(Future<Response<void>> Function() answer) => when(
    () => api.requestTwoFaVerificationCode(
      providerType: any(named: 'providerType'),
      extra: any(named: 'extra'),
    ),
  ).thenAnswer((_) => answer());

  test('a sent code waits for the resend timer', () async {
    stubSend(
      () async => Response(requestOptions: RequestOptions(), statusCode: 200),
    );

    await container.read(provider.notifier).sendCode();

    final state = container.read(provider);
    expect(state.codeSent, isTrue);
    expect(state.resendAvalible, isFalse);
  });

  test('a failed send lets the user request the code again', () async {
    stubSend(
      () => Future.error(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), statusCode: 429),
        ),
      ),
    );

    await container.read(provider.notifier).sendCode();

    final state = container.read(provider);
    expect(state.loading, isFalse);
    expect(state.resendAvalible, isTrue);
  });

  test('a failed send shows the server error', () async {
    stubSend(
      () => Future.error(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 500,
            data: {
              'message': 'Unable to send mail',
              'errorCode': 2,
              'status': 500,
            },
          ),
        ),
      ),
    );

    await container.read(provider.notifier).sendCode();

    verify(() => overlay.showErrorNotification(any())).called(1);
  });

  test('a sent code shows no error', () async {
    stubSend(
      () async => Response(requestOptions: RequestOptions(), statusCode: 200),
    );

    await container.read(provider.notifier).sendCode();

    verifyNever(() => overlay.showErrorNotification(any()));
  });

  test('a code is checked by the client that replaced the one the page '
      'started with', () async {
    // A failed QR-code switch closes the client and rolls back to a new one
    // while the verification page stays open.
    container.read(provider);
    final replacement = MockThingsboardClient();
    when(() => clientService.client).thenReturn(replacement);
    when(
      () => replacement.checkTwoFaVerificationCode(
        any(),
        any(),
        requestConfig: any(named: 'requestConfig'),
      ),
    ).thenAnswer((_) async => LoginResponse((b) => b..token = 't'));

    await container.read(provider.notifier).verifyCode('123456');

    verify(
      () => replacement.checkTwoFaVerificationCode(
        any(),
        any(),
        requestConfig: any(named: 'requestConfig'),
      ),
    ).called(1);
    verifyNever(
      () => client.checkTwoFaVerificationCode(
        any(),
        any(),
        requestConfig: any(named: 'requestConfig'),
      ),
    );
    expect(container.read(provider).codeState, CodeState.valid);
  });

  group('a code the server does not accept', () {
    void stubCheck(Object error) => when(
      () => client.checkTwoFaVerificationCode(
        any(),
        any(),
        requestConfig: any(named: 'requestConfig'),
      ),
    ).thenAnswer((_) => Future.error(error));

    Future<void> check(Object error) async {
      stubCheck(error);
      await container.read(provider.notifier).verifyCode('123456');
    }

    TwoFactorConfirmState state() => container.read(provider);

    test('is wrong', () async {
      await check(
        ThingsboardError(
          message: 'Verification code is incorrect',
          errorCode: ThingsBoardErrorCode.badRequestParams,
          status: 400,
        ),
      );

      expect(state().codeState, CodeState.invalid);
      expect(state().loading, isFalse);
    });

    test('was tried too often', () async {
      await check(
        ThingsboardError(
          message: 'Too many requests',
          errorCode: ThingsBoardErrorCode.tooManyRequests,
          status: 429,
        ),
      );

      expect(state().codeState, CodeState.tooManyRequests);
    });

    test('came after the verification time ran out: back to sign in', () async {
      await check(
        ThingsboardError(
          message: 'Session expired!',
          errorCode: ThingsBoardErrorCode.jwtTokenExpired,
        ),
      );

      expect(state().codeState, isNot(CodeState.invalid));
      expect(login.loggedOut, 1);
      verify(() => overlay.showErrorNotification(any())).called(1);
    });

    test('could not reach the server: the code can be sent again', () async {
      await check(connectionError());

      expect(state().codeState, CodeState.empty);
      verify(overlay.showConnectionErrorDialog).called(1);
      expect(login.loggedOut, 0);
    });

    test('for another reason shows what the server says', () async {
      const locked =
          'User account was locked due to exceeded 2FA verification attempts';
      await check(
        ThingsboardError(
          message: locked,
          errorCode: ThingsBoardErrorCode.authentication,
          status: 401,
        ),
      );

      expect(state().codeState, CodeState.rejected);
      expect(state().rejectionMessage, locked);
    });

    test('is forgotten when the next code is checked', () async {
      await check(
        ThingsboardError(
          message: 'Account is locked',
          errorCode: ThingsBoardErrorCode.authentication,
          status: 401,
        ),
      );
      final answer = Completer<LoginResponse>();
      when(
        () => client.checkTwoFaVerificationCode(
          any(),
          any(),
          requestConfig: any(named: 'requestConfig'),
        ),
      ).thenAnswer((_) => answer.future);

      final next = container.read(provider.notifier).verifyCode('654321');

      expect(state().loading, isTrue);
      expect(state().codeState, CodeState.empty);
      expect(state().rejectionMessage, isNull);
      answer.completeError(connectionError());
      await next;
      expect(state().codeState, CodeState.empty);
    });
  });
}
