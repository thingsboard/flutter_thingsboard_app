// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';

/// Human-friendly label for a tracking target: the resolved entity name when
/// available, otherwise `<TYPE> · <first 8 chars of id>`.
String displayTargetName(String? resolved, LiveTrackingTarget target) {
  if (resolved != null && resolved.trim().isNotEmpty) {
    return resolved;
  }
  final shortId = target.id.length > 8 ? target.id.substring(0, 8) : target.id;
  return '${target.entityType} · $shortId';
}
