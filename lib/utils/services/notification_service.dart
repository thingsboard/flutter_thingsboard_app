import 'dart:async';
import 'dart:convert';
import 'dart:io';

// TODO: firebase_init: run flutterfire configure and uncomment it
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
// TODO: firebase_init: run flutterfire configure and uncomment it
// import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/modules/notification/notification_model.dart';
import 'package:thingsboard_app/utils/services/_tb_secure_storage.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  // TODO: firebase_init: run flutterfire configure and uncomment it
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.saveNotification(message);
  await NotificationService.increaseNotificationBadgeCount();
}

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
        handleClickOnNotification(data, _tbContext);
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
      _messaging.setForegroundNotificationPresentationOptions();
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
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _notificationDetails,
        payload: json.encode(message.data),
      );

      saveNotification(message);
      increaseNotificationBadgeCount();
    }
  }

  void _subscribeOnForegroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      _log.debug('Message:' + message.toString());
      showNotification(message);
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
      tbContext.navigateTo('/notifications');
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

  static Future<void> decreaseNotificationBadgeCount() async {
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

      notificationsNumberStream.add(updatedCounter);
    }
  }

  static Future<void> clearNotificationBadgeCount() async {
    final storage = createAppStorage();
    await storage.deleteItem(notificationCounterKey);

    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.removeBadge();
    }

    notificationsNumberStream.add(0);
  }

  static Future<void> saveNotification(RemoteMessage message) async {
    final storage = createAppStorage();
    final notifications = await storage.getItem(notificationsListKey);
    if (notifications != null) {
      final List<NotificationModel> notificationsList = json
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
  }

  static Future<void> triggerNotificationCountStream() async {
    final storage = createAppStorage();
    final counter = await storage.getItem(notificationCounterKey);
    final parsedCounter = int.parse(counter ?? '0');

    notificationsNumberStream.add(parsedCounter);
  }
}
