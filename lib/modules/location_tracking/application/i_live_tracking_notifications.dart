// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Syncs the "session is paused" system notification with the live tracking
/// session state. The tracking-active state needs no handling here: on Android
/// the geolocator foreground service shows its own notification while the GPS
/// stream is running, and iOS shows the system location indicator instead.
abstract interface class ILiveTrackingNotifications {
  Future<void> showPaused({String? targetName});

  Future<void> clear();
}
