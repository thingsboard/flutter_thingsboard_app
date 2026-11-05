import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/live_tracking_remote.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';

import '../../../helpers/test_dependencies.dart';

class MockTelemetryControllerApi extends Mock
    implements TelemetryControllerApi {}

const target = LiveTrackingTarget(entityType: 'DEVICE', id: 'device-1');

void main() {
  late MockTbClientService clientService;
  late MockTelemetryControllerApi telemetryApi;

  setUp(() {
    clientService = MockTbClientService();
    telemetryApi = MockTelemetryControllerApi();
    final tbClient = MockThingsboardClient();
    when(() => clientService.client).thenReturn(tbClient);
    when(tbClient.getTelemetryControllerApi).thenReturn(telemetryApi);
  });

  LiveTrackingRemote buildRemote() => LiveTrackingRemote(
    clientService: clientService,
    saveTimeout: const Duration(milliseconds: 20),
  );

  /// Leaves the request pending the way an unreachable server does, and hands
  /// back the token the remote attached to it.
  CancelToken Function() stubPendingTelemetry() {
    CancelToken? captured;
    when(
      () => telemetryApi.saveEntityTelemetry(
        entityType: any(named: 'entityType'),
        entityId: any(named: 'entityId'),
        scope: any(named: 'scope'),
        body: any(named: 'body'),
        cancelToken: any(named: 'cancelToken'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((invocation) {
      captured = invocation.namedArguments[#cancelToken] as CancelToken?;
      return Completer<Response<String>>().future;
    });
    return () => captured!;
  }

  test('a request that never answers fails once the deadline passes', () async {
    stubPendingTelemetry();

    await expectLater(
      buildRemote().saveTelemetry(target, 1700000000000, {'latitude': 50}),
      throwsA(isA<TimeoutException>()),
    );
  });

  test('the request is aborted when the deadline passes', () async {
    final token = stubPendingTelemetry();

    await expectLater(
      buildRemote().saveTelemetry(target, 1700000000000, {'latitude': 50}),
      throwsA(isA<TimeoutException>()),
    );

    // Giving up on the future is not enough: an uncancelled request outlives
    // the deadline and can still write a fix the session reported as failed.
    expect(token().isCancelled, isTrue);
  });

  test('a request that answers in time is not aborted', () async {
    CancelToken? captured;
    when(
      () => telemetryApi.saveEntityTelemetry(
        entityType: any(named: 'entityType'),
        entityId: any(named: 'entityId'),
        scope: any(named: 'scope'),
        body: any(named: 'body'),
        cancelToken: any(named: 'cancelToken'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((invocation) async {
      captured = invocation.namedArguments[#cancelToken] as CancelToken?;
      return Response<String>(requestOptions: RequestOptions(), data: '');
    });

    await buildRemote().saveTelemetry(target, 1700000000000, {'latitude': 50});

    expect(captured!.isCancelled, isFalse);
  });
}
