import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/service/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';

class NotificationService {
  NotificationService(this._tbClient, this._log, this._tbContext);

  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late NotificationDetails _notificationDetails;
  final ILoggerService _log;
  final ThingsboardClient _tbClient;
  final TbContext _tbContext;
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
      NotificationService.handleClickOnNotification(
        message.data,
        _tbContext,
      );
    }

    _onMessageOpenedAppSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        NotificationService.handleClickOnNotification(
          message.data,
          _tbContext,
        );
      },
    );

    final settings = await _requestPermission();
    _log.debug(
      'Notification authorizationStatus: ${settings.authorizationStatus}',
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      await _getAndSaveToken();

      _onTokenRefreshSubscription =
          FirebaseMessaging.instance.onTokenRefresh.listen((token) {
        if (_fcmToken != null) {
          _tbClient.getUserService().removeMobileSession(_fcmToken!).then((_) {
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
      _fcmToken = await _messaging.getToken();
      return _fcmToken;
    } catch (_) {
      return null;
    }
  }

  Future<RemoteMessage?> initialMessage() async {
    return _messaging.getInitialMessage();
  }

  Future<void> logout() async {
    _log.debug('NotificationService::logout()');
    if (_fcmToken != null) {
      _log.debug(
        'NotificationService::logout() removeMobileSession',
      );
      _tbClient.getUserService().removeMobileSession(_fcmToken!);
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
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/thingsboard');

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
          final data = json.decode(response.payload ?? '');
          handleClickOnNotification(data, _tbContext);
        }
      },
    );

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'general',
      'General notifications',
      importance: Importance.max,
      priority: Priority.high,
      channelDescription: 'This channel is used for general notifications',
      showWhen: false,
    );

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    _notificationDetails = const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<NotificationSettings> _requestPermission() async {
    _messaging = FirebaseMessaging.instance;
    final result = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (result.authorizationStatus == AuthorizationStatus.denied) {
      return result;
    }

    return result;
  }

  Future<String?> _resetToken(String? token) async {
    if (token != null) {
      _tbClient.getUserService().removeMobileSession(token);
    }

    await _messaging.deleteToken();
    return await getToken();
  }

  Future<void> _getAndSaveToken() async {
    String? fcmToken = await getToken();
    _log.debug('FCM token: $fcmToken');

    if (fcmToken != null) {
      MobileSessionInfo? mobileInfo =
          await _tbClient.getUserService().getMobileSession(fcmToken);
      if (mobileInfo != null) {
        int timeAfterCreatedToken = DateTime.now().millisecondsSinceEpoch -
            mobileInfo.fcmTokenTimestamp;
        if (timeAfterCreatedToken > const Duration(days: 30).inMilliseconds) {
          fcmToken = await _resetToken(fcmToken);
          if (fcmToken != null) {
            await _saveToken(fcmToken);
          }
        }
      } else {
        await _saveToken(fcmToken);
      }
    }
  }

  Future<void> _saveToken(String token) async {
    await _tbClient.getUserService().saveMobileSession(
          token,
          MobileSessionInfo(DateTime.now().millisecondsSinceEpoch),
        );
  }

  void showNotification(RemoteMessage message) async {
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
    _foregroundMessageSubscription =
        FirebaseMessaging.onMessage.listen((message) {
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
    Map<String, dynamic> data,
    TbContext tbContext, {
    bool isOnNotificationsScreenAlready = false,
  }) {
    if (data['enabled'] == true || data['onClick.enabled'] == 'true') {
      switch (data['linkType'] ?? data['onClick.linkType']) {
        case 'DASHBOARD':
          final dashboardId =
              data['dashboardId'] ?? data['onClick.dashboardId'];
          EntityId? entityId;
          if ((data['stateEntityId'] ?? data['onClick.stateEntityId']) !=
                  null &&
              (data['stateEntityType'] ?? data['onClick.stateEntityType']) !=
                  null) {
            entityId = EntityId.fromTypeAndUuid(
              entityTypeFromString(
                data['stateEntityType'] ?? data['onClick.stateEntityType'],
              ),
              data['stateEntityId'] ?? data['onClick.stateEntityId'],
            );
          }

          final state = Utils.createDashboardEntityState(
            entityId,
            stateId: data['dashboardState'] ?? data['onClick.dashboardState'],
          );

          if (dashboardId != null) {
            tbContext.navigateToDashboard(dashboardId, state: state);
          }

          break;
        case 'LINK':
          final link = data['link'] ?? data['onClick.link'];
          if (link != null) {
            if (Uri.parse(link).isAbsolute) {
              tbContext.navigateTo('/url/${Uri.encodeComponent(link)}');
            } else if (link == '/notifications' &&
                !isOnNotificationsScreenAlready) {
              tbContext.navigateTo(link);
            } else {
              tbContext.navigateTo(link);
            }
          }

          break;
      }
    } else {
      if (!isOnNotificationsScreenAlready) {
        tbContext.navigateTo('/notifications');
      }
    }
  }

  Future<int> _getNotificationsCountRemote() async {
    try {
      return _tbClient.getNotificationService().getUnreadNotificationsCount(
            'MOBILE_APP',
            requestConfig: RequestConfig(ignoreErrors: true),
          );
    } catch (_) {
      return 0;
    }
  }
}
