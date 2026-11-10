// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/modules/notification/presentation/view/notification_page.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

class MockNotificationApi extends Mock implements NotificationControllerApi {}

class MockNotificationService extends Mock implements NotificationService {}

class MockOverlayService extends Mock implements IOverlayService {}

class MockAuthUser extends Mock implements AuthUser {}

class MockTbStorage extends Mock implements TbStorage {}

Response<T> _ok<T>(T? data) =>
    Response(data: data, requestOptions: RequestOptions());

void main() {
  late MockNotificationApi api;
  late MockNotificationService notifications;

  setUp(() {
    api = MockNotificationApi();
    notifications = MockNotificationService();
    final client = MockThingsboardClient();
    final user = MockAuthUser();
    when(() => user.authority).thenReturn(Authority.TENANT_ADMIN);
    when(client.getAuthUser).thenReturn(user);
    when(client.getNotificationControllerApi).thenReturn(api);
    final clientService = MockTbClientService();
    when(() => clientService.client).thenReturn(client);
    final firebase = MockFirebaseService();
    when(() => firebase.apps).thenReturn([]);

    when(
      () => api.getNotifications(
        pageSize: any(named: 'pageSize'),
        page: any(named: 'page'),
        textSearch: any(named: 'textSearch'),
        sortProperty: any(named: 'sortProperty'),
        sortOrder: any(named: 'sortOrder'),
        unreadOnly: any(named: 'unreadOnly'),
        deliveryMethod: any(named: 'deliveryMethod'),
      ),
    ).thenAnswer(
      (_) async => _ok(
        PageDataNotification(
          (b) => b
            ..data = ListBuilder([
              Notification(
                (n) => n
                  ..id.id = 'n1'
                  ..createdTime = DateTime.now().millisecondsSinceEpoch
                  ..type = NotificationType.GENERAL
                  ..subject = 'Pump stopped'
                  ..text = 'Check the pump'
                  ..status = NotificationStatus.SENT,
              ),
            ])
            ..totalPages = 1
            ..totalElements = 1
            ..hasNext = false,
        ),
      ),
    );
    when(() => api.markNotificationAsRead(id: any(named: 'id')))
        .thenAnswer((_) async => _ok<void>(null));
    when(notifications.updateNotificationsCount).thenAnswer((_) async {});

    getIt
      ..registerSingleton<ITbClientService>(clientService)
      ..registerSingleton<IFirebaseService>(firebase)
      ..registerSingleton<IOverlayService>(MockOverlayService())
      ..registerSingleton<NotificationService>(notifications)
      ..registerSingleton<TbStorage>(MockTbStorage());
    addTearDown(getIt.reset);
  });

  Future<void> openPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [navigationProvider.overrideWith(_NoPagesNavigation.new)],
        child: MaterialApp.router(
          localizationsDelegates: const [S.delegate],
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (_, _) => const NotificationPage()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('reading a notification takes the badge count from the server', (
    tester,
  ) async {
    await openPage(tester);
    expect(find.text('Pump stopped'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.check_circle_outline));
    await tester.pumpAndSettle();

    verify(() => api.markNotificationAsRead(id: 'n1')).called(1);
    verify(notifications.updateNotificationsCount).called(1);
  });

  testWidgets('pulling the list to refresh also refreshes the badge', (
    tester,
  ) async {
    await openPage(tester);

    await tester.fling(find.text('Pump stopped'), const Offset(0, 400), 1000);
    await tester.pumpAndSettle();

    verify(notifications.updateNotificationsCount).called(1);
  });
}
