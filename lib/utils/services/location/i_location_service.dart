// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/location/model/location_fix.dart';
import 'package:thingsboard_app/utils/services/location/model/location_stream_settings.dart';

/// Single entry point for GPS access across the app. Implementations own all
/// permission / service-enabled handling so callers never touch the geolocator
/// plugin directly.
abstract interface class ILocationService {
  /// Resolves a single current position, performing the full permission and
  /// service-enabled checks internally.
  Future<LocationFix> getCurrentPosition();

  /// Live position updates. Pre-checks availability, then relays each update
  /// as a [LocationSuccess]. Emits a terminal failure [LocationFix] (and
  /// stops) if location is unavailable. Runs in background only when
  /// [LocationStreamSettings.background] is set. Subscribers must cancel
  /// their [StreamSubscription] when done (Riverpod/Bloc disposal handles
  /// this).
  Stream<LocationFix> positionStream({
    LocationStreamSettings settings = const LocationStreamSettings(),
  });

  /// Opens the OS location settings screen. Returns true if it was opened.
  Future<bool> openLocationSettings();

  /// Opens this app's settings screen (for permanently-denied permission).
  Future<bool> openAppSettings();
}
