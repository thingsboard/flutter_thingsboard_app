import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/service/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/utils.dart';

class NotificationService {
  NotificationService({
    FirebaseMessaging? messaging,
    FlutterLocalNotificationsPlugin? localNotificationsPlugin,
    INotificationsLocalService? localService,
  }) : _injectedMessaging = messaging,
       flutterLocalNotificationsPlugin =
           localNotificationsPlugin ?? FlutterLocalNotificationsPlugin(),
       _localService = localService ?? NotificationsLocalService();

  final FirebaseMessaging? _injectedMessaging;
  late NotificationDetails _notificationDetails;
  final TbLogger _log = getIt();
  final ThingsboardClient _tbClient = getIt<ITbClientService>().client;
  final ILocalDatabaseService _localDatabase = getIt();
  final INotificationsLocalService _localService;
  StreamSubscription? _foregroundMessageSubscription;
  StreamSubscription? _onMessageOpenedAppSubscription;
  StreamSubscription? _onTokenRefreshSubscription;
  Future<void>? _staleCleanup;

  String? _fcmToken;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  /// Resolved lazily: `FirebaseMessaging.instance` needs an initialized
  /// Firebase app, and the locator constructs this service before `main()`
  /// initializes Firebase.
  FirebaseMessaging get _messaging =>
      _injectedMessaging ?? FirebaseMessaging.instance;

  bool get _isFirebaseConfigured => getIt<IFirebaseService>().apps.isNotEmpty;

  Future<void> init() async {
    if (!_isFirebaseConfigured) {
      return;
    }
    // A stale cleanup started while unauthenticated may still be deleting the
    // FCM token; registering concurrently would delete the token just saved.
    // This relies on the service being a locator singleton: the login
    // provider started that cleanup on this same instance.
    await _staleCleanup;

    _log.debug('NotificationService::init()');

    final message = await _messaging.getInitialMessage();
    if (message != null) {
      NotificationService.handleClickOnNotification(message.data);
    }

    _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp
        .listen((message) {
          NotificationService.handleClickOnNotification(message.data);
        });

    final settings = await _messaging.requestPermission(provisional: true);
    _log.debug(
      'Notification authorizationStatus: ${settings.authorizationStatus}',
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      await _getAndSaveToken();

      _onTokenRefreshSubscription = _messaging.onTokenRefresh.listen((
        token,
      ) async {
        final previousToken = _fcmToken;
        _fcmToken = token;
        if (previousToken != null) {
          try {
            await _tbClient.getUserControllerApi().removeMobileSession(
              xMobileToken: previousToken,
            );
          } catch (e) {
            _log.warn(
              'NotificationService: failed to remove the mobile session of '
              'the previous FCM token: $e',
            );
          }
        }
        try {
          await _saveToken(token);
        } catch (e) {
          _log.warn(
            'NotificationService: failed to save the refreshed FCM token: $e',
          );
        }
      });

      await _initFlutterLocalNotificationsPlugin();
      await _configFirebaseMessaging();
      _subscribeOnForegroundMessage();
      await updateNotificationsCount();
    }
  }

  Future<void> updateNotificationsCount() async {
    await _localService.updateNotificationsCount(
      await _getNotificationsCountRemote(),
    );
  }

  Future<String?> getToken() async {
    try {
      return _fcmToken = await _messaging.getToken();
    } catch (_) {
      return null;
    }
  }

  Future<RemoteMessage?> initialMessage() {
    return _messaging.getInitialMessage();
  }

  Future<void> logout() async {
    if (!_isFirebaseConfigured) {
      return;
    }

    _log.debug('NotificationService::logout()');
    if (_fcmToken != null) {
      _log.debug('NotificationService::logout() removeMobileSession');
      try {
        await _tbClient.getUserControllerApi().removeMobileSession(
          xMobileToken: _fcmToken!,
        );
      } catch (e) {
        // Best effort: the session may already be invalid (e.g. expired JWT).
        // Deleting the local FCM token below still stops the notifications.
        _log.warn(
          'NotificationService::logout() removeMobileSession failed: $e',
        );
      }
    }

    await _tearDownLocalPushState();
  }

