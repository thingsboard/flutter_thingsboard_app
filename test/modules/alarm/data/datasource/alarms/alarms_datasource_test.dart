// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/alarms/alarms_datasource.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../../helpers/test_dependencies.dart';

class MockAlarmControllerApi extends Mock implements AlarmControllerApi {}

DioException _serverError(int status, ThingsBoardErrorCode code) {
  final options = RequestOptions(path: '/api/alarm/info/a1');
  return DioException(
    requestOptions: options,
    response: Response(requestOptions: options, statusCode: status),
    error: ThingsboardError(message: 'error', errorCode: code, status: status),
  );
}

void main() {
  late MockAlarmControllerApi alarmApi;
  late AlarmsDatasource datasource;

  setUp(() {
    alarmApi = MockAlarmControllerApi();
    final tbClient = MockThingsboardClient();
    when(tbClient.getAlarmControllerApi).thenReturn(alarmApi);
    datasource = AlarmsDatasource(thingsboardClient: tbClient);
  });

  void stubGetAlarmInfo(Object error) {
    when(
      () => alarmApi.getAlarmInfoById(
        alarmId: any(named: 'alarmId'),
        extra: any(named: 'extra'),
      ),
    ).thenThrow(error);
  }

  test('a deleted alarm loads as null, silently', () async {
    stubGetAlarmInfo(_serverError(404, ThingsBoardErrorCode.itemNotFound));

    expect(await datasource.getAlarmInfo('a1'), isNull);

    final extra =
        verify(
              () => alarmApi.getAlarmInfoById(
                alarmId: 'a1',
                extra: captureAny(named: 'extra'),
              ),
            ).captured.single
            as Map<String, dynamic>;
    expect(extra, InterceptorConfig(ignoreErrors: true).toExtra());
  });

  test('other errors are still thrown', () async {
    stubGetAlarmInfo(_serverError(403, ThingsBoardErrorCode.permissionDenied));

    await expectLater(
      datasource.getAlarmInfo('a1'),
      throwsA(isA<DioException>()),
    );
  });
}
