// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/login_routes.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/version/presentation/server_version_redirect.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../helpers/test_dependencies.dart';

class FakeLogin extends Login {
  FakeLogin(this.initial);

  final LoginState initial;

  @override
  LoginState build() => initial;
}

class FakeNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);

  @override
  String? resolveHomePath() => '/home';
}

class MockDeviceInfo extends Mock implements IDeviceInfoService {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockContext extends Mock implements BuildContext {}

class MockRouteConfiguration extends Mock implements RouteConfiguration {}

final _refProvider = Provider<Ref>((ref) => ref);

void main() {
  late MockTbClientService clientService;
  late MockThingsboardClient client;
  late ValueNotifier<UnsupportedServerVersionError?> unsupported;

  setUp(() {
    client = MockThingsboardClient();
    clientService = MockTbClientService();
    unsupported = ValueNotifier(null);
    when(() => clientService.client).thenReturn(client);
    when(() => clientService.unsupportedServer).thenReturn(unsupported);
    getIt
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IDeviceInfoService>(MockDeviceInfo())
      ..registerSingleton<IOverlayService>(MockOverlayService());
    addTearDown(getIt.reset);
  });

  Future<String?> redirectFrom(String path, {required LoginState login}) {
    final container = ProviderContainer(
      overrides: [
        loginProvider.overrideWith(() => FakeLogin(login)),
        navigationProvider.overrideWith(FakeNavigation.new),
      ],
    );
    addTearDown(container.dispose);
    final state = GoRouterState(
      MockRouteConfiguration(),
      uri: Uri.parse(path),
      matchedLocation: path,
      fullPath: path,
      pathParameters: const {},
      pageKey: ValueKey(path),
    );
    return ServerVersionRedirect().redirect(
      MockContext(),
      state,
      container.read(_refProvider),
    );
  }

  const signedIn = LoginState(
    isUserLoaded: true,
    userScope: Authority.TENANT_ADMIN,
  );
  const signedOut = LoginState(isUserLoaded: false);

  test('holds the app on the page while the server is unsupported', () async {
    unsupported.value = UnsupportedServerVersionError('4.2.2.8', '4.4.0');

    expect(
      await redirectFrom('/home', login: signedIn),
      ServerVersionRedirect.page,
    );
    expect(
      await redirectFrom(ServerVersionRedirect.page, login: signedIn),
      isNull,
    );
  });

  test('leaves the page for the login page without a session', () async {
    when(client.isAuthenticated).thenReturn(false);

    expect(
      await redirectFrom(ServerVersionRedirect.page, login: signedOut),
      LoginRoutes.login,
    );
  });

  test('leaves the page for the home page of a session a rolled back switch '
      'kept', () async {
    when(client.isAuthenticated).thenReturn(true);

    expect(
      await redirectFrom(ServerVersionRedirect.page, login: signedIn),
      '/home',
    );
  });

  test(
    'leaves the page for the login page when the login state is stale',
    () async {
      when(client.isAuthenticated).thenReturn(false);

      expect(
        await redirectFrom(ServerVersionRedirect.page, login: signedIn),
        LoginRoutes.login,
      );
    },
  );
}
