// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/esp_provisioning_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/home_routes.dart';

void main() {
  late GoRouter router;

  Future<void> pumpRouter(WidgetTester tester) async {
    router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const Text('start')),
        GoRoute(path: HomeRoutes.home, builder: (_, _) => const Text('home')),
        ...espProvisioningRoutes,
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
  }

  String location() => router.routerDelegate.currentConfiguration.uri.path;

  for (final path in [
    EspProvisioningRoutes.espBleProvisioning,
    EspProvisioningRoutes.espSoftApProvisioning,
  ]) {
    testWidgets('$path opened from a link leads home', (tester) async {
      await pumpRouter(tester);

      router.go('$path?deviceName=dev&deviceSecretKey=key&name=dev&pop=key');
      await tester.pumpAndSettle();

      expect(location(), HomeRoutes.home);
      expect(find.text('home'), findsOneWidget);
    });
  }

  testWidgets('the provisioning action opens the screen with its data', (
    tester,
  ) async {
    await pumpRouter(tester);
    const args = EspProvisioningArgs(
      deviceName: 'dev',
      deviceSecretKey: 'key',
      name: 'dev',
      pop: 'key',
    );

    router.go(EspProvisioningRoutes.espSoftApProvisioning, extra: args);
    await tester.pump();
    // The screen itself needs the device's Wi-Fi and Bluetooth plugins.
    tester.takeException();

    final current = router.routerDelegate.currentConfiguration;
    expect(current.uri.path, EspProvisioningRoutes.espSoftApProvisioning);
    expect(current.extra, same(args));
  });
}
