// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_client/thingsboard_client.dart';

/// Page key for the notification list (`PageKeyController` needs a single key
/// object; the generated `getNotifications` takes flat parameters).
class NotificationQuery {
  NotificationQuery(this.pageLink, {this.unreadOnly = false});

  final PageLink pageLink;
  bool unreadOnly;
}
