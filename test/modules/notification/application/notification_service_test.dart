// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/modules/notification/application/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart'
    hide NotificationSettings;

import '../../../helpers/test_dependencies.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockFirebaseInstallations extends Mock implements FirebaseInstallations {}

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockNotificationsLocalService extends Mock
    implements INotificationsLocalService {}

class MockUserControllerApi extends Mock implements UserControllerApi {}

class MockNotificationControllerApi extends Mock
    implements NotificationControllerApi {}

const installationId = 'installation-id';
const newInstallationId = 'new-installation-id';

Response<T> response<T>([T? data]) =>
    Response<T>(requestOptions: RequestOptions(), data: data);

NotificationSettings permission(AuthorizationStatus status) =>
    NotificationSettings(
      authorizationStatus: status,
      alert: AppleNotificationSetting.notSupported,
      announcement: AppleNotificationSetting.notSupported,
      badge: AppleNotificationSetting.notSupported,
      carPlay: AppleNotificationSetting.notSupported,
      criticalAlert: AppleNotificationSetting.notSupported,
      lockScreen: AppleNotificationSetting.notSupported,
      notificationCenter: AppleNotificationSetting.notSupported,
      showPreviews: AppleShowPreviewSetting.notSupported,
      sound: AppleNotificationSetting.notSupported,
      timeSensitive: AppleNotificationSetting.notSupported,
      providesAppNotificationSettings: AppleNotificationSetting.notSupported,
    );

MobileSessionInfo sessionRegistered(Duration ago) => MobileSessionInfo(
  (b) => b
    ..fcmTokenTimestamp = DateTime.now().subtract(ago).millisecondsSinceEpoch,
);

