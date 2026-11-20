// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/more/presentation/view/more_page.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/fake_wl.dart';

class MockNotificationService extends Mock implements NotificationService {}

class MockEndpointService extends Mock implements IEndpointService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockOverlayService extends Mock implements IOverlayService {}

class FakeLogin extends Login {
  @override
  LoginState build() =>
      const LoginState(isUserLoaded: true, userScope: Authority.TENANT_ADMIN);
}

class MorePages extends Navigation {
  @override
  NavigationState build() => const NavigationState(
    bottomBarPages: [],
    morePages: [
      NavigationItemData(
        title: 'Customers',
        icon: Icons.people,
        path: '/customers',
      ),
      NavigationItemData(title: 'Assets', icon: Icons.domain, path: '/assets'),
      NavigationItemData(
        title: 'Audit Logs',
        icon: Icons.track_changes,
        path: '/auditLogs',
      ),
      NavigationItemData(
        title: 'Notifications',
        icon: Icons.notifications,
        path: '/notifications',
      ),
    ],
  );
}

void main() {
  setUp(() {
    final notifications = MockNotificationService();
    when(notifications.updateNotificationsCount).thenAnswer((_) async {});
    final endpoints = MockEndpointService();
    when(endpoints.getCachedEndpoint).thenReturn('https://example.com');
    final deviceInfo = MockDeviceInfoService();
    when(deviceInfo.getBuildVersion).thenReturn('2.0.0');
    getIt
      ..registerSingleton<UserDetailsUseCase>(const UserDetailsUseCase())
      ..registerSingleton<NotificationService>(notifications)
      ..registerSingleton<IEndpointService>(endpoints)
      ..registerSingleton<IDeviceInfoService>(deviceInfo)
      ..registerSingleton<IOverlayService>(MockOverlayService());
    addTearDown(getIt.reset);
  });

  /// A phone held sideways: 914 x 411 logical pixels.
  Future<void> pumpLandscape(WidgetTester tester) async {
    tester.view.physicalSize = const Size(2400, 1080);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginProvider.overrideWith(FakeLogin.new),
          navigationProvider.overrideWith(MorePages.new),
          wlProvider.overrideWith(FakeWl.new),
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [S.delegate],
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (_, _) => const Scaffold(body: MorePage()),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
  }

  // Each row must fit in the viewport it scrolls in: a scroll area of its
  // own for the pages got only the height left over and cut every row.
  testWidgets('in landscape every row can be shown whole', (tester) async {
    await pumpLandscape(tester);

    for (final title in [
      'Customers',
      'Assets',
      'Audit Logs',
      'Notifications',
      'Log Out',
    ]) {
      final row = find.ancestor(
        of: find.text(title),
        matching: find.byType(ListTile),
      );
      await tester.ensureVisible(row);
      await tester.pump();
      final viewport = tester.getRect(
        find.ancestor(of: row, matching: find.byType(Scrollable)).first,
      );
      final rowRect = tester.getRect(row);
      expect(rowRect.top, greaterThanOrEqualTo(viewport.top), reason: title);
      expect(rowRect.bottom, lessThanOrEqualTo(viewport.bottom), reason: title);
    }
  });
}
