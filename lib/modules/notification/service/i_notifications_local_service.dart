// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract interface class INotificationsLocalService {
  Future<void> increaseNotificationBadgeCount();

  Future<void> decreaseNotificationBadgeCount();

  Future<void> triggerNotificationCountStream();

  Future<void> clearNotificationBadgeCount();

  Future<void> updateNotificationsCount(int count);
}
