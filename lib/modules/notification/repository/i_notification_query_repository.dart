// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract interface class INotificationQueryRepository {
  Future<void> markAllAsRead();

  Future<void> markNotificationAsRead(String id);

  Future<void> deleteNotification(String id);

  Future<void> searchNotification(String searchText);

  Future<void> filterByReadStatus(bool unreadOnly);
}