  /// Cleans up a stale push registration left by a session that ended
  /// without an explicit logout (e.g. the refresh token expired while the
  /// app was closed, #304). The JWT is already invalid at this point, so the
  /// server-side mobile session usually can't be removed here; deleting the
  /// local FCM token makes further pushes bounce, and the platform purges
  /// the session on the next delivery attempt.
  ///
  /// Idempotent, never throws, and safe to call whenever the client is
  /// unauthenticated. Concurrent calls share a single run, and [init] waits
  /// for a run that is already in flight. The reverse direction is not
  /// ordered: a cleanup that starts while [init] is mid-flight can delete the
  /// token [init] just registered, which only costs pushes until the next
  /// launch registers a fresh one.
  Future<void> cleanUpStalePushRegistration() async {
    if (!_isFirebaseConfigured) {
      return;
    }
    _staleCleanup ??= _tearDownIfRegistered().whenComplete(
      () => _staleCleanup = null,
    );
    await _staleCleanup;
  }

  Future<void> _tearDownIfRegistered() async {
    try {
      if (!await _localDatabase.isPushRegistered()) {
        return;
      }
      _log.debug('NotificationService::_tearDownIfRegistered()');
      await _tearDownLocalPushState();
    } catch (e) {
      _log.warn('NotificationService::_tearDownIfRegistered() failed: $e');
    }
  }

  /// Deleting the FCM token is what stops delivery; the rest drops the local
  /// push state. Failures are swallowed so a logout still completes offline:
  /// the registration flag is cleared last, so an interrupted teardown is
  /// retried by [cleanUpStalePushRegistration] on the next launch.
  Future<void> _tearDownLocalPushState() async {
    try {
      await _foregroundMessageSubscription?.cancel();
      await _onMessageOpenedAppSubscription?.cancel();
      await _onTokenRefreshSubscription?.cancel();
      await _messaging.deleteToken();
      _fcmToken = null;
      await _messaging.setAutoInitEnabled(false);
      await flutterLocalNotificationsPlugin.cancelAll();
      await _localService.clearNotificationBadgeCount();
      await _localDatabase.clearPushRegistered();
    } catch (e) {
      _log.warn('NotificationService: push teardown failed: $e');
    }
  }

  Future<void> _configFirebaseMessaging() async {
    await _messaging.setAutoInitEnabled(true);
  }

