// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class MockOverlayService extends Mock implements IOverlayService {}

class MockTranslations extends Mock implements ICustomTranslationService {}

/// Fails the first page while [online] is false, like the app offline.
class Server {
  bool online = false;
  List<String> devices = ['Thermostat', 'Pump'];
  int headingRefreshes = 0;

  Future<PageData<String>> fetch() async {
    if (!online) {
      throw DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: 'offline',
      );
    }
    return PageData(devices, 1, devices.length, false);
  }
}

mixin _TestEntities on BaseEntitiesWidget<String, PageLink> {
  Server get server;

  @override
  String title(BuildContext context) => 'Devices';

  @override
  String noItemsFoundText(BuildContext context) => 'No devices';

  @override
  Future<PageData<String>> fetchEntities(
    PageLink pageKey, {
    bool refresh = false,
  }) => server.fetch();

  @override
  Future<void> onRefresh() async => server.headingRefreshes++;

  @override
  Widget buildEntityListCard(BuildContext context, String entity) =>
      Text(entity);

  @override
  Widget buildEntityGridCard(BuildContext context, String entity) =>
      Text(entity);

  @override
  void onEntityTap(String entity, WidgetRef ref) {}
}

class TestList extends BaseEntitiesWidget<String, PageLink>
    with _TestEntities, EntitiesListStateBase {
  TestList(this.server) : super(PageLinkController());
  @override
  final Server server;
}

class TestGrid extends BaseEntitiesWidget<String, PageLink>
    with _TestEntities, EntitiesGridStateBase {
  TestGrid(this.server) : super(PageLinkController());
  @override
  final Server server;
}

void main() {
  setUp(() {
    final overlay = MockOverlayService();
    final translations = MockTranslations();
    when(() => translations.translate(any()))
        .thenAnswer((call) => call.positionalArguments.first as String? ?? '');
    getIt
      ..registerSingleton<IOverlayService>(overlay)
      ..registerSingleton<ICustomTranslationService>(translations);
    addTearDown(getIt.reset);
  });

  Future<void> pump(WidgetTester tester, Widget list) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: const [S.delegate],
          home: Scaffold(body: list),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  for (final variant in [('list', TestList.new), ('grid', TestGrid.new)]) {
    testWidgets('${variant.$1}: a failed first page offers to try again', (
      tester,
    ) async {
      final server = Server();
      await pump(tester, variant.$2(server));

      expect(find.text('Something Went Wrong'), findsOneWidget);
      expect(find.textContaining('error'), findsNothing);

      server.online = true;
      await tester.tap(find.text('Try again'));
      await tester.pump();
      await tester.pump();

      expect(find.text('Thermostat'), findsOneWidget);
      // "Try again" reloads the heading (device counts) too.
      expect(server.headingRefreshes, 1);
    });

    testWidgets('${variant.$1}: an empty page is not shown as a failure', (
      tester,
    ) async {
      final server = Server()
        ..online = true
        ..devices = [];
      await pump(tester, variant.$2(server));

      expect(find.text('No devices'), findsOneWidget);
      expect(find.text('Try again'), findsNothing);

      server.devices = ['Thermostat'];
      await tester.fling(find.text('No devices'), const Offset(0, 400), 1000);
      await tester.pumpAndSettle();

      expect(find.text('Thermostat'), findsOneWidget);
    });
  }
}
