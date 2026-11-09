// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/presentation/device_dashboard_navigation.dart';
import 'package:thingsboard_app/utils/services/communication/communication_service.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/test_dependencies.dart';
import '../../main/presentation/providers/navigation_test_utils.dart';

class MockDeviceApi extends Mock implements DeviceControllerApi {}

class MockDeviceProfileApi extends Mock implements DeviceProfileControllerApi {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockOverlayService extends Mock implements IOverlayService {}

/// The login notifier reads these services when it is created.
class FakeLogin extends Login {
  @override
  LoginState build() => fullAccessTenantAdmin;
}

void main() {
  setUp(() {
    final client = MockThingsboardClient();
    final devices = MockDeviceApi();
    final profiles = MockDeviceProfileApi();
    when(client.getDeviceControllerApi).thenReturn(devices);
    when(client.getDeviceProfileControllerApi).thenReturn(profiles);
    when(() => devices.getDeviceById(deviceId: 'device-1')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        data: Device(
          (b) => b
            ..name = 'Pump'
            ..type = 'navigation-test-profile'
            ..deviceProfileId.id = 'profile-1'
            ..deviceProfileId.entityType = EntityType.DEVICE_PROFILE,
        ),
      ),
    );
    when(() => profiles.getDeviceProfileInfoById(deviceProfileId: 'profile-1'))
        .thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            data: DeviceProfileInfo(
              (b) => b
                ..name = 'navigation-test-profile'
                ..defaultDashboardId.id = 'dashboard-1'
                ..defaultDashboardId.entityType = EntityType.DASHBOARD,
            ),
          ),
        );
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    getIt
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfoService())
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<ICommunicationService>(
        CommunicationService(EventBus()),
      );
  });

  // Picked from the search results, the device's dashboard used to replace
  // them: Back then went to the full device list.
  testWidgets('Back from the dashboard returns to the search results', (
    tester,
  ) async {
    final router = GoRouter(
      navigatorKey: globalNavigatorKey,
      initialLocation: '/search',
      routes: [
        GoRoute(
          path: '/search',
          builder: (context, _) => Consumer(
            builder: (context, ref, _) => Scaffold(
              body: TextButton(
                onPressed: () => openDeviceProfileDashboard(
                  ref,
                  deviceId: DeviceId((b) => b..id = 'device-1'),
                  deviceType: 'navigation-test-profile',
                  deviceName: 'Pump',
                ),
                child: const Text('search results'),
              ),
            ),
          ),
        ),
        GoRoute(
          path: DashboardRoutes.dashboard,
          builder: (_, _) => const Scaffold(body: Text('dashboard')),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [loginProvider.overrideWith(FakeLogin.new)],
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    await tester.tap(find.text('search results'));
    await tester.pumpAndSettle();
    expect(find.text('dashboard'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('search results'), findsOneWidget);
  });
}
