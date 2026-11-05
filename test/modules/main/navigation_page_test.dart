// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/model/navigation_state.dart';
import 'package:thingsboard_app/modules/main/navigation_page.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_session.dart';

class MockLiveLocationTrackingService extends Mock
    implements ILiveLocationTrackingService {}

class MockNotificationService extends Mock implements NotificationService {}

/// The real notifier subscribes to device orientation and reads the login
/// state; the shell only needs a page whose path matches the route.
class FakeNavigation extends Navigation {
  @override
  NavigationState build() => const NavigationState(
    bottomBarPages: [
      NavigationItemData(
        title: 'Home',
        icon: Icons.home,
        path: '/home',
        id: 'home',
      ),
    ],
    morePages: [],
  );
}

/// Reports the [MediaQueryData] the shell hands to the page under it.
class PageInsetsProbe extends StatelessWidget {
  const PageInsetsProbe({super.key, required this.onBuild});

  final ValueChanged<MediaQueryData> onBuild;

  @override
  Widget build(BuildContext context) {
    onBuild(MediaQuery.of(context));
    return const SizedBox.expand();
  }
}

LiveTrackingSession trackingSession() => LiveTrackingSession(
  config: const LiveTrackingConfig(
    target: LiveTrackingTarget(entityType: 'DEVICE', id: 'device-1'),
    keys: [
      LiveTrackingKey(
        key: LiveTrackingKeyType.latitude,
        label: 'latitude',
        valueType: LiveTrackingValueType.timeseries,
      ),
    ],
  ),
  status: LiveTrackingStatus.tracking,
  startedAt: DateTime.fromMillisecondsSinceEpoch(1700000000000),
);

void main() {
  late MockLiveLocationTrackingService trackingService;

  setUp(() {
    trackingService = MockLiveLocationTrackingService();
    when(
      () => trackingService.sessionStream,
    ).thenAnswer((_) => const Stream<LiveTrackingSession?>.empty());

    final notificationService = MockNotificationService();
    when(
      () => notificationService.updateNotificationsCount(),
    ).thenAnswer((_) async {});

    getIt
      ..registerLazySingleton<ILiveLocationTrackingService>(
        () => trackingService,
      )
      ..registerLazySingleton<NotificationService>(() => notificationService);
    addTearDown(getIt.reset);
  });

  /// Pumps the shell with a system status bar, a gesture inset and an open
  /// keyboard, and returns the insets the page below the shell receives.
  Future<MediaQueryData> pumpShell(WidgetTester tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(400, 800);
    tester.view.padding = const FakeViewPadding(top: 40, bottom: 30);
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(tester.view.reset);

    late MediaQueryData pageInsets;
    final router = GoRouter(
      initialLocation: '/home',
      routes: [
        ShellRoute(
          builder: (context, state, child) => NavigationPage(child: child),
          routes: [
            GoRoute(
              path: '/home',
              builder:
                  (context, state) =>
                      PageInsetsProbe(onBuild: (data) => pageInsets = data),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [navigationProvider.overrideWith(FakeNavigation.new)],
        child: MaterialApp.router(
          routerConfig: router,
          // BottomNavbarItems reads selectedItemColor non-null, the way the
          // app's own theme provides it.
          theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          ),
          localizationsDelegates: const [S.delegate],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
    return pageInsets;
  }

  group('NavigationPage insets', () {
    testWidgets('leaves the page untouched when no session is running', (
      tester,
    ) async {
      when(() => trackingService.session).thenReturn(null);

      final pageInsets = await pumpShell(tester);

      expect(pageInsets.padding.top, 40);
      expect(pageInsets.padding.bottom, 0);
      expect(pageInsets.viewInsets.bottom, 0);
    });

    testWidgets('drops only the status bar inset while the bar is visible', (
      tester,
    ) async {
      when(() => trackingService.session).thenReturn(trackingSession());

      final pageInsets = await pumpShell(tester);

      expect(
        pageInsets.padding.top,
        0,
        reason: 'the tracking bar owns the status bar inset',
      );
      expect(
        pageInsets.padding.bottom,
        0,
        reason: 'Scaffold removed it for the bottom navigation bar',
      );
      expect(
        pageInsets.viewInsets.bottom,
        0,
        reason: 'Scaffold removed the keyboard inset for its own body',
      );
    });
  });
}
