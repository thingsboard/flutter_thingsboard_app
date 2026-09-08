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
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';
import 'package:thingsboard_app/utils/utils.dart';

class NotificationService {
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late NotificationDetails _notificationDetails;
  final TbLogger _log = getIt();
  // Read the live client on every access: a QR-code endpoint switch re-creates
  // the client (ITbClientService.reInit), so a reference captured at
  // construction would keep pointing at the old host (PROD-8200).
  ThingsboardClient get _tbClient => getIt<ITbClientService>().client;

  final INotificationsLocalService _localService = NotificationsLocalService();
  StreamSubscription? _foregroundMessageSubscription;
  StreamSubscription? _onMessageOpenedAppSubscription;
  StreamSubscription? _onTokenRefreshSubscription;

  String? _fcmToken;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    _log.debug('NotificationService::init()');

    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      NotificationService.handleClickOnNotification(message.data);
    }

    _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp
        .listen((message) {
          NotificationService.handleClickOnNotification(message.data);
        });

    final settings = await _requestPermission();
    _log.debug(
      'Notification authorizationStatus: ${settings.authorizationStatus}',
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      await _getAndSaveToken();

      _onTokenRefreshSubscription = FirebaseMessaging.instance.onTokenRefresh
          .listen((token) {
            if (_fcmToken != null) {
              _tbClient
                  .getUserControllerApi()
                  .removeMobileSession(
                    xMobileToken: _fcmToken!,
                    extra: silentRequestExtra(),
                  )
                  .then((_) {
                    _fcmToken = token;
                    if (_fcmToken != null) {
                      _saveToken(_fcmToken!);
                    }
                  });
            }
          });

      await _initFlutterLocalNotificationsPlugin();
      await _configFirebaseMessaging();
      _subscribeOnForegroundMessage();
      await updateNotificationsCount();
    }
  }

  Future<void> updateNotificationsCount() async {
    final localService = NotificationsLocalService();

    await localService.updateNotificationsCount(
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
    getIt<TbLogger>().debug('NotificationService::logout()');
    if (_fcmToken != null) {
      getIt<TbLogger>().debug(
        'NotificationService::logout() removeMobileSession',
      );
      _tbClient.getUserControllerApi().removeMobileSession(
        xMobileToken: _fcmToken!,
        extra: silentRequestExtra(),
      );
    }

    await _foregroundMessageSubscription?.cancel();
    await _onMessageOpenedAppSubscription?.cancel();
    await _onTokenRefreshSubscription?.cancel();
    await _messaging.deleteToken();
    await _messaging.setAutoInitEnabled(false);
    await flutterLocalNotificationsPlugin.cancelAll();
    await _localService.clearNotificationBadgeCount();
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

  Future<NotificationSettings> _requestPermission() async {
    _messaging = FirebaseMessaging.instance;
    final result = await _messaging.requestPermission(provisional: true);

    if (result.authorizationStatus == AuthorizationStatus.denied) {
      return result;
    }

    return result;
  }

  Future<String?> _resetToken(String? token) async {
    if (token != null) {
      _tbClient.getUserControllerApi().removeMobileSession(
        xMobileToken: token,
        extra: silentRequestExtra(),
      );
    }

    await _messaging.deleteToken();
    return await getToken();
  }

  Future<void> _getAndSaveToken() async {
    final fcmToken = await getToken();
    _log.debug('FCM token: $fcmToken');

    try {
      await _syncMobileSession(fcmToken);
    } catch (e) {
      // The server may reject the session for an unknown mobile package:
      // push notifications simply stay off, nothing else should break.
      _log.error('NotificationService: failed to sync mobile session $e');
    }
  }

  Future<void> _syncMobileSession(String? fcmToken) async {
    if (fcmToken == null) {
      return;
    }
    final mobileInfo =
        (await _tbClient.getUserControllerApi().getMobileSession(
          xMobileToken: fcmToken,
          extra: silentRequestExtra(),
        )).data;
    if (mobileInfo != null) {
      final int timeAfterCreatedToken =
          DateTime.now().millisecondsSinceEpoch -
          (mobileInfo.fcmTokenTimestamp ?? 0);
      if (timeAfterCreatedToken > const Duration(days: 30).inMilliseconds) {
        final refreshedToken = await _resetToken(fcmToken);
        if (refreshedToken != null) {
          await _saveToken(refreshedToken);
        }
      }
    } else {
      await _saveToken(fcmToken);
    }
  }

  Future<void> _saveToken(String token) async {
    await _tbClient.getUserControllerApi().saveMobileSession(
      xMobileToken: token,
      mobileSessionInfo: MobileSessionInfo(
        (b) => b..fcmTokenTimestamp = DateTime.now().millisecondsSinceEpoch,
      ),
      extra: silentRequestExtra(),
    );
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
          .getUnreadNotificationsCount(
            deliveryMethod: 'MOBILE_APP',
            extra: silentRequestExtra(),
          );
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