void main() {
  late MockFirebaseMessaging messaging;
  late MockFirebaseInstallations installations;
  late MockFlutterLocalNotificationsPlugin localNotificationsPlugin;
  late MockNotificationsLocalService localService;
  late MockLocalDatabaseService localDatabase;
  late MockFirebaseService firebaseService;
  late MockUserControllerApi userApi;
  late StreamController<String> fidChanges;

  setUpAll(() {
    registerFallbackValue(const InitializationSettings());
    registerFallbackValue(MobileSessionInfo());
  });

  NotificationService buildService() => NotificationService(
    messaging: messaging,
    installations: installations,
    localNotificationsPlugin: localNotificationsPlugin,
    localService: localService,
  );

  /// `logout()` only removes the server-side session for an installation ID
  /// the service has already resolved, so register first.
  Future<NotificationService> buildServiceWithToken() async {
    final service = buildService();
    await service.registerWithFcm();
    return service;
  }

  void stubMobileSession(MobileSessionInfo? session) => when(
    () => userApi.getMobileSession(
      xMobileToken: any(named: 'xMobileToken'),
      extra: any(named: 'extra'),
    ),
  ).thenAnswer((_) async => response<MobileSessionInfo>(session));

  void verifyMobileSessionSaved(String token) => verify(
    () => userApi.saveMobileSession(
      xMobileToken: token,
      mobileSessionInfo: any(named: 'mobileSessionInfo'),
      extra: any(named: 'extra'),
    ),
  ).called(1);

  void verifyNoSessionSaved() => verifyNever(
    () => userApi.saveMobileSession(
      xMobileToken: any(named: 'xMobileToken'),
      mobileSessionInfo: any(named: 'mobileSessionInfo'),
      extra: any(named: 'extra'),
    ),
  );

  void verifyNoSessionRemoval() => verifyNever(
    () => userApi.removeMobileSession(
      xMobileToken: any(named: 'xMobileToken'),
      extra: any(named: 'extra'),
    ),
  );

  void stubPushRegistered() =>
      when(() => localDatabase.isPushRegistered())
          .thenAnswer((_) async => true);

  setUp(() {
    messaging = MockFirebaseMessaging();
    installations = MockFirebaseInstallations();
    localNotificationsPlugin = MockFlutterLocalNotificationsPlugin();
    localService = MockNotificationsLocalService();
    localDatabase = MockLocalDatabaseService();
    firebaseService = MockFirebaseService();
    userApi = MockUserControllerApi();
    fidChanges = StreamController<String>.broadcast();
    addTearDown(fidChanges.close);

    final notificationApi = MockNotificationControllerApi();
    final tbClient = MockThingsboardClient();
    when(() => tbClient.getUserControllerApi()).thenReturn(userApi);
    when(() => tbClient.getNotificationControllerApi())
        .thenReturn(notificationApi);
    when(
      () => notificationApi.getUnreadNotificationsCount(
        deliveryMethod: any(named: 'deliveryMethod'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) async => response<int>(0));
    when(() => firebaseService.apps).thenReturn(['[DEFAULT]']);

    when(() => messaging.register()).thenAnswer((_) async {});
    when(() => installations.getId()).thenAnswer((_) async => installationId);
    when(() => messaging.unregister()).thenAnswer((_) async {});
    when(() => messaging.setAutoInitEnabled(any())).thenAnswer((_) async {});
    when(() => messaging.getInitialMessage()).thenAnswer((_) async => null);
    when(() => messaging.requestPermission(provisional: true))
        .thenAnswer((_) async => permission(AuthorizationStatus.authorized));
    when(() => messaging.onRegistered).thenAnswer((_) => fidChanges.stream);

    when(
      () => localNotificationsPlugin.initialize(
        settings: any(named: 'settings'),
        onDidReceiveNotificationResponse: any(
          named: 'onDidReceiveNotificationResponse',
        ),
      ),
    ).thenAnswer((_) async => true);
    when(() => localNotificationsPlugin.cancelAll()).thenAnswer((_) async {});
    when(() => localNotificationsPlugin.getNotificationAppLaunchDetails())
        .thenAnswer((_) async => null);
    when(() => localService.clearNotificationBadgeCount())
        .thenAnswer((_) async {});
    when(() => localService.updateNotificationsCount(any()))
        .thenAnswer((_) async {});

    when(() => localDatabase.isPushRegistered()).thenAnswer((_) async => false);
    when(() => localDatabase.setPushRegistered()).thenAnswer((_) async {});
    when(() => localDatabase.clearPushRegistered()).thenAnswer((_) async {});

    stubMobileSession(null);
    when(
      () => userApi.saveMobileSession(
        xMobileToken: any(named: 'xMobileToken'),
        mobileSessionInfo: any(named: 'mobileSessionInfo'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) async => response<void>());
    when(
      () => userApi.removeMobileSession(
        xMobileToken: any(named: 'xMobileToken'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) async => response<void>());

    registerTestDependencies(
      tbClient: tbClient,
      localDatabase: localDatabase,
      firebaseService: firebaseService,
    );
  });

  group('NotificationService.init', () {
    test('handles the notification that launched the app once per process, '
        'not again when a later login re-runs init()', () async {
      when(() => localNotificationsPlugin.getNotificationAppLaunchDetails())
          .thenAnswer(
            (_) async => const NotificationAppLaunchDetails(
              true,
              notificationResponse: NotificationResponse(
                notificationResponseType:
                    NotificationResponseType.selectedNotification,
                payload: '{}',
              ),
            ),
          );
      final service = buildService();

      await service.init();
      await service.init();

      verify(() => localNotificationsPlugin.getNotificationAppLaunchDetails())
          .called(1);
    });

    test('skips entirely when Firebase is not configured', () async {
      when(() => firebaseService.apps).thenReturn(const []);

      await buildService().init();

      verifyNever(() => messaging.register());
      verifyNever(() => localDatabase.setPushRegistered());
    });

    for (final status in [
      AuthorizationStatus.authorized,
      AuthorizationStatus.provisional,
    ]) {
      test('registers the device and marks push as registered under '
          '$status when the server has no session for the token', () async {
        when(() => messaging.requestPermission(provisional: true))
            .thenAnswer((_) async => permission(status));

        await buildService().init();

        verifyMobileSessionSaved(installationId);
        verify(() => localDatabase.setPushRegistered()).called(1);
      });
    }

    test('marks push as registered without re-saving a fresh '
        'server-side session', () async {
      stubMobileSession(sessionRegistered(const Duration(days: 1)));

      await buildService().init();

      verifyNoSessionSaved();
      verify(() => localDatabase.setPushRegistered()).called(1);
    });

    test('refreshes a server-side session older than 30 days for the same '
        'installation ID and marks push as registered', () async {
      stubMobileSession(sessionRegistered(const Duration(days: 31)));

      await buildService().init();

      verifyNoSessionRemoval();
      verifyNever(() => messaging.unregister());
      verifyMobileSessionSaved(installationId);
      verify(() => localDatabase.setPushRegistered()).called(1);
    });

    test('does not mark push as registered when no installation ID is '
        'available', () async {
      when(() => installations.getId()).thenThrow(Exception('offline'));

      await buildService().init();

      verifyNever(
        () => userApi.getMobileSession(
          xMobileToken: any(named: 'xMobileToken'),
          extra: any(named: 'extra'),
        ),
      );
      verifyNever(() => localDatabase.setPushRegistered());
    });

    test('does not register the device when notification permission '
        'is denied', () async {
      when(() => messaging.requestPermission(provisional: true))
          .thenAnswer((_) async => permission(AuthorizationStatus.denied));

      await buildService().init();

      verifyNever(() => messaging.register());
      verifyNever(() => localDatabase.setPushRegistered());
    });

    test('waits for a pending stale cleanup, so its registration is not '
        'the one being unregistered', () async {
      stubPushRegistered();
      final unregister = Completer<void>();
      when(() => messaging.unregister()).thenAnswer((_) => unregister.future);
      final service = buildService();

      final cleanup = service.cleanUpStalePushRegistration();
      final init = service.init();
      await pumpEventQueue();
      verifyNever(() => messaging.register());

      unregister.complete();
      await Future.wait([cleanup, init]);

      verifyInOrder([
        () => localDatabase.clearPushRegistered(),
        () => messaging.register(),
        () => localDatabase.setPushRegistered(),
      ]);
    });
  });

  group('NotificationService installation ID change', () {
    test('moves the mobile session to the new installation ID', () async {
      await buildService().init();

      fidChanges.add(newInstallationId);
      await pumpEventQueue();

      verifyInOrder([
        () => userApi.removeMobileSession(
          xMobileToken: installationId,
          extra: any(named: 'extra'),
        ),
        () => userApi.saveMobileSession(
          xMobileToken: newInstallationId,
          mobileSessionInfo: any(named: 'mobileSessionInfo'),
          extra: any(named: 'extra'),
        ),
      ]);
    });

    test('registers the new installation ID when the initial one could not '
        'be obtained', () async {
      when(() => installations.getId()).thenThrow(Exception('offline'));
      await buildService().init();

      fidChanges.add(newInstallationId);
      await pumpEventQueue();

      verifyNoSessionRemoval();
      verifyMobileSessionSaved(newInstallationId);
      verify(() => localDatabase.setPushRegistered()).called(1);
    });

    test('still saves the new installation ID when removing the previous '
        'session fails', () async {
      when(
        () => userApi.removeMobileSession(
          xMobileToken: any(named: 'xMobileToken'),
          extra: any(named: 'extra'),
        ),
      ).thenThrow(Exception('401'));
      await buildService().init();

      fidChanges.add(newInstallationId);
      await pumpEventQueue();

      verifyMobileSessionSaved(newInstallationId);
    });

    test('keeps listening when saving the new installation ID fails', () async {
      when(
        () => userApi.saveMobileSession(
          xMobileToken: newInstallationId,
          mobileSessionInfo: any(named: 'mobileSessionInfo'),
          extra: any(named: 'extra'),
        ),
      ).thenThrow(Exception('500'));
      await buildService().init();

      fidChanges.add(newInstallationId);
      await pumpEventQueue();
      fidChanges.add('second-installation-id');
      await pumpEventQueue();

      verify(
        () => userApi.removeMobileSession(
          xMobileToken: newInstallationId,
          extra: any(named: 'extra'),
        ),
      ).called(1);
      verifyMobileSessionSaved('second-installation-id');
    });
  });

  group('NotificationService.cleanUpStalePushRegistration', () {
    test('skips entirely when Firebase is not configured', () async {
      when(() => firebaseService.apps).thenReturn(const []);

      await buildService().cleanUpStalePushRegistration();

      verifyNever(() => localDatabase.isPushRegistered());
      verifyNever(() => messaging.unregister());
    });

    test(
      'does nothing when push notifications were never registered',
      () async {
        await buildService().cleanUpStalePushRegistration();

        verify(() => localDatabase.isPushRegistered()).called(1);
        verifyNever(() => messaging.unregister());
        verifyNever(() => localDatabase.clearPushRegistered());
      },
    );

    test('cleans up the local registration when the session expired '
        'after a login', () async {
      stubPushRegistered();

      await buildService().cleanUpStalePushRegistration();

      verify(() => messaging.unregister()).called(1);
      verify(() => messaging.setAutoInitEnabled(false)).called(1);
      verify(() => localNotificationsPlugin.cancelAll()).called(1);
      verify(() => localService.clearNotificationBadgeCount()).called(1);
      verify(() => localDatabase.clearPushRegistered()).called(1);
      verifyNoSessionRemoval();
    });

    test('keeps the registration flag when the cleanup is interrupted, '
        'so it is retried on the next launch', () async {
      stubPushRegistered();
      when(() => messaging.unregister()).thenThrow(Exception('no network'));

      await buildService().cleanUpStalePushRegistration();

      verifyNever(() => localDatabase.clearPushRegistered());
    });

    test('runs a single teardown for concurrent calls', () async {
      stubPushRegistered();
      final service = buildService();

      await Future.wait([
        service.cleanUpStalePushRegistration(),
        service.cleanUpStalePushRegistration(),
      ]);

      verify(() => messaging.unregister()).called(1);
    });

    test('retries the teardown on the next call after an interrupted one '
        'and clears the flag once it succeeds', () async {
      stubPushRegistered();
      var deleteAttempts = 0;
      when(() => messaging.unregister()).thenAnswer((_) async {
        if (deleteAttempts++ == 0) {
          throw Exception('no network');
        }
      });
      final service = buildService();

      await service.cleanUpStalePushRegistration();
      verifyNever(() => localDatabase.clearPushRegistered());

      await service.cleanUpStalePushRegistration();

      verify(() => messaging.unregister()).called(2);
      verify(() => localDatabase.clearPushRegistered()).called(1);
    });

    test('completes when the registration flag cannot be read, so a later '
        'init() still registers', () async {
      when(() => localDatabase.isPushRegistered())
          .thenThrow(Exception('corrupt box'));
      final service = buildService();

      await expectLater(service.cleanUpStalePushRegistration(), completes);
      await service.init();

      verifyNever(() => messaging.unregister());
      verify(() => localDatabase.setPushRegistered()).called(1);
    });
  });

  group('NotificationService.logout', () {
    test('skips entirely when Firebase is not configured', () async {
      when(() => firebaseService.apps).thenReturn(const []);

      await buildService().logout();

      verifyNever(() => messaging.unregister());
    });

    test('removes the mobile session and cleans up the local '
        'registration', () async {
      final service = await buildServiceWithToken();

      await service.logout();

      verify(
        () => userApi.removeMobileSession(
          xMobileToken: installationId,
          extra: any(named: 'extra'),
        ),
      ).called(1);
      verify(() => messaging.unregister()).called(1);
      verify(() => localDatabase.clearPushRegistered()).called(1);
    });

    test('still cleans up when removeMobileSession fails '
        '(e.g. the JWT already expired)', () async {
      when(
        () => userApi.removeMobileSession(
          xMobileToken: any(named: 'xMobileToken'),
          extra: any(named: 'extra'),
        ),
      ).thenThrow(Exception('401'));
      final service = await buildServiceWithToken();

      await service.logout();

      verify(() => messaging.unregister()).called(1);
      verify(() => localDatabase.clearPushRegistered()).called(1);
    });

    test('completes when the local teardown fails (e.g. offline) and keeps '
        'the registration flag for the next launch', () async {
      when(() => messaging.unregister()).thenThrow(Exception('no network'));
      final service = await buildServiceWithToken();

      await expectLater(service.logout(), completes);

      verifyNever(() => localDatabase.clearPushRegistered());
    });

    test('does not reuse the unregistered installation ID on a repeated '
        'logout', () async {
      final service = await buildServiceWithToken();

      await service.logout();
      await service.logout();

      verify(
        () => userApi.removeMobileSession(
          xMobileToken: any(named: 'xMobileToken'),
          extra: any(named: 'extra'),
        ),
      ).called(1);
    });
  });
}
