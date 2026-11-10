// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/qr_code_scanner.dart';

class MockScannerController extends Mock implements MobileScannerController {}

void main() {
  late MockScannerController controller;

  setUp(() {
    controller = MockScannerController();
    when(() => controller.start()).thenAnswer((_) async {});
  });

  void scannerIs({bool starting = false, bool running = false}) {
    when(() => controller.value).thenReturn(
      const MobileScannerState.uninitialized().copyWith(
        isStarting: starting,
        isRunning: running,
      ),
    );
  }

  test('a scanner still asking for the permission is not started again', () {
    scannerIs(starting: true);

    startScannerAfterGrant(controller);

    verifyNever(() => controller.start());
  });

  test('a running scanner is left running', () {
    scannerIs(running: true);

    startScannerAfterGrant(controller);

    verifyNever(() => controller.start());
  });

  test('a scanner that failed without the permission starts', () async {
    scannerIs();

    await startScannerAfterGrant(controller);

    verify(() => controller.start()).called(1);
  });
}
