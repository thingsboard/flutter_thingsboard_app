// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/live_location_tracking/model/last_tracking_record.dart';

/// Persists the single most-recent tracking session so the idle page can show
/// and relaunch it. Device-global; cleared on logout.
abstract interface class ILiveTrackingStore {
  Future<LastTrackingRecord?> read();

  Future<void> write(LastTrackingRecord record);

  Future<void> clear();
}
