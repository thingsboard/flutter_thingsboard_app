// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/utils/services/location/i_location_service.dart';
import 'package:thingsboard_app/utils/services/location/model/geo_position.dart';
import 'package:thingsboard_app/utils/services/location/model/location_fix.dart';
import 'package:thingsboard_app/utils/services/location/model/location_stream_settings.dart';

class LocationService implements ILocationService {
  LocationService({required TbLogger logger, GeolocatorPlatform? geolocator})
    : _log = logger,
      _geolocator = geolocator ?? GeolocatorPlatform.instance;

  final TbLogger _log;
  final GeolocatorPlatform _geolocator;

  @override
  Future<LocationFix> getCurrentPosition() async {
    try {
      final unavailable = await _ensureAvailable();
      if (unavailable != null) {
        return unavailable;
      }

      final position = await _geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return LocationSuccess(_toGeoPosition(position));
    } catch (e, s) {
      _log.error('LocationService.getCurrentPosition failed', e, s);
      return _fixFromPlatformError(e);
    }
  }

  @override
  Stream<LocationFix> positionStream({
    LocationStreamSettings settings = const LocationStreamSettings(),
  }) async* {
    final Stream<Position> raw;
    try {
      final unavailable = await _ensureAvailable();
      if (unavailable != null) {
        yield unavailable;
        return;
      }
      raw = _geolocator.getPositionStream(
        locationSettings: _toLocationSettings(settings),
      );
    } catch (e, s) {
      // The availability pre-check goes through platform channels, which
      // throw in their own right (a permission dialog already in flight, no
      // foreground activity). Without this the throw would leave the
      // generator as a stream error instead of the terminal LocationFix the
      // interface promises, and subscribers would never learn why.
      _log.error('LocationService.positionStream failed to start', e, s);
      yield _fixFromPlatformError(e);
      return;
    }

    yield* raw.transform(
      StreamTransformer<Position, LocationFix>.fromHandlers(
        handleData: (position, sink) =>
            sink.add(LocationSuccess(_toGeoPosition(position))),
        handleError: (e, s, sink) {
          _log.error('LocationService.positionStream error', e, s);
          sink.add(_fixFromPlatformError(e));
        },
      ),
    );
  }

  /// Geolocator reports a mid-stream loss of location availability as a
  /// stream *error*, not as a status; mapping it back to the sealed cases
  /// keeps the "services disabled" / "permission denied" handling identical
  /// whether it happens at start or mid-session.
  LocationFix _fixFromPlatformError(Object e) => switch (e) {
    LocationServiceDisabledException() => const LocationServicesDisabled(),
    PermissionDeniedException() => const LocationPermissionDenied(),
    _ => LocationFixError(e.toString()),
  };

  @override
  Future<bool> openLocationSettings() => _geolocator.openLocationSettings();

  @override
  Future<bool> openAppSettings() => _geolocator.openAppSettings();

  /// Returns `null` when location is available, otherwise a failure
  /// [LocationFix] describing why it is not.
  Future<LocationFix?> _ensureAvailable() async {
    final serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const LocationServicesDisabled();
    }

    var permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const LocationPermissionDenied();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return const LocationPermissionDeniedForever();
    }
    return null;
  }

  LocationSettings _toLocationSettings(LocationStreamSettings settings) {
    final accuracy = switch (settings.accuracy) {
      LocationAccuracyLevel.low => LocationAccuracy.low,
      LocationAccuracyLevel.balanced => LocationAccuracy.medium,
      LocationAccuracyLevel.high => LocationAccuracy.high,
    };
    final background = settings.background;

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => AndroidSettings(
        accuracy: accuracy,
        distanceFilter: settings.distanceFilterMeters,
        intervalDuration: settings.interval,
        foregroundNotificationConfig: background == null
            ? null
            : ForegroundNotificationConfig(
                notificationTitle: background.notificationTitle,
                notificationText: background.notificationText,
                enableWakeLock: true,
                setOngoing: true,
              ),
      ),
      TargetPlatform.iOS => AppleSettings(
        accuracy: accuracy,
        distanceFilter: settings.distanceFilterMeters,
        allowBackgroundLocationUpdates: background != null,
        showBackgroundLocationIndicator: true,
      ),
      _ => LocationSettings(
        accuracy: accuracy,
        distanceFilter: settings.distanceFilterMeters,
      ),
    };
  }

  GeoPosition _toGeoPosition(Position p) => GeoPosition(
    latitude: p.latitude,
    longitude: p.longitude,
    accuracy: p.accuracy,
    timestamp: p.timestamp,
    altitude: p.altitude,
    speed: p.speed,
    heading: p.heading,
  );
}
