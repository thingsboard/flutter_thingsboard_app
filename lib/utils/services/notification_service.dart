import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/notification_model.dart';
import 'package:thingsboard_app/utils/services/_tb_secure_storage.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  if (message.sentTime == null) {
    final map = message.toMap();
    map['sentTime'] = DateTime.now().millisecondsSinceEpoch;
    await NotificationService.saveNotification(RemoteMessage.fromMap(map));
  } else {
    await NotificationService.saveNotification(message);
  }
}

@pragma('vm:entry-point')
Future<void> _onDidReceiveBackgroundNotification(
    NotificationResponse details) async {}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late NotificationDetails _notificationDetails;
  late TbLogger _log;
  late ThingsboardClient _tbClient;
  late TbContext _tbContext;

  static const notificationCounterKey = 'notifications_counter';
  static const notificationsListKey = 'notifications_list';
  static final notificationsNumberStream = StreamController<int>.broadcast();

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
    await _clearAllNotifications();
    await clearNotificationBadgeCount();
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
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotification,
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

      saveNotification(message);
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
    if (data['onClick.enabled'] == 'true') {
      switch (data['onClick.linkType']) {
        case 'DASHBOARD':
          final dashboardId = data['onClick.dashboardId'];
          var entityId;
          if (data['stateEntityId'] != null &&
              data['stateEntityType'] != null) {
            entityId = EntityId.fromTypeAndUuid(
                entityTypeFromString(data['stateEntityType']),
                data['stateEntityId']);
          }

          final state = Utils.createDashboardEntityState(entityId,
              stateId: data['onClick.dashboardState']);
          if (dashboardId != null) {
            tbContext.navigateToDashboard(dashboardId, state: state);
          }

          break;
        case 'LINK':
          final link = data['onClick.link'];
          if (link != null) {
            if (Uri.parse(link).isAbsolute) {
              tbContext.navigateTo('/url/${Uri.encodeComponent(link)}');
            } else {
              tbContext.navigateTo(link);
            }
          }

          break;
      }
    } else {
      tbContext.navigateTo('/notifications', replace: true);
    }
  }

  static Future<void> increaseNotificationBadgeCount() async {
    final storage = createAppStorage();
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = int.parse(counter ?? '0') + 1;
    await storage.setItem(notificationCounterKey, updatedCounter.toString());

    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.updateBadgeCount(updatedCounter);
    }
    notificationsNumberStream.add(updatedCounter);
  }

  static Future<void> decreaseNotificationBadgeCount(int id) async {
    final storage = createAppStorage();
    final counter = await storage.getItem(notificationCounterKey);
    final updatedCounter = int.parse(counter ?? '0') - 1;
    if (updatedCounter <= 0) {
      clearNotificationBadgeCount();
    } else {
      if (await FlutterAppBadger.isAppBadgeSupported()) {
        FlutterAppBadger.updateBadgeCount(updatedCounter);
      }

      await storage.setItem(notificationCounterKey, updatedCounter.toString());
      FlutterLocalNotificationsPlugin().cancel(id);
      notificationsNumberStream.add(updatedCounter);
    }
  }

  static Future<void> clearNotificationBadgeCount() async {
    final storage = createAppStorage();
    await storage.deleteItem(notificationCounterKey);

    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.removeBadge();
    }

    FlutterLocalNotificationsPlugin().cancelAll();
    notificationsNumberStream.add(0);
  }

  static Future<void> saveNotification(RemoteMessage message) async {
    if (message.messageId == null) {
      return;
    }

    final storage = createAppStorage();
    final notifications = await storage.getItem(notificationsListKey);
    if (notifications != null) {
      final notificationsList = json
          .decode(notifications)
          .map((e) => NotificationModel.fromJson(e))
          .toList()
          .cast<NotificationModel>();

      notificationsList.add(NotificationModel(message: message));

      await storage.setItem(
        notificationsListKey,
        jsonEncode(notificationsList.map((e) => e.toJson()).toList()),
      );
    } else {
      final notification = NotificationModel(message: message);
      await storage.setItem(
        notificationsListKey,
        jsonEncode([notification.toJson()]),
      );
    }

    increaseNotificationBadgeCount();
  }

  static Future<void> triggerNotificationCountStream() async {
    final storage = createAppStorage();
    final counter = await storage.getItem(notificationCounterKey);
    final parsedCounter = int.parse(counter ?? '0');

    notificationsNumberStream.add(parsedCounter);
  }

  Future<void> _clearAllNotifications() async {
    await createAppStorage().deleteItem(notificationsListKey);
  }
}
