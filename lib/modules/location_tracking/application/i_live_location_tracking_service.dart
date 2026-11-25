// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_session.dart';

/// App-wide owner of at most one live GPS tracking session. Runs the
/// location stream, saves telemetry/attributes per fix, and exposes session
/// state for the tracking bar / session screen.
abstract interface class ILiveLocationTrackingService {
  LiveTrackingSession? get session;

  /// Emits on every session change; emits `null` when tracking stops.
  Stream<LiveTrackingSession?> get sessionStream;

  /// Starts a session, replacing any active one.
  Future<void> start(LiveTrackingConfig config);

  Future<void> stop();

  /// Ends any session and drops the persisted record, for the logout paths.
  /// The `gpsActive=false` write it performs needs the still-valid token, so
  /// this must complete before the client logs out; a teardown failure is
  /// logged rather than thrown, because it must never keep the user signed in.
  Future<void> teardownForLogout();

  /// Suspends position updates without discarding the session; writes
  /// `gpsActive=false` so the platform sees data flow honestly stopped.
  Future<void> pause();

  Future<void> resume();
}
