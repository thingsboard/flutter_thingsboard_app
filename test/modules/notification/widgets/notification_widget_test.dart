// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/notification/presentation/widgets/notification_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

void main() {
  group('notificationAlarmSeverity', () {
    test('reads the severity of alarm, comment and assignment info', () {
      expect(
        notificationAlarmSeverity(
          AlarmNotificationInfo((b) => b..alarmSeverity = AlarmSeverity.MAJOR),
        ),
        AlarmSeverity.MAJOR,
      );
      expect(
        notificationAlarmSeverity(
          AlarmCommentNotificationInfo(
            (b) => b..alarmSeverity = AlarmSeverity.MINOR,
          ),
        ),
        AlarmSeverity.MINOR,
      );
      expect(
        notificationAlarmSeverity(
          AlarmAssignmentNotificationInfo(
            (b) => b..alarmSeverity = AlarmSeverity.WARNING,
          ),
        ),
        AlarmSeverity.WARNING,
      );
    });

    test('is null for other notifications', () {
      expect(notificationAlarmSeverity(null), isNull);
      expect(
        notificationAlarmSeverity(GeneralNotificationInfo((b) => b)),
        isNull,
      );
    });
  });
}
