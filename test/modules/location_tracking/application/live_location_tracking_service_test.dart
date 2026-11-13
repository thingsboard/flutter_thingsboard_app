// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/modules/location_tracking/application/i_live_tracking_notifications.dart';
import 'package:thingsboard_app/modules/location_tracking/application/live_location_tracking_service.dart';
import 'package:thingsboard_app/modules/location_tracking/data/i_entity_name_resolver.dart';
import 'package:thingsboard_app/modules/location_tracking/data/i_live_tracking_remote.dart';
import 'package:thingsboard_app/modules/location_tracking/data/i_live_tracking_store.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/last_tracking_record.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_error.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_session.dart';
import 'package:thingsboard_app/utils/services/location/i_location_service.dart';
import 'package:thingsboard_app/utils/services/location/model/geo_position.dart';
import 'package:thingsboard_app/utils/services/location/model/location_fix.dart';
import 'package:thingsboard_app/utils/services/location/model/location_stream_settings.dart';

import '../../../helpers/test_dependencies.dart';

class MockLocationService extends Mock implements ILocationService {}

class MockLiveTrackingRemote extends Mock implements ILiveTrackingRemote {}

class MockEntityNameResolver extends Mock implements IEntityNameResolver {}

class MockLiveTrackingNotifications extends Mock
    implements ILiveTrackingNotifications {}

/// A real in-memory store rather than a mock: every race covered here is a
/// read-modify-write pair on the one record key, which a stubbed `read()`
/// cannot reproduce.
class InMemoryStore implements ILiveTrackingStore {
  LastTrackingRecord? record;

  @override
  Future<void> clear() async {
    record = null;
  }

  @override
  Future<LastTrackingRecord?> read() async => record;

  @override
  Future<void> write(LastTrackingRecord record) async {
    this.record = record;
  }
}

const target = LiveTrackingTarget(entityType: 'DEVICE', id: 'device-1');

/// Position keys as time series and `gpsActive` as an attribute, which is how
/// the dashboard maps a tracking widget action.
LiveTrackingConfig trackingConfig() => const LiveTrackingConfig(
  target: target,
  keys: [
    LiveTrackingKey(
      key: LiveTrackingKeyType.latitude,
      label: 'latitude',
      valueType: LiveTrackingValueType.timeseries,
    ),
    LiveTrackingKey(
      key: LiveTrackingKeyType.longitude,
      label: 'longitude',
      valueType: LiveTrackingValueType.timeseries,
    ),
    LiveTrackingKey(
      key: LiveTrackingKeyType.gpsActive,
      label: 'gpsActive',
      valueType: LiveTrackingValueType.attribute,
    ),
  ],
  trackedBy: 'tester',
);

LocationSuccess fixAt(double latitude, double longitude) => LocationSuccess(
  GeoPosition(
    latitude: latitude,
    longitude: longitude,
    accuracy: 5,
    timestamp: DateTime.fromMillisecondsSinceEpoch(1700000000000),
    altitude: 0,
    speed: 0,
    heading: 0,
  ),
);

