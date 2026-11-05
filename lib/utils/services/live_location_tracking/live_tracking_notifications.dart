// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/location_tracking_routes.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_tracking_notifications.dart';

/// Android-only ongoing notification shown while a live tracking session is
/// paused. While tracking is active the geolocator foreground service owns its
/// own notification; pausing cancels the GPS stream (and with it that
/// notification), so this one fills the gap. No-op on iOS, which has no
/// ongoing-notification concept.
///
/// Notification strings are OS-level and English-only for v1, matching the
/// foreground-service strings in `BackgroundTrackingConfig`.
class LiveTrackingNotifications implements ILiveTrackingNotifications {
  LiveTrackingNotifications({
    required TbLogger logger,
    FlutterLocalNotificationsPlugin? plugin,
  }) : _log = logger,
       _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final TbLogger _log;
  final FlutterLocalNotificationsPlugin _plugin;

  static const _notificationId = 51001;

  /// Payload shape consumed by NotificationService's tap handler; deep-links
  /// to the live tracking screen.
  static final _payload = json.encode({
    'enabled': true,
    'linkType': 'LINK',
    'link': LocationTrackingRoutes.liveTracking,
  });

  @override
  Future<void> showPaused({String? targetName}) async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    try {
      await _plugin.show(
        _notificationId,
        'ThingsBoard',
        targetName == null
            ? 'Live location tracking is paused'
            : 'Live tracking of $targetName is paused',
        NotificationDetails(
          android: AndroidNotificationDetails(
            'live_tracking',
            'Live location tracking',
            channelDescription:
                'Shows the state of the live location tracking session',
            icon: '@drawable/ic_launcher_foreground',
            color: AppColors.appPrimaryColor,
            importance: Importance.low,
            priority: Priority.low,
            ongoing: true,
            autoCancel: false,
            showWhen: false,
          ),
        ),
        payload: _payload,
      );
    } catch (e, s) {
      _log.error('LiveTrackingNotifications: show failed', e, s);
    }
  }

  @override
  Future<void> clear() async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    try {
      await _plugin.cancel(_notificationId);
    } catch (e, s) {
      _log.error('LiveTrackingNotifications: cancel failed', e, s);
    }
  }
}
