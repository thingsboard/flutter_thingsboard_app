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
import 'package:thingsboard_app/modules/more/widgets/pe_more_page_footer.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/wl_provider.dart';

import '../../../helpers/test_dependencies.dart';

class MockWhiteLabelingControllerApi extends Mock
    implements WhiteLabelingControllerApi {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class FakeLogin extends Login {
  @override
  LoginState build() =>
      const LoginState(isUserLoaded: true, userScope: Authority.TENANT_ADMIN);
}

void main() {
  setUpAll(() => registerFallbackValue(Options()));

  setUp(() {
    final client = MockThingsboardClient();
    final wlApi = MockWhiteLabelingControllerApi();
    when(() => client.getWhiteLabelingControllerApi()).thenReturn(wlApi);
    when(() => wlApi.getLoginWhiteLabelParams()).thenAnswer(
      (_) async => Response(
        data: LoginWhiteLabelingParams(
          (b) =>
              b
                ..logoImageUrl = defaultLogoUrl
                ..showNameVersion = true,
        ),
        requestOptions: RequestOptions(),
      ),
    );
    when(() => wlApi.getWhiteLabelParams()).thenAnswer(
      (_) async => Response(
        data: WhiteLabelingParams(
          (b) =>
              b
                ..logoImageUrl = defaultLogoUrl
                ..showNameVersion = true,
        ),
        requestOptions: RequestOptions(),
      ),
    );
    when(
      () => client.get<Map<String, dynamic>>(
        '/api/system/info',
        options: any(named: 'options'),
      ),
    ).thenAnswer(
      (_) async => Response(
        data: {'version': '4.4.0PE', 'type': 'PE'},
        requestOptions: RequestOptions(),
      ),
    );

    final localDatabase = MockLocalDatabaseService();
    when(
      () => localDatabase.getSelectedRegion(),
    ).thenAnswer((_) async => Region.europe);
    registerTestDependencies(
      tbClient: client,
      localDatabase: localDatabase,
      firebaseService: MockFirebaseService(),
    );
    final deviceInfo = MockDeviceInfoService();
    when(() => deviceInfo.getBuildVersion()).thenReturn('1.9.1');
    getIt
      ..registerLazySingleton<IOverlayService>(() => MockOverlayService())
      ..registerLazySingleton<IDeviceInfoService>(() => deviceInfo);
  });

  testWidgets('shows the platform version of the white-labeling loaded '
      'after it was built', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [loginProvider.overrideWith(FakeLogin.new)],
        child: MaterialApp(
          navigatorKey: globalNavigatorKey,
          home: const Scaffold(body: MorePageFooter()),
        ),
      ),
    );
    final wl = ProviderScope.containerOf(
      tester.element(find.byType(MorePageFooter)),
    ).read(wlProvider.notifier);

    await wl.loadLoginWhiteLabelingParams();
    await tester.pump();
    expect(find.textContaining('ThingsBoard'), findsNothing);

    await wl.updateWhiteLabeling();
    await tester.pump();
    expect(find.text('ThingsBoard v.4.4.0PE'), findsOneWidget);
  });
}
