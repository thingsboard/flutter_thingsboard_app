// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../patrol_test/common/e2e_server.dart';

void main() {
  const delays = [Duration.zero, Duration.zero, Duration.zero];

  ThingsboardError dioError(DioExceptionType type, [Object? cause]) =>
      ThingsboardError(
        message: 'Unable to connect',
        error: DioException(
          requestOptions: RequestOptions(),
          type: type,
          error: cause,
        ),
      );

  final notSent = dioError(DioExceptionType.connectionError);
  final reset = dioError(
    DioExceptionType.unknown,
    const SocketException('Connection reset by peer'),
  );
  final refused = ThingsboardError(message: 'Bad credentials', status: 401);

  /// Fails with [errors] one by one, then returns the number of calls.
  Future<int> Function() failing(List<ThingsboardError> errors) {
    var calls = 0;
    return () async {
      if (calls < errors.length) throw errors[calls++];
      return ++calls;
    };
  }

  Future<int> retry(
    Future<int> Function() request, {
    required bool repeatable,
  }) => E2eServer.retryWithoutAnswer(
    'the test request',
    request,
    repeatable: repeatable,
    delays: delays,
  );

  group('E2eServer.retryWithoutAnswer', () {
    test('waits 5, 15 and 30 seconds by default', () {
      expect(E2eServer.retryDelays, const [
        Duration(seconds: 5),
        Duration(seconds: 15),
        Duration(seconds: 30),
      ]);
    });

    test('a read is tried again after a reset mid-request', () async {
      expect(await retry(failing([reset, reset]), repeatable: true), 3);
    });

    test('a write is tried again when the request was not sent', () async {
      expect(await retry(failing([notSent]), repeatable: false), 2);
    });

    test('a write is not tried again after a reset mid-request', () {
      expect(retry(failing([reset]), repeatable: false), throwsA(same(reset)));
    });

    test('an answer from the server is never tried again', () {
      expect(
        retry(failing([refused]), repeatable: true),
        throwsA(same(refused)),
      );
    });

    test('gives up after the last delay with the last error', () {
      expect(
        retry(failing([reset, reset, reset, notSent]), repeatable: true),
        throwsA(same(notSent)),
      );
    });
  });
}
