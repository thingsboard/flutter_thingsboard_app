// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/utils/services/overlay_service/overlay_service.dart';
import 'package:toastification/toastification.dart';

void main() {
  testWidgets('an English message in an RTL language keeps its direction', (
    tester,
  ) async {
    const message = 'SMS sending is disabled due to API limits!';
    await tester.pumpWidget(
      ToastificationWrapper(
        child: MaterialApp(
          navigatorKey: globalNavigatorKey,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          home: const SizedBox(),
        ),
      ),
    );

    OverlayService().showErrorNotification((_) => message);
    await tester.pumpAndSettle();

    final text = tester.widget<Text>(find.text(message));
    expect(text.textDirection, TextDirection.ltr);
    expect(text.textAlign, TextAlign.right);
    toastification.dismissAll(delayForAnimation: false);
    await tester.pumpAndSettle();
  });
}
