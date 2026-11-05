// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// App-level accuracy tiers, decoupled from the geolocator plugin's enum the
/// same way [GeoPosition] is decoupled from its `Position`.
enum LocationAccuracyLevel { low, balanced, high }

/// Enables tracking to continue while the app is backgrounded. On Android the
/// strings feed the mandatory foreground-service notification; iOS ignores
/// them (it shows the system location indicator instead).
class BackgroundTrackingConfig {
  const BackgroundTrackingConfig({
    required this.notificationTitle,
    required this.notificationText,
  });

  final String notificationTitle;
  final String notificationText;
}

class LocationStreamSettings {
  const LocationStreamSettings({
    this.accuracy = LocationAccuracyLevel.high,
    this.distanceFilterMeters = 0,
    this.interval,
    this.background,
  });

  final LocationAccuracyLevel accuracy;

  /// Minimum displacement between fixes; 0 reports every fix.
  final int distanceFilterMeters;

  /// Desired time between fixes. Android-only hint; iOS paces by distance.
  final Duration? interval;

  /// Non-null keeps the stream alive in background; null is foreground-only.
  final BackgroundTrackingConfig? background;
}
