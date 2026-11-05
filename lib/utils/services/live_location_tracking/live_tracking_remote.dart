// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_tracking_remote.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_config.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';

class LiveTrackingRemote implements ILiveTrackingRemote {
  LiveTrackingRemote({
    required ITbClientService clientService,
    this.saveTimeout = const Duration(seconds: 30),
  }) : _clientService = clientService;

  final ITbClientService _clientService;

  /// How long one request may wait for the server. The client sets no HTTP
  /// timeout, so without this a save issued while the server is unreachable
  /// stays pending until the OS drops the socket — minutes during which the
  /// session reports neither a save nor an error.
  final Duration saveTimeout;

  @override
  Future<void> saveTelemetry(
    LiveTrackingTarget target,
    int ts,
    Map<String, dynamic> values,
  ) => _send(
    (cancelToken) =>
        _clientService.client.getTelemetryControllerApi().saveEntityTelemetry(
          entityType: target.entityType,
          entityId: target.id,
          scope: 'ANY',
          body: jsonEncode({'ts': ts, 'values': values}),
          cancelToken: cancelToken,
          extra: silentRequestExtra(),
        ),
  );

  @override
  Future<void> saveAttributes(
    LiveTrackingTarget target,
    Map<String, dynamic> attributes,
  ) => _send(
    (cancelToken) => _clientService.client
        .getTelemetryControllerApi()
        .saveEntityAttributesV2(
          entityType: target.entityType,
          entityId: target.id,
          scope: 'SERVER_SCOPE',
          body: jsonEncode(attributes),
          cancelToken: cancelToken,
          extra: silentRequestExtra(),
        ),
  );

  /// Bounds one request and aborts it when the deadline passes. Giving up on
  /// the future is not enough: an uncancelled request outlives the deadline
  /// and can still reach the server, writing a fix the session already
  /// reported as failed — and, for a key mapped to an attribute, putting a
  /// stale position over a newer one.
  Future<void> _send(Future<void> Function(CancelToken) request) async {
    final cancelToken = CancelToken();
    try {
      await request(cancelToken).timeout(saveTimeout);
    } on TimeoutException {
      cancelToken.cancel('Live tracking save exceeded $saveTimeout');
      rethrow;
    }
  }
}
