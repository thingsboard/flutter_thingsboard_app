// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarms/alarms_pagination_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarms/alarms_query_ctrl.dart';
import 'package:thingsboard_app/modules/alarm/domain/repository/details/i_alarm_details_repository.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/alarms/fetch_alarms_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/acknowledge_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/domain/usecases/details/clear_alarm_usecase.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_details/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/utils/services/communication/communication_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockFetchAlarms extends Mock implements FetchAlarmsUseCase {}

class MockFetchAlarm extends Mock implements FetchAlarmUseCase {}

class MockDetailsRepository extends Mock implements IAlarmDetailsRepository {}

class FakeAlarmInfo extends Fake implements AlarmInfo {}

void main() {
  final alarmId = AlarmId((b) => b..id = 'alarm-1');

  late CommunicationService communication;
  late int listLoads;
  late AlarmBloc alarms;
  late MockDetailsRepository repository;
  late AlarmDetailsBloc details;

  setUpAll(() => registerFallbackValue(alarmId));

  setUp(() {
    communication = CommunicationService(EventBus());
    listLoads = 0;
    final queryController = AlarmQueryController();
    alarms = AlarmBloc(
      paginationRepository: AlarmsPaginationRepository(
        queryController: queryController,
        onFetchData: (_) async {
          listLoads++;
          return PageData<AlarmInfo>([], 0, 0, false);
        },
      ),
      fetchAlarmsUseCase: MockFetchAlarms(),
      queryController: queryController,
      communicationService: communication,
    );

    final fetchAlarm = MockFetchAlarm();
    when(() => fetchAlarm(any())).thenAnswer((_) async => null);
    repository = MockDetailsRepository();
    details = AlarmDetailsBloc(
      fetchAlarmUseCase: fetchAlarm,
      acknowledgeAlarmUseCase: AcknowledgeAlarmUseCase(repository),
      clearAlarmUseCase: ClearAlarmUseCase(repository),
      communicationService: communication,
    );
    addTearDown(() async {
      await details.close();
      await alarms.close();
    });
  });

  // The list stayed at "Active Unacknowledged" after acknowledging and
  // clearing the alarm in its details.
  test('acknowledging in the details reloads the alarms list', () async {
    when(() => repository.acknowledgeAlarm(any()))
        .thenAnswer((_) async => FakeAlarmInfo());

    details.add(AcknowledgeAlarmEvent(alarmId));
    await pumpEventQueue();

    expect(listLoads, 1);
  });

  test('clearing in the details reloads the alarms list', () async {
    when(() => repository.clearAlarm(any()))
        .thenAnswer((_) async => FakeAlarmInfo());

    details.add(ClearAlarmEvent(alarmId));
    await pumpEventQueue();

    expect(listLoads, 1);
  });

  test('a failed action leaves the list alone', () async {
    when(() => repository.clearAlarm(any())).thenThrow(Exception('offline'));

    // The failure reaches the bloc's error handling, as in the app; a bloc
    // reports it in the zone it was created in.
    await runZonedGuarded(() async {
      final failing = AlarmDetailsBloc(
        fetchAlarmUseCase: MockFetchAlarm(),
        acknowledgeAlarmUseCase: AcknowledgeAlarmUseCase(repository),
        clearAlarmUseCase: ClearAlarmUseCase(repository),
        communicationService: communication,
      );
      failing.add(ClearAlarmEvent(alarmId));
      await pumpEventQueue();
      await failing.close();
    }, (_, _) {});

    expect(listLoads, 0);
  });

  test('a closed list stops listening', () async {
    await alarms.close();
    when(() => repository.acknowledgeAlarm(any()))
        .thenAnswer((_) async => FakeAlarmInfo());

    details.add(AcknowledgeAlarmEvent(alarmId));
    await pumpEventQueue();

    expect(listLoads, 0);
  });
}
