// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/usecases/user_details_usecase.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/activity/user_comment_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

void main() {
  setUp(() {
    getIt.registerSingleton(const UserDetailsUseCase());
    addTearDown(getIt.reset);
  });

  testWidgets('a long comment and a long name stay on the screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final text = List.filled(12, 'Very long comment').join(' ');
    final comment = AlarmCommentInfo(
      (b) => b
        ..userId = (UserIdBuilder()..id = 'author')
        ..firstName = 'Maximilian-Alexander'
        ..lastName = 'Vandenberghe-Oppenheimer'
        ..email = 'author@example.com'
        ..createdTime = 0
        ..comment = JsonObject({'text': text}),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: UserCommentWidget(
            comment,
            userId: UserId((b) => b..id = 'someone-else'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final commentText = tester.getRect(find.text(text));
    expect(commentText.right, lessThanOrEqualTo(400));
    // Wrapped onto several lines rather than cut off.
    expect(commentText.height, greaterThan(40));
  });
}
