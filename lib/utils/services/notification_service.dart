import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/service/i_notifications_local_service.dart';
import 'package:thingsboard_app/modules/notification/service/notifications_local_service.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late NotificationDetails _notificationDetails;
  late TbLogger _log;
  late ThingsboardClient _tbClient;
  late TbContext _tbContext;
  late INotificationsLocalService _localService;

  String? _fcmToken;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._();

  factory NotificationService() => _instance;

  Future<void> init(
    ThingsboardClient tbClient,
    TbLogger log,
    TbContext context,
  ) async {
    _log = log;
    _tbClient = tbClient;
    _tbContext = context;
    _localService = NotificationsLocalService();

    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      NotificationService.handleClickOnNotification(
        message.data,
        _tbContext,
      );
    }

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        NotificationService.handleClickOnNotification(
          message.data,
          _tbContext,
        );
      },
    );

    var settings = await _requestPermission();
    _log.debug(
        'Notification authorizationStatus: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      _getAndSaveToken();

      await _initFlutterLocalNotificationsPlugin();

      await _configFirebaseMessaging();
      _subscribeOnForegroundMessage();
      updateNotificationsCount();
    }
  }

  Future<void> updateNotificationsCount() async {
    final localService = NotificationsLocalService();

    localService.updateNotificationsCount(
      await _getNotificationsCountRemote(),
    );
  }

  Future<String?> getToken() async {
    if (Platform.isIOS) {
      var apnsToken = await _messaging.getAPNSToken();
      _log.debug('APNS token: $apnsToken');
      if (apnsToken == null) {
        return null;
      }
    }
    _fcmToken = await _messaging.getToken();
    return _fcmToken;
  }

  Future<RemoteMessage?> initialMessage() async {
    return _messaging.getInitialMessage();
  }

  Future<void> logout() async {
    if (_fcmToken != null) {
      _tbClient.getUserService().removeMobileSession(_fcmToken!);
    }

    await _messaging.setAutoInitEnabled(false);
    await _messaging.deleteToken();
    await _localService.clearNotificationBadgeCount();
  }

  Future<void> _configFirebaseMessaging() async {
    await _messaging.setAutoInitEnabled(true);
  }

  Future<void> _initFlutterLocalNotificationsPlugin() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/thingsboard');

    const initializationSettingsIOS = DarwinInitializationSettings(
      defaultPresentSound: false,
      defaultPresentAlert: false,
      defaultPresentBadge: false,
    );

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

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'general',
      'General notifications',
      importance: Importance.max,
      priority: Priority.high,
      channelDescription: 'This channel is used for general notifications',
      showWhen: false,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails();

    _notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<NotificationSettings> _requestPermission() async {
    _messaging = FirebaseMessaging.instance;
    var result = await _messaging.requestPermission(
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
        if (timeAfterCreatedToken > Duration(days: 30).inMilliseconds) {
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
        token, MobileSessionInfo(DateTime.now().millisecondsSinceEpoch));
  }

  void showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

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
    FirebaseMessaging.onMessage.listen((message) {
      _log.debug('Message:' + message.toString());
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
    TbContext tbContext,
  ) {
    if (data['enabled'] == true) {
      switch (data['linkType']) {
        case 'DASHBOARD':
          final dashboardId = data['dashboardId'];
          var entityId;
          if (data['stateEntityId'] != null &&
              data['stateEntityType'] != null) {
            entityId = EntityId.fromTypeAndUuid(
                entityTypeFromString(data['stateEntityType']),
                data['stateEntityId']);
          }

          final state = Utils.createDashboardEntityState(entityId,
              stateId: data['dashboardState']);
          if (dashboardId != null) {
            tbContext.navigateToDashboard(dashboardId, state: state);
          }

          break;
        case 'LINK':
          final link = data['link'];
          if (link != null) {
            if (Uri.parse(link).isAbsolute) {
              tbContext.navigateTo('/url/${Uri.encodeComponent(link)}');
            } else {
              tbContext.navigateTo(link, replace: true);
            }
          }

          break;
      }
    } else {
      tbContext.navigateTo('/notifications', replace: true);
    }
  }

  Future<int> _getNotificationsCountRemote() async {
    return _tbClient
        .getNotificationService()
        .getUnreadNotificationsCount('MOBILE_APP');
  }
}
