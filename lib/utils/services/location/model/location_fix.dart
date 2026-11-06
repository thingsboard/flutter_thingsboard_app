// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/location/model/geo_position.dart';

/// Outcome of a location request. Exhaustively matched with `switch`, so every
/// caller is forced by the compiler to handle each failure mode.
sealed class LocationFix {
  const LocationFix();
}

/// A position was obtained.
final class LocationSuccess extends LocationFix {
  const LocationSuccess(this.position);

  final GeoPosition position;
}

/// The OS location services are turned off. Caller may prompt the user and
/// call [ILocationService.openLocationSettings].
final class LocationServicesDisabled extends LocationFix {
  const LocationServicesDisabled();
}

/// Permission was denied but can be requested again later.
final class LocationPermissionDenied extends LocationFix {
  const LocationPermissionDenied();
}

/// Permission was permanently denied. Caller must deep-link via
/// [ILocationService.openAppSettings].
final class LocationPermissionDeniedForever extends LocationFix {
  const LocationPermissionDeniedForever();
}

/// An unexpected platform error occurred.
final class LocationFixError extends LocationFix {
  const LocationFixError(this.message);

  final String message;
}
