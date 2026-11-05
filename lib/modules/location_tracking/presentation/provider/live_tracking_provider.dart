// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_entity_name_resolver.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_location_tracking_service.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_tracking_store.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/last_tracking_record.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_session.dart';

part 'live_tracking_provider.freezed.dart';
part 'live_tracking_provider.g.dart';

@freezed
abstract class LiveTrackingViewState with _$LiveTrackingViewState {
  const factory LiveTrackingViewState({
    LiveTrackingSession? session,
    @Default(false) bool hidden,
  }) = _LiveTrackingViewState;
}

@riverpod
class LiveTracking extends _$LiveTracking {
  late final StreamSubscription<LiveTrackingSession?> _listener;

  @override
  LiveTrackingViewState build() {
    final service = getIt<ILiveLocationTrackingService>();
    _listener = service.sessionStream.listen((session) {
      state = LiveTrackingViewState(
        session: session,
        hidden: session != null && state.hidden,
      );
    });
    ref.onDispose(() => _listener.cancel());
    return LiveTrackingViewState(session: service.session);
  }

  void hide() => state = state.copyWith(hidden: true);

  void show() => state = state.copyWith(hidden: false);

  Future<void> stop() => getIt<ILiveLocationTrackingService>().stop();

  Future<void> pause() => getIt<ILiveLocationTrackingService>().pause();

  Future<void> resume() => getIt<ILiveLocationTrackingService>().resume();

  Future<void> startConfig(LiveTrackingConfig config) =>
      getIt<ILiveLocationTrackingService>().start(config);
}

@riverpod
Future<String?> targetName(
  Ref ref, {
  required String entityType,
  required String id,
}) => getIt<IEntityNameResolver>().resolveName(entityType, id);

@riverpod
Future<LastTrackingRecord?> lastRecord(Ref ref) =>
    getIt<ILiveTrackingStore>().read();
