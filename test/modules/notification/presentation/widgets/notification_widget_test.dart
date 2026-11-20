// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';
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

  group('notification text', () {
    // A 1x1 GIF carried in the text itself.
    const inlineImage =
        'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==';

    Future<List<ImageProvider>> shownImages(
      WidgetTester tester,
      String text,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          home: Scaffold(
            body: NotificationWidget(
              notification: Notification(
                (b) => b
                  ..subject = 'Subject'
                  ..text = text
                  ..createdTime = DateTime.now().millisecondsSinceEpoch,
              ),
              onReadNotification: (_) {},
            ),
          ),
        ),
      );
      await tester.pump();
      return tester
          .widgetList<Image>(find.byType(Image))
          .map((image) => image.image)
          .toList();
    }

    testWidgets('does not load an image from another host', (tester) async {
      final images = await shownImages(
        tester,
        '<p>Alarm<img src="https://tracker.example/pixel.png"></p>',
      );

      expect(images.whereType<NetworkImage>(), isEmpty);
      expect(find.textContaining('Alarm', findRichText: true), findsOneWidget);
    });

    testWidgets('shows an image carried in the text', (tester) async {
      final images = await shownImages(
        tester,
        '<p>Alarm<img src="$inlineImage"></p>',
      );

      expect(images, isNotEmpty);
    });
  });
}
