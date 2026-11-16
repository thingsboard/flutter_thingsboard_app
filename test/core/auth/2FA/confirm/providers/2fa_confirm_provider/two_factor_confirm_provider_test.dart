// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_confirm_provider/two_factor_confirm_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../../../helpers/test_dependencies.dart';

class MockTwoFactorAuthControllerApi extends Mock
    implements TwoFactorAuthControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

void main() {
  late MockTwoFactorAuthControllerApi api;
  late MockOverlayService overlay;
  late ProviderContainer container;
  final provider = twoFactorConfirmProvider(TwoFaProviderType.EMAIL, null);

  setUpAll(() {
    registerFallbackValue(TwoFaProviderType.EMAIL);
    registerFallbackValue((BuildContext _) => '');
  });

  setUp(() {
    api = MockTwoFactorAuthControllerApi();
    final client = MockThingsboardClient();
    when(client.getTwoFactorAuthControllerApi).thenReturn(api);
    final clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    when(() => clientService.reportUnsupportedServer(any())).thenReturn(false);
    overlay = MockOverlayService();
    getIt.registerSingleton<IOverlayService>(overlay);
    container = ProviderContainer(retry: (_, _) => null);
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
}
