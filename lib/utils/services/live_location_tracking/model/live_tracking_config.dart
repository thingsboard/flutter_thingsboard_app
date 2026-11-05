// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/location/model/location_stream_settings.dart';

class LiveTrackingTarget {
  const LiveTrackingTarget({required this.entityType, required this.id});

  factory LiveTrackingTarget.fromJson(Map<String, dynamic> json) {
    final entityType = json['entityType'];
    final id = json['id'];
    if (entityType is! String || id is! String) {
      throw const FormatException(
        'Live tracking target must contain entityType and id',
      );
    }
    return LiveTrackingTarget(entityType: entityType, id: id);
  }

  final String entityType;
  final String id;

  Map<String, dynamic> toJson() => {'entityType': entityType, 'id': id};
}

/// Location values the dashboard can ask the app to save. Mirrors the
/// `LocationKey` enum on the web side.
enum LiveTrackingKeyType {
  latitude('LATITUDE'),
  longitude('LONGITUDE'),
  accuracy('ACCURACY'),
  altitude('ALTITUDE'),
  speed('SPEED'),
  heading('HEADING'),
  gpsActive('GPS_ACTIVE'),
  gpsTrackedBy('GPS_TRACKED_BY');

  const LiveTrackingKeyType(this.wireValue);

  final String wireValue;

  /// Whether the key is filled from a GPS fix. The two session status keys are
  /// written when tracking starts and stops instead, so a config made only of
  /// those would stream GPS and save nothing.
  bool get isPositionValue => switch (this) {
    latitude || longitude || accuracy || altitude || speed || heading => true,
    gpsActive || gpsTrackedBy => false,
  };

  static LiveTrackingKeyType? fromWireValue(String? value) {
    for (final type in LiveTrackingKeyType.values) {
      if (type.wireValue == value) {
        return type;
      }
    }
    return null;
  }
}

enum LiveTrackingValueType {
  attribute('ATTRIBUTE'),
  timeseries('TIMESERIES');

  const LiveTrackingValueType(this.wireValue);

  final String wireValue;

  static LiveTrackingValueType fromWireValue(String? value) =>
      value == LiveTrackingValueType.timeseries.wireValue
          ? LiveTrackingValueType.timeseries
          : LiveTrackingValueType.attribute;
}

/// One configured value: which location field to save, under which entity key,
/// and whether it lands in server attributes or time series.
class LiveTrackingKey {
  const LiveTrackingKey({
    required this.key,
    required this.label,
    required this.valueType,
  });

  /// Returns `null` for an entry this app version cannot use — an unknown
  /// `key` wire value or a missing label. The enum mirrors the web-side
  /// `LocationKey`, so a newer platform adding a key must degrade to "save
  /// the keys I understand" rather than reject the whole config and break
  /// live tracking for every already-installed app.
  static LiveTrackingKey? tryFromJson(Map<String, dynamic> json) {
    final key = LiveTrackingKeyType.fromWireValue(json['key'] as String?);
    final label = json['label'];
    if (key == null || label is! String || label.isEmpty) {
      return null;
    }
    return LiveTrackingKey(
      key: key,
      label: label,
      valueType: LiveTrackingValueType.fromWireValue(
        json['valueType'] as String?,
      ),
    );
  }

  final LiveTrackingKeyType key;
  final String label;
  final LiveTrackingValueType valueType;

  Map<String, dynamic> toJson() => {
    'key': key.wireValue,
    'label': label,
    'valueType': valueType.wireValue,
  };
}

/// The dashboard a tracking session was started from, for display and
/// navigation back to it. Both fields are optional on the wire.
class LiveTrackingDashboard {
  const LiveTrackingDashboard({this.id, this.title});

  factory LiveTrackingDashboard.fromJson(Map<String, dynamic> json) =>
      LiveTrackingDashboard(
        id: json['id'] as String?,
        title: json['title'] as String?,
      );

  final String? id;
  final String? title;

  bool get isEmpty => id == null && title == null;

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}

