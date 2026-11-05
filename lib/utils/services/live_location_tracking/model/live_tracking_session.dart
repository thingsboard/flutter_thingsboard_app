// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_error.dart';
import 'package:thingsboard_app/utils/services/location/model/geo_position.dart';

part 'live_tracking_session.freezed.dart';

enum LiveTrackingStatus { tracking, paused }

@freezed
abstract class LiveTrackingSession with _$LiveTrackingSession {
  const factory LiveTrackingSession({
    required LiveTrackingConfig config,
    required LiveTrackingStatus status,
    required DateTime startedAt,
    @Default(0) int fixCount,
    @Default(0) int savedCount,
    @Default(0) int saveErrorCount,
    GeoPosition? lastFix,
    LiveTrackingError? lastError,
  }) = _LiveTrackingSession;
}
