import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/select_region/model/region.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

import '../../helpers/test_dependencies.dart';

class MockWhiteLabelingControllerApi extends Mock
    implements WhiteLabelingControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

/// The white-labeling provider only asks the login state whether the user is
/// fully authenticated; the real notifier would start loading the user.
class FakeLogin extends Login {
  @override
  LoginState build() =>
      const LoginState(isUserLoaded: true, userScope: Authority.TENANT_ADMIN);

  void logOut() => state = const LoginState(isUserLoaded: false);

  void logIn() => state = build();
}

const systemInfoPath = '/api/system/info';

WhiteLabelingParams wlParams([
  void Function(WhiteLabelingParamsBuilder b)? update,
]) => WhiteLabelingParams((b) {
  b.logoImageUrl = defaultLogoUrl;
  update?.call(b);
});

/// Disposes [container] when flutter_test unmounts the widget tree, which it
/// does before checking for pending timers; the white-labeling poll timer
/// lives until the provider is disposed.
class DisposeWithTree extends StatefulWidget {
  const DisposeWithTree({
    required this.container,
    required this.child,
    super.key,
  });

  final ProviderContainer container;
  final Widget child;

  @override
  State<DisposeWithTree> createState() => _DisposeWithTreeState();
}

class _DisposeWithTreeState extends State<DisposeWithTree> {
  @override
  void dispose() {
    widget.container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

Response<WhiteLabelingParams> wlResponse(WhiteLabelingParams? params) =>
    Response(data: params, requestOptions: RequestOptions());

Response<LoginWhiteLabelingParams> loginWlResponse() => Response(
  data: LoginWhiteLabelingParams((b) => b..logoImageUrl = defaultLogoUrl),
  requestOptions: RequestOptions(),
);

Response<Map<String, dynamic>> systemInfoResponse(String? version) => Response(
  data: {if (version != null) 'version': version, 'type': 'PE'},
  requestOptions: RequestOptions(),
);

void main() {
  late MockTbClientService clientService;
  late MockThingsboardClient staleClient;
  late MockThingsboardClient liveClient;
  late MockWhiteLabelingControllerApi staleApi;
  late MockWhiteLabelingControllerApi liveApi;

  setUpAll(() => registerFallbackValue(Options()));

  Future<Response<Map<String, dynamic>>> systemInfoCall() =>
      liveClient.get<Map<String, dynamic>>(
        systemInfoPath,
        options: any(named: 'options'),
      );

  void stubSystemInfo(String? version) =>
      when(systemInfoCall).thenAnswer((_) async => systemInfoResponse(version));

  void stubSystemInfoFailure() =>
      when(systemInfoCall).thenThrow(ThingsboardError(message: 'Forbidden'));

  setUp(() {
    staleClient = MockThingsboardClient();
    liveClient = MockThingsboardClient();
    staleApi = MockWhiteLabelingControllerApi();
    liveApi = MockWhiteLabelingControllerApi();
    when(
      () => staleClient.getWhiteLabelingControllerApi(),
    ).thenReturn(staleApi);
    when(() => liveClient.getWhiteLabelingControllerApi()).thenReturn(liveApi);
    // What HttpInterceptor.onRequest does on a client whose in-memory JWT is
    // null: the request is rejected before it leaves the device (PROD-8879).
    when(
      () => staleApi.getWhiteLabelParams(),
    ).thenThrow(ThingsboardError(message: 'Unauthorized!'));
    // What the server answers when no admin typed a platform version into the
    // white-labeling settings: the field is simply null.
    when(() => liveApi.getWhiteLabelParams()).thenAnswer(
      (_) async => wlResponse(
        WhiteLabelingParams((b) => b..logoImageUrl = defaultLogoUrl),
      ),
    );
    stubSystemInfo('4.4.0PE');

    final localDatabase = MockLocalDatabaseService();
    when(
      () => localDatabase.getSelectedRegion(),
    ).thenAnswer((_) async => Region.europe);
    clientService = registerTestDependencies(
      tbClient: liveClient,
      localDatabase: localDatabase,
      firebaseService: MockFirebaseService(),
    );
    // Resolved by Login's field initializers when FakeLogin is constructed.
    getIt
      ..registerLazySingleton<IOverlayService>(() => MockOverlayService())
      ..registerLazySingleton<IDeviceInfoService>(
        () => MockDeviceInfoService(),
      );
  });

  /// Mounts an app around the provider and returns the notifier.
  Future<Wl> pumpWlProvider(
    WidgetTester tester,
    ProviderContainer container,
  ) async {
    // _updateImages() resolves the global navigator context, so the
    // provider needs a mounted app around it.
    await tester.pumpWidget(
      DisposeWithTree(
        container: container,
        child: UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            navigatorKey: globalNavigatorKey,
            home: const SizedBox(),
          ),
        ),
      ),
    );
    // The provider is autoDispose; the app root keeps it alive with a watch,
    // which is what lets it outlive a client re-creation.
    container.listen(wlProvider, (_, _) {});
    return container.read(wlProvider.notifier);
  }

