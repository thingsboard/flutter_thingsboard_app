// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_position.freezed.dart';

/// Plugin-agnostic GPS position. Keeps `package:geolocator`'s `Position`
/// type from leaking past the location service boundary.
///
/// Every field is always present: geolocator substitutes `0.0` for a reading
/// the device cannot provide (no altitude or heading sensor) and falls back to
/// the current time for a missing timestamp, so an unavailable value is
/// indistinguishable from a real zero and is reported as one.
@freezed
abstract class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    required double latitude,
    required double longitude,
    required double accuracy,
    required DateTime timestamp,
    required double altitude,
    required double speed,
    required double heading,
  }) = _GeoPosition;
}