/// Fully-resolved live tracking session config received from the dashboard
/// (the web side resolves aliases/attributes to a concrete target entity and
/// key labels to their effective names before sending).
class LiveTrackingConfig {
  const LiveTrackingConfig({
    required this.target,
    required this.keys,
    this.targetName,
    this.dashboard,
    this.accuracy = LocationAccuracyLevel.balanced,
    this.distanceFilterMeters,
    this.intervalSeconds,
    this.maxDurationSeconds,
    this.trackedBy,
  });

  factory LiveTrackingConfig.fromJson(Map<String, dynamic> json) {
    final targetJson = json['target'];
    if (targetJson is! Map) {
      throw const FormatException('Live tracking config is missing target');
    }
    final keysJson = json['keys'];
    if (keysJson is! List || keysJson.isEmpty) {
      throw const FormatException('Live tracking config is missing keys');
    }
    final keys = <LiveTrackingKey>[
      for (final entry in keysJson)
        if (entry is Map)
          if (LiveTrackingKey.tryFromJson(Map<String, dynamic>.from(entry))
              case final key?)
            key,
    ];
    // Without a position key every fix would resolve to an empty write: the
    // app would stream GPS (and hold the background service) for the whole
    // session and save nothing, so the config is rejected here instead.
    if (!keys.any((key) => key.key.isPositionValue)) {
      throw const FormatException(
        'Live tracking config must contain at least one known position key '
        'with a non-empty label',
      );
    }
    final dashboardJson = json['dashboard'];
    final dashboard =
        dashboardJson is Map
            ? LiveTrackingDashboard.fromJson(
              Map<String, dynamic>.from(dashboardJson),
            )
            : null;
    return LiveTrackingConfig(
      target: LiveTrackingTarget.fromJson(
        Map<String, dynamic>.from(targetJson),
      ),
      keys: List.unmodifiable(keys),
      targetName: json['targetName'] as String?,
      dashboard: dashboard == null || dashboard.isEmpty ? null : dashboard,
      accuracy: _accuracyFromString(json['accuracy'] as String?),
      distanceFilterMeters: _positiveOrNull(json['distanceFilterMeters']),
      intervalSeconds: _positiveOrNull(json['intervalSeconds']),
      maxDurationSeconds: _positiveOrNull(json['maxDurationSeconds']),
      trackedBy: json['trackedBy'] as String?,
    );
  }

  final LiveTrackingTarget target;
  final List<LiveTrackingKey> keys;
  final String? targetName;
  final LiveTrackingDashboard? dashboard;
  final LocationAccuracyLevel accuracy;
  final int? distanceFilterMeters;
  final int? intervalSeconds;
  final int? maxDurationSeconds;
  final String? trackedBy;

  /// A dashboard may encode "no limit" / "not set" as `0`, and the platform
  /// rejects negative distance filters and intervals, so a non-positive value
  /// is normalised to "unset" here rather than reaching `Timer` (which would
  /// fire on the next event-loop turn) or `AndroidSettings`.
  static int? _positiveOrNull(Object? value) {
    final parsed = (value as num?)?.toInt();
    return parsed != null && parsed > 0 ? parsed : null;
  }

  static LocationAccuracyLevel _accuracyFromString(String? value) =>
      switch (value) {
        'HIGH' => LocationAccuracyLevel.high,
        'LOW' => LocationAccuracyLevel.low,
        _ => LocationAccuracyLevel.balanced,
      };

  Map<String, dynamic> toJson() => {
    'target': target.toJson(),
    'keys': keys.map((key) => key.toJson()).toList(growable: false),
    'targetName': targetName,
    'dashboard': dashboard?.toJson(),
    'accuracy': _accuracyToString(accuracy),
    'distanceFilterMeters': distanceFilterMeters,
    'intervalSeconds': intervalSeconds,
    'maxDurationSeconds': maxDurationSeconds,
    'trackedBy': trackedBy,
  };

  static String _accuracyToString(LocationAccuracyLevel level) =>
      switch (level) {
        LocationAccuracyLevel.high => 'HIGH',
        LocationAccuracyLevel.low => 'LOW',
        LocationAccuracyLevel.balanced => 'BALANCED',
      };
}
