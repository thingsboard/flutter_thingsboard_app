// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/thingsboard_client_extensions.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

AlarmInfo _alarm(JsonObject? details) => AlarmInfo(
  (b) => b
    ..type = 'High temperature'
    ..name = 'High temperature'
    ..originator = DeviceId((i) => i..id = 'd1')
    ..severity = AlarmSeverity.CRITICAL
    ..acknowledged = false
    ..cleared = false
    ..status = AlarmStatus.ACTIVE_UNACK
    ..details = details,
);

AlarmCommentInfo _comment(JsonObject? comment) =>
    AlarmCommentInfo((b) => b..comment = comment);

void main() {
  group('AlarmInfo.detailsDashboardId', () {
    test('reads dashboardId from the details object', () {
      final alarm = _alarm(JsonObject({'dashboardId': 'db1', 'other': 1}));
      expect(alarm.detailsDashboardId, 'db1');
    });

    test('is null without details or without a dashboardId', () {
      expect(_alarm(null).detailsDashboardId, isNull);
      expect(_alarm(JsonObject({'other': 1})).detailsDashboardId, isNull);
      expect(_alarm(JsonObject('text')).detailsDashboardId, isNull);
    });
  });

  group('AlarmCommentInfo comment fields', () {
    test('reads text and edited from a comment object', () {
      final comment = _comment(JsonObject({'text': 'hi', 'edited': 'true'}));
      expect(comment.commentText, 'hi');
      expect(comment.commentEdited, isTrue);
    });

    test('a plain string comment is its own text', () {
      final comment = _comment(JsonObject('plain'));
      expect(comment.commentText, 'plain');
      expect(comment.commentEdited, isFalse);
    });

    test('no comment has no text', () {
      expect(_comment(null).commentText, isNull);
      expect(_comment(null).commentEdited, isFalse);
    });
  });
}
