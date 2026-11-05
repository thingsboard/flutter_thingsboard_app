// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/di/alarms_di.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/bloc.dart';

import '../../../helpers/test_dependencies.dart';

void main() {
  setUp(() {
    getIt.registerSingleton<TbLogger>(MockTbLogger());
    addTearDown(getIt.reset);
  });

  test('the alarms page scopes open and close', () async {
    AlarmsDi.init(
      'alarms',
      tbClient: MockThingsboardClient(),
      typesScopeName: 'types',
      assigneeScopeName: 'assignee',
    );

    expect(getIt.hasScope('alarms'), isTrue);
    expect(getIt.hasScope('types'), isTrue);
    expect(getIt.hasScope('assignee'), isTrue);
    expect(getIt<AlarmBloc>(), isA<AlarmBloc>());

    AlarmsDi.dispose(
      'alarms',
      typesScopeName: 'types',
      assigneeScopeName: 'assignee',
    );
    // dropScope completes asynchronously.
    await pumpEventQueue();

    expect(getIt.hasScope('alarms'), isFalse);
    expect(getIt.hasScope('types'), isFalse);
    expect(getIt.hasScope('assignee'), isFalse);
  });
}
