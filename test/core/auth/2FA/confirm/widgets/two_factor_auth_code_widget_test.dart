// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/2FA/confirm/widgets/two_factor_auth_code_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../../helpers/connection_error.dart';
import '../../../../../helpers/cutout_phone.dart';
import '../../../../../helpers/test_dependencies.dart';

class MockTwoFactorAuthControllerApi extends Mock
    implements TwoFactorAuthControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

const _incorrect = 'Verification code is incorrect';

void main() {
  late MockThingsboardClient client;
  late MockTwoFactorAuthControllerApi api;

  setUpAll(() => registerFallbackValue(TwoFaProviderType.EMAIL));

  setUp(() {
    client = MockThingsboardClient();
    api = MockTwoFactorAuthControllerApi();
    when(client.getTwoFactorAuthControllerApi).thenReturn(api);
    final clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    when(() => clientService.reportUnsupportedServer(any())).thenReturn(false);
    getIt.registerSingleton<IOverlayService>(MockOverlayService());
  });

  void answerCheck(Future<LoginResponse> Function() answer) => when(
    () => client.checkTwoFaVerificationCode(
      any(),
      any(),
      requestConfig: any(named: 'requestConfig'),
    ),
  ).thenAnswer((_) => answer());

  Future<LoginResponse> wrongCode() => Future.error(
    ThingsboardError(
      message: _incorrect,
      errorCode: ThingsBoardErrorCode.badRequestParams,
      status: 400,
    ),
  );

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          home: Scaffold(
            body: EnterACodeWidget(
              selectedProvider: TwoFaProviderInfo(
                (b) => b
                  ..type = TwoFaProviderType.EMAIL
                  ..contact = 'u***@example.com',
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('the code field stays above a landscape keyboard', (
    tester,
  ) async {
    useCutoutPhone(tester, Orientation.landscape);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          home: Scaffold(
            appBar: AppBar(title: const Text('2FA')),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: EnterACodeWidget(
                  selectedProvider: TwoFaProviderInfo(
                    (b) => b
                      ..type = TwoFaProviderType.EMAIL
                      ..contact = 'u***@example.com',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final field = find.byType(EditableText);

    await openKeyboard(tester, field);

    expect(tester.takeException(), isNull);
    expectAboveKeyboard(tester, field);
  });

  Future<void> submit(WidgetTester tester, String code) async {
    await tester.enterText(find.byType(TextField), code);
    await tester.pumpAndSettle();
  }

  testWidgets('a wrong code is reported each time', (tester) async {
    answerCheck(wrongCode);
    await pumpWidget(tester);

    await submit(tester, '111111');
    expect(find.text(_incorrect), findsOneWidget);

    await submit(tester, '222222');
    expect(find.text(_incorrect), findsOneWidget);
  });

  testWidgets(
    'a code that could not be checked keeps it and drops the old rejection',
    (tester) async {
      answerCheck(wrongCode);
      await pumpWidget(tester);
      await submit(tester, '111111');
      final answer = Completer<LoginResponse>();
      answerCheck(() => answer.future);

      await submit(tester, '222222');
      expect(find.text(_incorrect), findsNothing);
      answer.completeError(connectionError());
      await tester.pumpAndSettle();

      expect(find.text(_incorrect), findsNothing);
      expect(find.text('222222'), findsOneWidget);
    },
  );

  testWidgets('Resend after a wrong code does not report it again', (
    tester,
  ) async {
    answerCheck(wrongCode);
    when(
      () => api.requestTwoFaVerificationCode(
        providerType: any(named: 'providerType'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer(
      (_) async => Response(requestOptions: RequestOptions(), statusCode: 200),
    );
    await pumpWidget(tester);
    await submit(tester, '111111');

    await tester.tap(find.text('Resend code'));
    await tester.pumpAndSettle();

    expect(find.text(_incorrect), findsNothing);
  });
}
