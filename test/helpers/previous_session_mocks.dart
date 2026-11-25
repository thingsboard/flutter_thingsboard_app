// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/utils/services/web_view_data/i_web_view_data_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockAuthApi extends Mock implements AuthControllerApi {}

class MockUserApi extends Mock implements UserControllerApi {}

class MockNotificationService extends Mock implements NotificationService {}

class MockWebViewDataService extends Mock implements IWebViewDataService {}

/// What ending the session of [client] on its server goes through: its
/// logout and push-session calls, the device's push token and web data.
class PreviousSessionMocks {
  PreviousSessionMocks(ThingsboardClient client) {
    when(client.close).thenAnswer((_) async {});
    when(client.getAuthControllerApi).thenReturn(auth);
    when(client.getUserControllerApi).thenReturn(users);
    when(() => auth.logout(extra: any(named: 'extra')))
        .thenAnswer((_) async => Response(requestOptions: RequestOptions()));
    when(
      () => users.removeMobileSession(
        xMobileToken: any(named: 'xMobileToken'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) async => Response(requestOptions: RequestOptions()));
    when(() => notifications.mobileToken).thenReturn(pushToken);
    when(webData.clear).thenAnswer((_) async {});
    getIt
      ..registerSingleton<NotificationService>(notifications)
      ..registerSingleton<IWebViewDataService>(webData);
  }

  static const pushToken = 'device-push-token';

  final auth = MockAuthApi();
  final users = MockUserApi();
  final notifications = MockNotificationService();
  final webData = MockWebViewDataService();
}
