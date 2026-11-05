// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/communication/events/user_loaded_event.dart';
import 'package:thingsboard_app/utils/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockCommunicationService extends Mock implements ICommunicationService {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockDeviceInfoService extends Mock implements IDeviceInfoService {}

class MockLiveLocationTrackingService extends Mock
    implements ILiveLocationTrackingService {}

class MockCustomTranslationService extends Mock
    implements ICustomTranslationService {}

class MockNotificationService extends Mock implements NotificationService {}

class MockMobileAppControllerApi extends Mock
    implements MobileAppControllerApi {}

void main() {
  late MockTbClientService clientService;
  late MockThingsboardClient client;
  late MockMobileAppControllerApi mobileApi;
  late MockOverlayService overlay;

  setUpAll(() {
    registerFallbackValue(RequestConfig());
  });

  setUp(() {
    client = MockThingsboardClient();
    mobileApi = MockMobileAppControllerApi();
    overlay = MockOverlayService();
    clientService = registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );

    final communication = MockCommunicationService();
    when(
      () => communication.on<UserLoadedEvent>(),
    ).thenAnswer((_) => const Stream.empty());
    final deviceInfo = MockDeviceInfoService();
    when(() => deviceInfo.getApplicationId()).thenReturn('org.thingsboard.app');
    when(() => deviceInfo.getPlatformType()).thenReturn(PlatformType.ANDROID);
    final notifications = MockNotificationService();
    when(
      () => notifications.cleanUpStalePushRegistration(),
    ).thenAnswer((_) async {});
    final liveLocation = MockLiveLocationTrackingService();
    when(() => liveLocation.teardownForLogout()).thenAnswer((_) async {});
    getIt
      ..registerLazySingleton<ICommunicationService>(() => communication)
      ..registerLazySingleton<IOverlayService>(() => overlay)
      ..registerLazySingleton<IDeviceInfoService>(() => deviceInfo)
      ..registerLazySingleton<ILiveLocationTrackingService>(() => liveLocation)
      ..registerLazySingleton<NotificationService>(() => notifications)
      ..registerLazySingleton<ICustomTranslationService>(
        () => MockCustomTranslationService(),
      );

    // A fully authenticated session whose user can't be loaded.
    when(() => client.isAuthenticated()).thenReturn(true);
    when(() => client.isPreVerificationToken()).thenReturn(false);
    when(() => client.isMfaConfigurationToken()).thenReturn(false);
    when(() => client.getAuthUser()).thenReturn(null);
    when(() => client.getMobileAppControllerApi()).thenReturn(mobileApi);
    when(
      () => mobileApi.getUserMobileInfo(
        pkgName: any(named: 'pkgName'),
        platform: any(named: 'platform'),
        extra: any(named: 'extra'),
      ),
    ).thenThrow(ThingsboardError(message: 'Internal error', status: 500));
    when(
      () => client.logout(requestConfig: any(named: 'requestConfig')),
    ).thenAnswer((_) async {});
  });

  void answerDialog(List<bool?> answers) {
    when(
      () => overlay.showConfirmDialog(content: any(named: 'content')),
    ).thenAnswer((_) async => answers.removeAt(0));
  }

  Future<ProviderContainer> buildLogin() async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(loginProvider);
    // build() schedules the initial user load on the event loop.
    await pumpEventQueue();
    return container;
  }

  test('a failed user load asks the user and logs out on request', () async {
    answerDialog([false]);

    await buildLogin();

    verify(
      () => overlay.showConfirmDialog(content: any(named: 'content')),
    ).called(1);
    verify(
      () => client.logout(requestConfig: any(named: 'requestConfig')),
    ).called(1);
  });

  test('an unreachable server offers retry in the connection-error dialog, '
      'which replaces the plain one', () async {
    // What the generated APIs throw for a refused connection.
    when(
      () => mobileApi.getUserMobileInfo(
        pkgName: any(named: 'pkgName'),
        platform: any(named: 'platform'),
        extra: any(named: 'extra'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
        error: ThingsboardError(
          message: 'Unable to connect',
          errorCode: ThingsBoardErrorCode.general,
        ),
      ),
    );
    when(
      () => overlay.showConnectionErrorRetryDialog(
        content: any(named: 'content'),
      ),
    ).thenAnswer((_) async => false);

    await buildLogin();

    verify(
      () => overlay.showConnectionErrorRetryDialog(
        content: any(named: 'content'),
      ),
    ).called(1);
    verifyNever(
      () => overlay.showConfirmDialog(content: any(named: 'content')),
    );
    verify(
      () => client.logout(requestConfig: any(named: 'requestConfig')),
    ).called(1);
  });

  test('retry loads the user again', () async {
    answerDialog([true, false]);

    await buildLogin();

    verify(
      () => mobileApi.getUserMobileInfo(
        pkgName: any(named: 'pkgName'),
        platform: any(named: 'platform'),
        extra: any(named: 'extra'),
      ),
    ).called(2);
    verify(
      () => client.logout(requestConfig: any(named: 'requestConfig')),
    ).called(1);
  });

  test('a session replaced during the load is left alone', () async {
    final completer = Completer<Never>();
    when(
      () => mobileApi.getUserMobileInfo(
        pkgName: any(named: 'pkgName'),
        platform: any(named: 'platform'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) => completer.future);

    await buildLogin();
    // A QR endpoint switch re-created the client while the user was loading.
    when(() => clientService.client).thenReturn(MockThingsboardClient());
    completer.completeError(ThingsboardError(message: 'Internal error'));
    await pumpEventQueue();

    verifyNever(
      () => overlay.showConfirmDialog(content: any(named: 'content')),
    );
    verifyNever(
      () => client.logout(requestConfig: any(named: 'requestConfig')),
    );
  });
}