  ProviderContainer makeContainer() {
    final container = ProviderContainer(
      overrides: [loginProvider.overrideWith(FakeLogin.new)],
    );
    addTearDown(container.dispose);
    return container;
  }

  // A real device reports every intermediate state (the engine message path
  // fills them in); calling the binding directly does not.
  void sendToBackground(WidgetTester tester) {
    for (final state in [
      AppLifecycleState.inactive,
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
    ]) {
      tester.binding.handleAppLifecycleStateChanged(state);
    }
  }

  void bringToForeground(WidgetTester tester) {
    for (final state in [
      AppLifecycleState.hidden,
      AppLifecycleState.inactive,
      AppLifecycleState.resumed,
    ]) {
      tester.binding.handleAppLifecycleStateChanged(state);
    }
  }

  testWidgets('updateWhiteLabeling uses the client current at call time, '
      'not the one captured when the provider was built', (tester) async {
    when(() => clientService.client).thenReturn(staleClient);
    final container = makeContainer();
    final wl = await pumpWlProvider(tester, container);

    // A QR-code login re-creates the client (TbClientService.reInit).
    when(() => clientService.client).thenReturn(liveClient);
    await wl.updateWhiteLabeling();

    verify(() => liveApi.getWhiteLabelParams()).called(1);
    verifyNever(() => staleApi.getWhiteLabelParams());
    expect(container.read(wlProvider).isUserWlMode, isTrue);
  });

  group('polling (PROD-8928)', () {
    setUp(() {
      when(() => clientService.client).thenReturn(liveClient);
    });

    testWidgets('re-fetches white-labeling every poll interval', (
      tester,
    ) async {
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      await tester.pump(wlPollInterval - const Duration(seconds: 1));
      verifyNever(() => liveApi.getWhiteLabelParams());

      await tester.pump(const Duration(seconds: 1));
      verify(() => liveApi.getWhiteLabelParams()).called(1);

      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);
    });

    testWidgets('does not poll while the app is in the background', (
      tester,
    ) async {
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      sendToBackground(tester);
      await tester.pump(wlPollInterval * 10);
      verifyNever(() => liveApi.getWhiteLabelParams());

      bringToForeground(tester);
      // Coming back to the foreground fetches right away, then on schedule.
      await tester.pump();
      verify(() => liveApi.getWhiteLabelParams()).called(1);
      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);
    });

    testWidgets('an unchanged response does not emit a new state', (
      tester,
    ) async {
      var emissions = 0;
      final container = makeContainer();
      await pumpWlProvider(tester, container);
      container.listen(wlProvider, (_, _) => emissions++);

      await tester.pump(wlPollInterval);
      final emissionsAfterFirstLoad = emissions;
      expect(emissionsAfterFirstLoad, 1);

      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(2);
      expect(emissions, emissionsAfterFirstLoad);
    });

    testWidgets('a changed response is applied', (tester) async {
      final container = makeContainer();
      await pumpWlProvider(tester, container);
      await tester.pump(wlPollInterval);

      when(() => liveApi.getWhiteLabelParams()).thenAnswer(
        (_) async => wlResponse(wlParams((b) => b.appTitle = 'Acme IoT')),
      );
      await tester.pump(wlPollInterval);

      expect(container.read(wlProvider).wlParams.appTitle, 'Acme IoT');
    });

