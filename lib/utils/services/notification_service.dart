import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  late final NotificationDetails _notificationDetails;
  late final TbLogger _log;
  late final ThingsboardClient _tbClient;

  bool isFlutterLocalNotificationsInitialized = false;

  String? _fcmToken;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._();

  factory NotificationService() => _instance;

  Future<void> init(ThingsboardClient tbClient, TbLogger log) async {
    _log = log;
    _tbClient = tbClient;
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    var settings = await _requestPermission();
    _log.debug('Notification authorizationStatus: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      _getAndSaveToken();

      await _initFlutterLocalNotificationsPlugin();

      await _configFirebaseMessaging();
      _subscribeOnForegroundMessage();
    }
    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> _configFirebaseMessaging() async {
    await _messaging.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }

  Future<void> _initFlutterLocalNotificationsPlugin() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
        iOS: iOSPlatformChannelSpecifics);
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

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    return result;
  }

  Future<String?> getToken() async {
    _fcmToken = await _messaging.getToken();
    return _fcmToken;
  }

  Future<String?> _resetToken(String? token) async {
    if (token != null) {
      _tbClient.getUserService().removeMobileSession(token);
    }
    await _messaging.deleteToken();
    return await getToken();
  }

  Future<void> logout() async {
    if (_fcmToken != null) {
      _tbClient.getUserService().removeMobileSession(_fcmToken!);
    }
    await _messaging.setAutoInitEnabled(false);
    await _messaging.deleteToken();
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
    AppleNotification? iOs = message.notification?.apple;

    if (notification != null && (android != null || iOs != null)) {
      flutterLocalNotificationsPlugin.show(notification.hashCode,
          notification.title, notification.body, _notificationDetails);
    }
  }

  void _subscribeOnForegroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });
  }
}
