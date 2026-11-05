// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';

enum TrackingEndReason { manual, maxDuration, interrupted }

TrackingEndReason _endReasonFromString(String? value) =>
    TrackingEndReason.values.firstWhere(
      (e) => e.name == value,
      orElse: () => TrackingEndReason.interrupted,
    );

/// Snapshot of the most recent tracking session, persisted so the idle page
/// can show it and relaunch it ("Start again"). Written at session start and
/// updated at session end.
class LastTrackingRecord {
  const LastTrackingRecord({
    required this.configJson,
    required this.startedAt,
    required this.endReason,
    this.targetName,
    this.endedAt,
    this.fixCount = 0,
    this.savedCount = 0,
    this.saveErrorCount = 0,
    this.lastLat,
    this.lastLng,
    this.lastError,
  });

  factory LastTrackingRecord.fromJson(Map<String, dynamic> json) =>
      LastTrackingRecord(
        configJson: Map<String, dynamic>.from(json['configJson'] as Map),
        targetName: json['targetName'] as String?,
        startedAt: DateTime.fromMillisecondsSinceEpoch(
          (json['startedAt'] as num).toInt(),
        ),
        endedAt:
            json['endedAt'] == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(
                  (json['endedAt'] as num).toInt(),
                ),
        fixCount: (json['fixCount'] as num?)?.toInt() ?? 0,
        savedCount: (json['savedCount'] as num?)?.toInt() ?? 0,
        saveErrorCount: (json['saveErrorCount'] as num?)?.toInt() ?? 0,
        lastLat: (json['lastLat'] as num?)?.toDouble(),
        lastLng: (json['lastLng'] as num?)?.toDouble(),
        lastError: json['lastError'] as String?,
        endReason: _endReasonFromString(json['endReason'] as String?),
      );

  final Map<String, dynamic> configJson;
  final String? targetName;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int fixCount;
  final int savedCount;
  final int saveErrorCount;
  final double? lastLat;
  final double? lastLng;
  final String? lastError;
  final TrackingEndReason endReason;

  LiveTrackingConfig get config => LiveTrackingConfig.fromJson(configJson);

  /// [config] as far as it can be parsed. The config travels as an opaque
  /// map, so a record written by another app version may carry one this
  /// version cannot read; callers that cannot afford a throw (a widget build)
  /// must go through here.
  LiveTrackingConfig? get configOrNull {
    try {
      return config;
    } catch (_) {
      // A stored map can fail on a missing field (FormatException) just as
      // easily as on a wrong type (a failed cast), and neither is recoverable.
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
    'configJson': configJson,
    'targetName': targetName,
    'startedAt': startedAt.millisecondsSinceEpoch,
    'endedAt': endedAt?.millisecondsSinceEpoch,
    'fixCount': fixCount,
    'savedCount': savedCount,
    'saveErrorCount': saveErrorCount,
    'lastLat': lastLat,
    'lastLng': lastLng,
    'lastError': lastError,
    'endReason': endReason.name,
  };

  LastTrackingRecord copyWith({
    String? targetName,
    DateTime? endedAt,
    int? fixCount,
    int? savedCount,
    int? saveErrorCount,
    double? lastLat,
    double? lastLng,
    String? lastError,
    TrackingEndReason? endReason,
  }) => LastTrackingRecord(
    configJson: configJson,
    targetName: targetName ?? this.targetName,
    startedAt: startedAt,
    endedAt: endedAt ?? this.endedAt,
    fixCount: fixCount ?? this.fixCount,
    savedCount: savedCount ?? this.savedCount,
    saveErrorCount: saveErrorCount ?? this.saveErrorCount,
    lastLat: lastLat ?? this.lastLat,
    lastLng: lastLng ?? this.lastLng,
    lastError: lastError ?? this.lastError,
    endReason: endReason ?? this.endReason,
  );
}
