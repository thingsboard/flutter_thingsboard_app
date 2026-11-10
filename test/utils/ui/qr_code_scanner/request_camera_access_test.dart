// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/translation_utils.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/qr_code_scanner.dart';

class MockOverlayService extends Mock implements IOverlayService {}

const _permissions = MethodChannel('flutter.baseflow.com/permissions/methods');
const _cameraPermission = 1;
const _granted = 1;
const _permanentlyDenied = 4;

void main() {
  late MockOverlayService overlay;
  late List<String> calls;

  void answerCameraRequestWith(int status) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_permissions, (call) async {
          calls.add(call.method);
          return switch (call.method) {
            'requestPermissions' => {_cameraPermission: status},
            'openAppSettings' => true,
            _ => null,
          };
        });
  }

  setUpAll(
    () => registerFallbackValue(
      (BuildContext _) => DialogContent(title: '', message: ''),
    ),
  );

  setUp(() {
    calls = [];
    overlay = MockOverlayService();
    getIt.registerSingleton<IOverlayService>(overlay);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_permissions, null);
    getIt.reset();
  });

  Future<bool> request(WidgetTester tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );
    return await requestCameraAccess(context);
  }

  DialogContent shownDialog(BuildContext context) {
    final builder =
        verify(
              () => overlay.showConfirmDialog(
                content: captureAny(named: 'content'),
              ),
            ).captured.single
            as TranslatedDialogBuilder;
    return builder(context);
  }

  testWidgets('a granted camera needs no dialog', (tester) async {
    answerCameraRequestWith(_granted);

    expect(await request(tester), isTrue);
    verifyNever(
      () => overlay.showConfirmDialog(content: any(named: 'content')),
    );
  });

  testWidgets('a permanently denied camera offers to open the app settings', (
    tester,
  ) async {
    answerCameraRequestWith(_permanentlyDenied);
    when(() => overlay.showConfirmDialog(content: any(named: 'content')))
        .thenAnswer((_) async => true);

    expect(await request(tester), isFalse);
    final context = tester.element(find.byType(SizedBox));
    final dialog = shownDialog(context);
    expect(dialog.ok, S.of(context).openAppSettings);
    expect(dialog.cancel, S.of(context).cancel);
    expect(calls, contains('openAppSettings'));
  });

  testWidgets('cancelling the dialog leaves the settings closed', (
    tester,
  ) async {
    answerCameraRequestWith(_permanentlyDenied);
    when(() => overlay.showConfirmDialog(content: any(named: 'content')))
        .thenAnswer((_) async => false);

    expect(await request(tester), isFalse);
    expect(calls, isNot(contains('openAppSettings')));
  });
}
