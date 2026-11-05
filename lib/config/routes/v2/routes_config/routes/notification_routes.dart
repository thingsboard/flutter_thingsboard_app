// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/notification/notification_page.dart';

class NotificationRoutes {
  static const notifications = '/notifications';
}

// Notification routes
final notificationRoutes = [
  GoRoute(
    path: NotificationRoutes.notifications,
    builder: (context, state) {

      return const  NotificationPage();
    },
  ),
];