  Future<void> _initFlutterLocalNotificationsPlugin() async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@drawable/ic_launcher_foreground',
    );

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        if (response.notificationResponseType ==
            NotificationResponseType.selectedNotification) {
          final data =
              json.decode(response.payload ?? '') as Map<String, dynamic>;
          handleClickOnNotification(data);
        }
      },
    );

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      color: AppColors.appPrimaryColor,
      'general',
      // translate-me-ignore-next-line
      'General notifications',
      importance: Importance.max,
      priority: Priority.high,
      // translate-me-ignore-next-line
      channelDescription: 'This channel is used for general notifications',
      showWhen: false,
    );

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    _notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<String?> _resetToken(String? token) async {
    if (token != null) {
      try {
        await _tbClient.getUserControllerApi().removeMobileSession(
          xMobileToken: token,
        );
      } catch (e) {
        _log.warn(
          'NotificationService::_resetToken() removeMobileSession failed: $e',
        );
      }
    }

    await _messaging.deleteToken();
    return await getToken();
  }

  Future<void> _getAndSaveToken() async {
    final fcmToken = await getToken();
    _log.debug('FCM token: $fcmToken');

    if (fcmToken == null) {
      return;
    }

    final mobileInfo =
        (await _tbClient.getUserControllerApi().getMobileSession(
          xMobileToken: fcmToken,
        )).data;
    if (mobileInfo == null) {
      await _saveToken(fcmToken);
      return;
    }

    final tokenAge =
        DateTime.now().millisecondsSinceEpoch -
        (mobileInfo.fcmTokenTimestamp ?? 0);
    if (tokenAge > const Duration(days: 30).inMilliseconds) {
      final freshToken = await _resetToken(fcmToken);
      if (freshToken != null) {
        await _saveToken(freshToken);
      }
      return;
    }

    await _localDatabase.setPushRegistered();
  }

  Future<void> _saveToken(String token) async {
    await _tbClient.getUserControllerApi().saveMobileSession(
      xMobileToken: token,
      mobileSessionInfo: MobileSessionInfo(
        (b) => b..fcmTokenTimestamp = DateTime.now().millisecondsSinceEpoch,
      ),
    );
    await _localDatabase.setPushRegistered();
  }

  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;

    if (notification != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _notificationDetails,
        payload: json.encode(message.data),
      );

      _localService.increaseNotificationBadgeCount();
    }
  }

  void _subscribeOnForegroundMessage() {
    _foregroundMessageSubscription = FirebaseMessaging.onMessage.listen((
      message,
    ) {
      _log.debug('Message:$message');
      if (message.sentTime == null) {
        final map = message.toMap();
        map['sentTime'] = DateTime.now().millisecondsSinceEpoch;
        showNotification(RemoteMessage.fromMap(map));
      } else {
        showNotification(message);
      }
    });
  }

  static void handleClickOnNotification(
    Map<String, dynamic> data, {
    bool isOnNotificationsScreenAlready = false,
  }) {
    final context = globalNavigatorKey.currentContext!;
    if (data['enabled'] == true || data['onClick.enabled'] == 'true') {
      switch (data['linkType'] ?? data['onClick.linkType']) {
        case 'DASHBOARD':
          String? dashboardId;
          if ((data['dashboardId'] ?? data['onClick.dashboardId']) != null) {
            dashboardId =
                (data['dashboardId'] ?? data['onClick.dashboardId']).toString();
          }
          EntityId? entityId;
          final rawEntityId =
              data['stateEntityId'] ?? data['onClick.stateEntityId'];
          final entityType = _tryParseEntityType(
            (data['stateEntityType'] ?? data['onClick.stateEntityType'])
                ?.toString(),
          );
          if (rawEntityId != null && entityType != null) {
            entityId = $EntityId(
              (b) =>
                  b
                    ..entityType = entityType
                    ..id = rawEntityId.toString(),
            );
          }

          final state = Utils.createDashboardEntityState(
            entityId,
            stateId:
                (data['dashboardState'] ?? data['onClick.dashboardState'])
                    .toString(),
          );

          if (dashboardId != null) {
            getIt<ThingsboardAppRouter>().navigateToDashboard(
              dashboardId,
              state: state,
            );
          }

        case 'LINK':
          final rawLink = data['link'] ?? data['onClick.link'];
          if (rawLink != null) {
            final link = (data['link'] ?? data['onClick.link']).toString();
            if (Uri.parse(link).isAbsolute) {
              getIt<ThingsboardAppRouter>().navigateTo(
                '/url/${Uri.encodeComponent(link)}',
              );
            } else if (link == '/notifications' &&
                !isOnNotificationsScreenAlready) {
              getIt<ThingsboardAppRouter>().navigateTo(link);
            } else {
              getIt<ThingsboardAppRouter>().navigateTo(link);
            }
          }
      }
    } else {
      if (!isOnNotificationsScreenAlready) {
        getIt<ThingsboardAppRouter>().navigateTo('/notifications');
      }
    }
  }

  Future<int> _getNotificationsCountRemote() async {
    try {
      final resp = await _tbClient
          .getNotificationControllerApi()
          .getUnreadNotificationsCount(deliveryMethod: 'MOBILE_APP');
      return resp.data ?? 0;
    } catch (_) {
      return 0;
    }
  }
}

/// [EntityType.valueOf] throws on an unknown name, so tolerate server-sent
/// entity types this client's enum doesn't know: the tapped notification just
/// resolves without an entity target instead of crashing.
EntityType? _tryParseEntityType(String? name) {
  if (name == null) return null;
  try {
    return EntityType.valueOf(name);
  } catch (_) {
    return null;
  }
}
