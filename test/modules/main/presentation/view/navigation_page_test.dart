// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_session.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_type.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/main/presentation/view/navigation_page.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';

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
class ThreeTabsNavigation extends Navigation {
  @override
  NavigationState build() => const NavigationState(
    bottomBarPages: [
      NavigationItemData(
        title: 'Home',
        icon: Icons.home,
        path: '/home',
        id: 'home',
      ),
      NavigationItemData(
        title: 'Alarms',
        icon: Icons.notifications,
        path: '/alarms',
        id: 'alarms',
      ),
      NavigationItemData(
        title: 'Devices',
        icon: Icons.devices,
        path: '/devices',
        id: 'devices',
      ),
    ],
    morePages: [],
  );
}

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
    when(() => trackingService.sessionStream)
        .thenAnswer((_) => const Stream<LiveTrackingSession?>.empty());

    final notificationService = MockNotificationService();
    when(() => notificationService.updateNotificationsCount())
        .thenAnswer((_) async {});

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
              builder: (context, state) =>
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
          supportedLocales: S.supportedLocales,
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

  group('Bottom bar tabs and Back', () {
    late GoRouter router;
    late int appExits;

    setUp(() {
      appExits = 0;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (call) async {
            if (call.method == 'SystemNavigator.pop') appExits++;
            return null;
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null),
      );
    });

    Future<void> pumpTabs(WidgetTester tester, TbNavigationType type) async {
      when(() => trackingService.session).thenReturn(null);
      Widget page(String name) => Scaffold(body: Text('page $name'));
      router = GoRouter(
        initialLocation: '/home',
        routes: [
          ShellRoute(
            builder: (context, state, child) =>
                NavigationPage(navigationType: type, child: child),
            routes: [
              GoRoute(path: '/home', builder: (_, _) => page('home')),
              GoRoute(path: '/alarms', builder: (_, _) => page('alarms')),
              GoRoute(
                path: '/devices',
                builder: (context, _) => Scaffold(
                  body: TextButton(
                    onPressed: () => context.push('/deviceList'),
                    child: const Text('page devices'),
                  ),
                ),
              ),
              GoRoute(
                path: '/deviceList',
                builder: (_, _) => page('device list'),
              ),
            ],
          ),
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [navigationProvider.overrideWith(ThreeTabsNavigation.new)],
          child: MaterialApp.router(
            routerConfig: router,
            theme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
              ),
            ),
            localizationsDelegates: const [S.delegate],
            supportedLocales: S.supportedLocales,
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    /// The page the user sees: go_router does not report pushed pages in
    /// the route location.
    void expectPage(String name) =>
        expect(find.text(name), findsOneWidget, reason: 'shows \$name');

    Future<void> tapTab(WidgetTester tester, String title) async {
      await tester.tap(find.text(title).last);
      await tester.pumpAndSettle();
    }

    /// The system Back button (Android back gesture / key).
    Future<void> back(WidgetTester tester) async {
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
    }

    testWidgets('tabs do not pile up: Back goes to the first tab, then exits', (
      tester,
    ) async {
      await pumpTabs(tester, TbNavigationType.tabs);

      await tapTab(tester, 'Alarms');
      await tapTab(tester, 'Devices');
      await tapTab(tester, 'Home');
      await tapTab(tester, 'Alarms');
      expectPage('page alarms');

      await back(tester);
      expectPage('page home');
      expect(appExits, 0);

      await back(tester);
      expect(appExits, 1);
    });

    testWidgets('Back closes the pages opened in a tab before leaving it', (
      tester,
    ) async {
      await pumpTabs(tester, TbNavigationType.tabs);
      await tapTab(tester, 'Devices');
      await tester.tap(find.text('page devices'));
      await tester.pumpAndSettle();
      expectPage('page device list');

      await back(tester);
      expectPage('page devices');

      await back(tester);
      expectPage('page home');
      expect(appExits, 0);
    });

    testWidgets('push keeps the tab history for apps that opt in', (
      tester,
    ) async {
      await pumpTabs(tester, TbNavigationType.push);

      await tapTab(tester, 'Alarms');
      await tapTab(tester, 'Devices');

      await back(tester);
      expectPage('page alarms');
    });
  });

  group('TbNavigationType', () {
    test('defaults to tabs without or with an unknown dart-define', () {
      expect(TbNavigationType.fromString(null), TbNavigationType.tabs);
      expect(TbNavigationType.fromString(''), TbNavigationType.tabs);
      expect(TbNavigationType.fromString('push'), TbNavigationType.push);
    });

    test('mixed pushes all tabs but Home and URL pages', () {
      expect(TbNavigationType.mixed.pushesTab('/home'), isFalse);
      expect(TbNavigationType.mixed.pushesTab('/url/abc'), isFalse);
      expect(TbNavigationType.mixed.pushesTab('/alarms'), isTrue);
      expect(TbNavigationType.tabs.pushesTab('/alarms'), isFalse);
    });
  });
}
