// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';

/// Thin REST boundary for live tracking saves. Kept as an interface so the
/// tracking service is unit-testable.
abstract interface class ILiveTrackingRemote {
  /// Saves one timeseries sample: `{ts, values}` on the target entity.
  Future<void> saveTelemetry(
    LiveTrackingTarget target,
    int ts,
    Map<String, dynamic> values,
  );

  /// Saves SERVER_SCOPE attributes on the target entity.
  Future<void> saveAttributes(
    LiveTrackingTarget target,
    Map<String, dynamic> attributes,
  );
}
