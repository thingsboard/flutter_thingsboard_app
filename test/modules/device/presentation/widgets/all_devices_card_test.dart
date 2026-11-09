// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/device/presentation/widgets/device_profiles_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockEntityQueryApi extends Mock implements EntityQueryControllerApi {}

void main() {
  late MockEntityQueryApi entityQuery;

  setUpAll(() => registerFallbackValue(EntityCountQuery()));

  setUp(() {
    final client = MockThingsboardClient();
    entityQuery = MockEntityQueryApi();
    when(() => client.getEntityQueryControllerApi()).thenReturn(entityQuery);
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
  });

  void countsAnswer(Future<Response<int>> Function() answer) => when(
    () => entityQuery.countEntitiesByQuery(
      entityCountQuery: any(named: 'entityCountQuery'),
    ),
  ).thenAnswer((_) => answer());

  Future<Response<int>> count(int value) async =>
      Response(data: value, requestOptions: RequestOptions());

  Future<RefreshDeviceCounts> pumpCard(
    WidgetTester tester, {
    double textScale = 1,
  }) async {
    final refresh = RefreshDeviceCounts();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        home: MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
          child: Scaffold(
            body: SizedBox(width: 360, child: AllDevicesCard(refresh)),
          ),
        ),
      ),
    );
    await tester.pump();
    return refresh;
  }

  testWidgets('a failed count stops the spinners and counts again on refresh', (
    tester,
  ) async {
    countsAnswer(
      () => Future.error(
        DioException.connectionError(
          requestOptions: RequestOptions(),
          reason: 'offline',
        ),
      ),
    );
    final refresh = await pumpCard(tester);

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('–'), findsNWidgets(2));

    countsAnswer(() => count(7));
    await refresh.onRefresh!();
    await tester.pump();

    expect(find.text('7'), findsNWidgets(2));
  });

  // Android's largest font size: a clipped count is a layout overflow.
  testWidgets('the counts grow with the text instead of being clipped', (
    tester,
  ) async {
    countsAnswer(() => count(12));
    await pumpCard(tester, textScale: 2);

    expect(tester.takeException(), isNull);
    // A fixed-height cell clips the text without a layout error: each
    // count must get the full height its text needs.
    for (final count in find.text('12').evaluate()) {
      final text = tester.renderObject<RenderParagraph>(
        find.byWidget(count.widget),
      );
      expect(
        text.size.height,
        greaterThanOrEqualTo(text.getMinIntrinsicHeight(text.size.width)),
      );
    }
  });
}