    testWidgets('a failed poll is swallowed and polling continues', (
      tester,
    ) async {
      final container = makeContainer();
      await pumpWlProvider(tester, container);
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenThrow(ThingsboardError(message: 'Network error'));

      await tester.pump(wlPollInterval);
      await tester.pump(wlPollInterval);

      verify(() => liveApi.getWhiteLabelParams()).called(2);
    });

    testWidgets('coming back to the foreground does not start a second '
        'fetch while the previous one is still running', (tester) async {
      final slowResponse = Completer<Response<WhiteLabelingParams>>();
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) => slowResponse.future);
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);

      sendToBackground(tester);
      bringToForeground(tester);
      await tester.pump();
      verifyNever(() => liveApi.getWhiteLabelParams());

      slowResponse.complete(wlResponse(wlParams()));
      await tester.pump();
    });

    testWidgets('a request that never completes does not stop polling', (
      tester,
    ) async {
      // What a stalled connection looks like: the client has no receive
      // timeout, so the request neither completes nor fails.
      final hungResponse = Completer<Response<WhiteLabelingParams>>();
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) => hungResponse.future);
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);

      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) async => wlResponse(wlParams()));
      // The hung fetch is given up after wlFetchTimeout, so the next tick
      // fetches again.
      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);
    });

    testWidgets('a timed-out response landing after a newer one does not '
        'bring back the older white-labeling', (tester) async {
      final staleResponse = Completer<Response<WhiteLabelingParams>>();
      final responses = [
        staleResponse.future,
        Future.value(wlResponse(wlParams((b) => b.appTitle = 'Fresh'))),
      ];
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) => responses.removeAt(0));
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      await tester.pump(wlPollInterval);
      await tester.pump(wlPollInterval);
      expect(container.read(wlProvider).wlParams.appTitle, 'Fresh');

      staleResponse.complete(wlResponse(wlParams((b) => b.appTitle = 'Stale')));
      await tester.pump();
      await tester.pump();

      expect(container.read(wlProvider).wlParams.appTitle, 'Fresh');
    });

    testWidgets('a user response landing after a logout does not replace '
        'the login white-labeling', (tester) async {
      final slowUserResponse = Completer<Response<WhiteLabelingParams>>();
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) => slowUserResponse.future);
      when(
        () => liveApi.getLoginWhiteLabelParams(),
      ).thenAnswer((_) async => loginWlResponse());
      final container = makeContainer();
      await pumpWlProvider(tester, container);

      await tester.pump(wlPollInterval);
      verify(() => liveApi.getWhiteLabelParams()).called(1);

      (container.read(loginProvider.notifier) as FakeLogin).logOut();
      await tester.pump();
      await tester.pump();
      verify(() => liveApi.getLoginWhiteLabelParams()).called(1);
      expect(container.read(wlProvider).isUserWlMode, isFalse);

      slowUserResponse.complete(
        wlResponse(wlParams((b) => b.appTitle = 'Stale')),
      );
      await tester.pump();
      await tester.pump();

      expect(container.read(wlProvider).isUserWlMode, isFalse);
      expect(container.read(wlProvider).userParams.appTitle, isNot('Stale'));
    });
  });

  group('platform version', () {
    testWidgets('is taken from the running server when the white-label '
        'response leaves it null', (tester) async {
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });

    testWidgets('drops the -SNAPSHOT suffix of a development server build', (
      tester,
    ) async {
      stubSystemInfo('4.4.0PE-SNAPSHOT');
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });

    testWidgets('set by an admin is kept and the server is not asked', (
      tester,
    ) async {
      when(() => liveApi.getWhiteLabelParams()).thenAnswer(
        (_) async => wlResponse(
          WhiteLabelingParams(
            (b) =>
                b
                  ..logoImageUrl = defaultLogoUrl
                  ..platformVersion = 'Custom 1.0',
          ),
        ),
      );
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, 'Custom 1.0');
      verifyNever(
        () => liveClient.get<Map<String, dynamic>>(
          any(),
          options: any(named: 'options'),
        ),
      );
    });

    testWidgets('lookup failure does not break white-labeling loading', (
      tester,
    ) async {
      stubSystemInfoFailure();
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).isUserWlMode, isTrue);
      expect(container.read(wlProvider).platformNameAndVersion, 'ThingsBoard');
    });

    testWidgets('shows only the name when the server reports no version', (
      tester,
    ) async {
      stubSystemInfo(null);
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformNameAndVersion, 'ThingsBoard');
    });

    testWidgets('is taken from the running server when the white-label '
        'response has no body', (tester) async {
      when(
        () => liveApi.getWhiteLabelParams(),
      ).thenAnswer((_) async => wlResponse(null));
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).isUserWlMode, isTrue);
      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });

    testWidgets('is taken from the running server when an admin cleared the '
        'field, which the web form stores as an empty string', (tester) async {
      when(() => liveApi.getWhiteLabelParams()).thenAnswer(
        (_) async => wlResponse(
          WhiteLabelingParams(
            (b) =>
                b
                  ..logoImageUrl = defaultLogoUrl
                  ..platformVersion = '',
          ),
        ),
      );
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });

    testWidgets('is looked up once per client and reused by later loads', (
      tester,
    ) async {
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);

      await wl.updateWhiteLabeling();
      await wl.updateWhiteLabeling();

      verify(systemInfoCall).called(1);
      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });

    testWidgets('is looked up again from a re-created client', (tester) async {
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);
      await wl.updateWhiteLabeling();

      // A QR-code login re-creates the client (TbClientService.reInit).
      final newClient = MockThingsboardClient();
      when(() => newClient.getWhiteLabelingControllerApi()).thenReturn(liveApi);
      when(
        () => newClient.get<Map<String, dynamic>>(
          systemInfoPath,
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async => systemInfoResponse('4.5.0PE'));
      when(() => clientService.client).thenReturn(newClient);
      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, '4.5.0PE');
    });

    testWidgets('failed lookup is retried on the next load', (tester) async {
      stubSystemInfoFailure();
      final container = makeContainer();
      final wl = await pumpWlProvider(tester, container);
      await wl.updateWhiteLabeling();
      expect(container.read(wlProvider).platformVersion, isEmpty);

      stubSystemInfo('4.4.0PE');
      await wl.updateWhiteLabeling();

      expect(container.read(wlProvider).platformVersion, '4.4.0PE');
    });
  });

  testWidgets('keeps the login page theme when the user white-labeling '
      'replaces the app theme', (tester) async {
    when(() => liveApi.getLoginWhiteLabelParams()).thenAnswer(
      (_) async => Response(
        data: LoginWhiteLabelingParams(
          (b) =>
              b
                ..logoImageUrl = defaultLogoUrl
                ..paletteSettings =
                    (PaletteSettingsBuilder()
                      ..primaryPalette = (PaletteBuilder()..type = 'indigo')
                      ..accentPalette = (PaletteBuilder()..type = 'amber')),
        ),
        requestOptions: RequestOptions(),
      ),
    );
    when(() => liveApi.getWhiteLabelParams()).thenAnswer(
      (_) async => wlResponse(
        WhiteLabelingParams(
          (b) =>
              b
                ..logoImageUrl = defaultLogoUrl
                ..paletteSettings =
                    (PaletteSettingsBuilder()
                      ..primaryPalette = (PaletteBuilder()..type = 'red')
                      ..accentPalette = (PaletteBuilder()..type = 'amber')),
        ),
      ),
    );
    when(() => clientService.client).thenReturn(liveClient);
    final container = makeContainer();
    // Subscribed rather than read: the provider is autoDispose.
    final login =
        container.listen(loginProvider.notifier, (_, _) {}).read() as FakeLogin;
    // The login white-labeling is only applied while nobody is logged in.
    login.logOut();
    final wl = await pumpWlProvider(tester, container);

    await wl.loadLoginWhiteLabelingParams();
    expect(
      container.read(wlProvider).loginTheme.scaffoldBackgroundColor,
      Colors.indigo,
    );

    // What the login page sees right after a logout: the user theme is still
    // the app theme while the login white-labeling is being re-fetched.
    login.logIn();
    await wl.updateWhiteLabeling();
    expect(container.read(wlProvider).theme.primaryColor, Colors.red);
    expect(
      container.read(wlProvider).loginTheme.scaffoldBackgroundColor,
      Colors.indigo,
    );
  });
}