void main() {
  late MockLocationService locationService;
  late MockLiveTrackingRemote remote;
  late MockEntityNameResolver nameResolver;
  late MockLiveTrackingNotifications notifications;
  late InMemoryStore store;

  /// One controller per `positionStream()` call, so a replaced subscription
  /// can be told from a leaked one through `hasListener`.
  late List<StreamController<LocationFix>> streams;
  late List<Completer<String?>> nameLookups;
  late List<Map<String, dynamic>> attributeSaves;
  late List<Completer<void>> heldSaves;

  /// While set, every save is left in flight until the test releases it, which
  /// is the window a stop/pause/resume has to race.
  late bool holdSaves;

  /// While set, every save fails immediately with this error.
  Object? failSavesWith;

  setUpAll(() {
    registerFallbackValue(const LocationStreamSettings());
    registerFallbackValue(target);
  });

  Future<void> nextSave() {
    if (failSavesWith != null) {
      return Future<void>.error(failSavesWith!);
    }
    if (!holdSaves) {
      return Future<void>.value();
    }
    final held = Completer<void>();
    heldSaves.add(held);
    return held.future;
  }

  setUp(() {
    locationService = MockLocationService();
    remote = MockLiveTrackingRemote();
    nameResolver = MockEntityNameResolver();
    notifications = MockLiveTrackingNotifications();
    store = InMemoryStore();
    streams = [];
    nameLookups = [];
    attributeSaves = [];
    heldSaves = [];
    holdSaves = false;
    failSavesWith = null;

    when(() => notifications.clear()).thenAnswer((_) async {});
    when(() => notifications.showPaused(targetName: any(named: 'targetName')))
        .thenAnswer((_) async {});

    when(() => nameResolver.resolveName(any(), any())).thenAnswer((_) {
      final lookup = Completer<String?>();
      nameLookups.add(lookup);
      return lookup.future;
    });

    when(() => locationService.positionStream(settings: any(named: 'settings')))
        .thenAnswer((_) {
          final controller = StreamController<LocationFix>();
          streams.add(controller);
          return controller.stream;
        });

    when(() => remote.saveAttributes(any(), any())).thenAnswer((invocation) {
      attributeSaves.add(
        Map<String, dynamic>.from(
          invocation.positionalArguments[1] as Map<String, dynamic>,
        ),
      );
      return nextSave();
    });
    when(() => remote.saveTelemetry(any(), any(), any()))
        .thenAnswer((_) => nextSave());
  });

  LiveLocationTrackingService buildService() => LiveLocationTrackingService(
    locationService: locationService,
    remote: remote,
    logger: MockTbLogger(),
    store: store,
    nameResolver: nameResolver,
    notifications: notifications,
  );

  Future<LiveLocationTrackingService> startedService() async {
    final service = buildService();
    await service.start(trackingConfig());
    return service;
  }

  /// Lets the oldest in-flight save land, then drains whatever it unblocks.
  Future<void> releaseSaves() async {
    holdSaves = false;
    while (heldSaves.isNotEmpty) {
      heldSaves.removeAt(0).complete();
      await pumpEventQueue();
    }
  }

  /// The `gpsActive` value of each status write, in the order it was sent.
  List<Object?> gpsActiveWrites() => attributeSaves
      .where((save) => save.containsKey('gpsActive'))
      .map((save) => save['gpsActive'])
      .toList();

  group('LiveLocationTrackingService.start', () {
    test('does not subscribe when the session is paused mid-start', () async {
      holdSaves = true;
      final service = buildService();

      final starting = service.start(trackingConfig());
      await pumpEventQueue();
      final pausing = service.pause();
      await pumpEventQueue();

      expect(service.session?.status, LiveTrackingStatus.paused);
      await releaseSaves();
      await starting;
      await pausing;

      expect(
        streams,
        isEmpty,
        reason: 'a session the user paused must not start a GPS stream',
      );
    });

    test('leaves one subscription when a mid-start pause is resumed', () async {
      holdSaves = true;
      final service = buildService();
      final starting = service.start(trackingConfig());
      await pumpEventQueue();
      final pausing = service.pause();
      await pumpEventQueue();
      await releaseSaves();
      await starting;
      await pausing;

      await service.resume();

      expect(streams, hasLength(1));
      expect(
        streams.single.hasListener,
        isTrue,
        reason: 'resume owns the only live stream',
      );
    });

    test('does not subscribe when the session is stopped mid-start', () async {
      holdSaves = true;
      final service = buildService();

      final starting = service.start(trackingConfig());
      await pumpEventQueue();
      final stopping = service.stop();
      await pumpEventQueue();
      await releaseSaves();
      await starting;
      await stopping;

      expect(service.session, isNull);
      expect(
        streams,
        isEmpty,
        reason: 'a stopped session leaves nothing to cancel the stream',
      );
    });
  });

  group('LiveLocationTrackingService gpsActive writes', () {
    test('are applied in the order the transitions happened', () async {
      final service = await startedService();
      await service.pause();
      attributeSaves.clear();

      holdSaves = true;
      final resuming = service.resume();
      await pumpEventQueue();
      expect(attributeSaves, hasLength(1), reason: 'the resume write is out');

      final stopping = service.stop();
      await pumpEventQueue();
      expect(
        attributeSaves,
        hasLength(1),
        reason: 'the stop write waits its turn instead of racing',
      );

      await releaseSaves();
      await resuming;
      await stopping;

      expect(gpsActiveWrites(), [true, false]);
      expect(service.session, isNull);
    });

    test('end with false after a logout teardown', () async {
      final service = await startedService();

      await service.teardownForLogout();

      expect(gpsActiveWrites(), [true, false]);
      expect(service.session, isNull);
      expect(store.record, isNull);
      expect(streams.single.hasListener, isFalse);
    });
  });

  group('LiveLocationTrackingService save failures', () {
    test('a save left in flight is neither saved nor failed yet', () async {
      final service = await startedService();
      holdSaves = true;

      streams.last.add(fixAt(1, 1));
      await pumpEventQueue();

      expect(service.session!.fixCount, 1);
      expect(service.session!.savedCount, 0);
      expect(service.session!.saveErrorCount, 0);
      expect(service.session!.lastError, isNull);
    });

    test('a save that hit its deadline is reported as offline', () async {
      final service = await startedService();
      failSavesWith = TimeoutException('deadline', const Duration(seconds: 30));

      streams.last.add(fixAt(1, 1));
      await pumpEventQueue();

      expect(service.session!.saveErrorCount, 1);
      expect(
        service.session!.lastError,
        LiveTrackingError.noConnection,
        reason:
            'a save that got no answer within its deadline is offline, not a '
            'server rejection',
      );
    });

    test('a save cause is not cleared by the next fix', () async {
      final service = await startedService();
      failSavesWith = StateError('save failed');

      streams.last.add(fixAt(1, 1));
      await pumpEventQueue();
      expect(service.session!.lastError, LiveTrackingError.saveFailed);

      // The next fix arrives while its own save is still in flight: nothing
      // has proven the link works, so the message must stay put instead of
      // blinking off on every fix.
      failSavesWith = null;
      holdSaves = true;
      streams.last.add(fixAt(2, 2));
      await pumpEventQueue();

      expect(service.session!.lastError, LiveTrackingError.saveFailed);

      await releaseSaves();

      expect(
        service.session!.lastError,
        isNull,
        reason: 'a successful save clears the save cause',
      );
    });

    test('a save failure does not overwrite a location cause', () async {
      final service = await startedService();
      holdSaves = true;

      streams.last.add(fixAt(1, 1));
      await pumpEventQueue();

      streams.last.add(const LocationServicesDisabled());
      await pumpEventQueue();
      expect(service.session!.status, LiveTrackingStatus.paused);
      expect(
        service.session!.lastError,
        LiveTrackingError.locationServicesDisabled,
      );

      heldSaves.removeAt(0).completeError(StateError('save failed'));
      await pumpEventQueue();

      expect(service.session!.saveErrorCount, 1);
      expect(
        service.session!.lastError,
        LiveTrackingError.locationServicesDisabled,
        reason:
            'the reason tracking paused must stand: the stream is gone, so no '
            'fix can put it back',
      );
    });

    test(
      'a save that outlives its session leaves the next one alone',
      () async {
        final service = await startedService();
        holdSaves = true;

        streams.last.add(fixAt(1, 1));
        await pumpEventQueue();
        expect(heldSaves.length, 1);

        holdSaves = false;
        await service.stop();
        await service.start(trackingConfig());

        heldSaves.removeAt(0).completeError(StateError('from the old session'));
        await pumpEventQueue();

        expect(
          service.session!.saveErrorCount,
          0,
          reason: 'the new session never made that request',
        );
        expect(service.session!.lastError, isNull);
      },
    );

    test(
      'a save that outlives its session is not credited to the next one',
      () async {
        final service = await startedService();
        holdSaves = true;

        streams.last.add(fixAt(1, 1));
        await pumpEventQueue();
        expect(heldSaves.length, 1);

        holdSaves = false;
        await service.stop();
        await service.start(trackingConfig());

        heldSaves.removeAt(0).complete();
        await pumpEventQueue();

        expect(
          service.session!.savedCount,
          0,
          reason: 'the new session never made that request',
        );
      },
    );

    test('a failure older than a later success does not re-raise', () async {
      final service = await startedService();
      holdSaves = true;

      streams.last.add(fixAt(1, 1));
      await pumpEventQueue();
      streams.last.add(fixAt(2, 2));
      await pumpEventQueue();
      expect(heldSaves.length, 2);

      // The newer save lands first, the way a fix sent after the link came
      // back beats a request left over from the outage.
      heldSaves.removeAt(1).complete();
      await pumpEventQueue();
      expect(service.session!.savedCount, 1);

      heldSaves.removeAt(0).completeError(StateError('stale'));
      await pumpEventQueue();

      expect(
        service.session!.saveErrorCount,
        1,
        reason: 'the fix really was not saved',
      );
      expect(
        service.session!.lastError,
        isNull,
        reason: 'a stale failure must not resurrect a resolved error',
      );
    });
  });

  group('LiveLocationTrackingService last record', () {
    test('keeps the finalized session when the name resolves late', () async {
      final service = await startedService();
      streams.single.add(fixAt(10, 20));
      await pumpEventQueue();
      await service.stop();

      nameLookups.single.complete('Thermostat');
      await pumpEventQueue();

      final record = store.record!;
      expect(record.targetName, 'Thermostat');
      expect(record.endedAt, isNotNull);
      expect(record.endReason, TrackingEndReason.manual);
      expect(record.fixCount, 1);
      expect(record.savedCount, 1);
    });

    test('drops a name that resolves for an earlier session', () async {
      final service = buildService();
      await service.start(trackingConfig());
      await service.stop();
      await service.start(trackingConfig());
      final currentStartedAt = service.session!.startedAt;

      nameLookups.first.complete('Thermostat');
      await pumpEventQueue();

      expect(store.record!.startedAt, currentStartedAt);
      expect(store.record!.targetName, isNull);
    });
  });
}
