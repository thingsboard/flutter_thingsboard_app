// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/providers/2fa_confirm_provider/two_factor_confirm_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../../helpers/test_dependencies.dart';

class MockTwoFactorAuthControllerApi extends Mock
    implements TwoFactorAuthControllerApi {}

void main() {
  late MockTwoFactorAuthControllerApi api;
  late ProviderContainer container;
  final provider = twoFactorConfirmProvider(TwoFaProviderType.EMAIL, null);

  setUpAll(() => registerFallbackValue(TwoFaProviderType.EMAIL));

  setUp(() {
    api = MockTwoFactorAuthControllerApi();
    final client = MockThingsboardClient();
    when(client.getTwoFactorAuthControllerApi).thenReturn(api);
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
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
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 429,
          ),
        ),
      ),
    );

    await container.read(provider.notifier).sendCode();

    final state = container.read(provider);
    expect(state.loading, isFalse);
    expect(state.resendAvalible, isTrue);
  });
}
