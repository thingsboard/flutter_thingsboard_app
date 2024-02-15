import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late NotificationDetails _notificationDetails;
  late TbLogger _log;
  late ThingsboardClient _tbClient;
  late TbContext _tbContext;

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

    var settings = await _requestPermission();
    _log.debug(
        'Notification authorizationStatus: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      _getAndSaveToken();

      await _initFlutterLocalNotificationsPlugin();

      await _configFirebaseMessaging();
      _subscribeOnForegroundMessage();

      FirebaseMessaging.onMessageOpenedApp.listen(
        (message) async {
          final message = await _messaging.getInitialMessage();
          if (message == null) {
            return;
          }

          final data = message.data;
          if (data['onClick.enabled'] == 'true') {
            if (data['onClick.linkType'] == 'DASHBOARD') {
              final dashboardId = data['onClick.dashboardId'];
              var entityId;
              if (data['stateEntityId'] != null && data['stateEntityType'] != null) {
                entityId = EntityId.fromTypeAndUuid(entityTypeFromString(data['stateEntityType']), data['stateEntityId']);
              }
              final state = Utils.createDashboardEntityState(entityId, stateId:  data['onClick.dashboardState']);
              if (dashboardId != null) {
                _tbContext.navigateToDashboard(dashboardId,
                    state: state
                );
              }
            }
          }
        },
      );
    }
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
  }

  Future<void> _configFirebaseMessaging() async {
    await _messaging.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }

  Future<void> _initFlutterLocalNotificationsPlugin() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        final data = json.decode(response.payload ?? '');
        if (data['onClick.enabled'] == 'true') {
          if (data['onClick.linkType'] == 'DASHBOARD') {
            final dashboardId = data['onClick.dashboardId'];
            var entityId;
            if (data['stateEntityId'] != null && data['stateEntityType'] != null) {
              entityId = EntityId.fromTypeAndUuid(entityTypeFromString(data['stateEntityType']), data['stateEntityId']);
            }
            final state = Utils.createDashboardEntityState(entityId, stateId:  data['onClick.dashboardState']);
            if (dashboardId != null) {
              _tbContext.navigateToDashboard(dashboardId,
                state: state
              );
            }
          }
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

    if (Platform.isIOS) {
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
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

  void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _notificationDetails,
        payload: json.encode(message.data),
      );
    }
  }

  void _subscribeOnForegroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      _log.debug('Message:' + message.toString());
      showNotification(message);
    });
  }
}
