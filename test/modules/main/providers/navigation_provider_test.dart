import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/models/mobile_basic_info.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/model/navigation_state.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_helper.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

import 'navigation_test_utils.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class FakeLogin extends Login {
  FakeLogin(this.loginState);

  final LoginState loginState;

  @override
  LoginState build() => loginState;
}

List<String> pathsOf(List<NavigationItemData> items) =>
    items.map((e) => e.path).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockStreamHandler(
          const EventChannel('native_device_orientation_events'),
          MockStreamHandler.inline(onListen: (_, _) {}),
        );
    getIt
      ..registerLazySingleton<IOverlayService>(() => MockOverlayService())
      ..registerLazySingleton<IDeviceInfoService>(
        () => MockDeviceInfoService(),
      );
    addTearDown(getIt.reset);
  });

  ProviderContainer containerFor(FakeLogin fakeLogin) {
    final container = ProviderContainer(
      overrides: [loginProvider.overrideWith(() => fakeLogin)],
    );
    addTearDown(container.dispose);
    return container;
  }

  NavigationState navigationFor(LoginState login) {
    final container = containerFor(FakeLogin(login));
    final navigation = container.listen(navigationProvider, (_, _) {});
    container.read(navigationProvider.notifier).resolveHomePath();
    return navigation.read();
  }

  group('Navigation default layout', () {
    test('sysadmin without a mobile bundle gets the allowlisted pages', () {
      expect(
        pathsOf(navigationFor(loginAs(Authority.SYS_ADMIN)).bottomBarPages),
        ['/home', '/notifications', '/auditLogs', fullScreenProfile],
      );
    });

    test('sysadmin default layout lists every page the allowlist admits', () {
      final sysAdmin = loginAs(Authority.SYS_ADMIN);
      final allowedPages = {
        for (final id in Pages.values)
          if (id != Pages.undefined &&
              NavigationHelper.isPageVisible(PageLayout(id: id), sysAdmin))
            id.name,
      };
      final navigation = navigationFor(sysAdmin);

      final layoutPages = {
        for (final item in [
          ...navigation.bottomBarPages,
          ...navigation.morePages,
        ])
          if (item.id != null) item.id!,
      };

      expect(layoutPages, allowedPages);
    });

    test('tenant admin without a mobile bundle keeps the tenant pages', () {
      expect(pathsOf(navigationFor(fullAccessTenantAdmin).bottomBarPages), [
        '/home',
        '/alarms',
        '/devices',
        '/more',
      ]);
    });
  });

  test('sysadmin bundle keeps only the allowlisted and custom pages', () {
    final sysAdmin = loginAs(Authority.SYS_ADMIN).copyWith(
      mobileLoginInfo: const MobileBasicInfo(
        pages: [
          PageLayout(id: Pages.home),
          PageLayout(id: Pages.alarms),
          PageLayout(
            id: Pages.undefined,
            label: 'Dashboard',
            dashboardId: 'dash-1',
          ),
          PageLayout(id: Pages.devices),
          PageLayout(id: Pages.notifications),
          PageLayout(id: Pages.customers),
          PageLayout(
            id: Pages.undefined,
            label: 'Web',
            url: 'https://example.com',
          ),
          PageLayout(id: Pages.assets),
          PageLayout(id: Pages.audit_logs),
        ],
      ),
    );

    final navigation = navigationFor(sysAdmin);

    expect(pathsOf(navigation.bottomBarPages), [
      '/home',
      '/dashboard/dash-1',
      '/notifications',
      '/more',
    ]);
    expect(pathsOf(navigation.morePages), [
      '/url/${Uri.encodeComponent('https://example.com')}',
      '/auditLogs',
    ]);
  });
}
