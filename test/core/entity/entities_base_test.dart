// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/entity/contact_info.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/customer/presentation/widgets/customers_list.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../helpers/test_dependencies.dart';

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

  testWidgets('a contact card shows at most two lines per field', (
    tester,
  ) async {
    final long = List.filled(30, 'long contact text').join(' ');
    final customer = Customer(
      (b) => b
        ..title = 'Acme'
        ..createdTime = 0
        ..email = '$long@example.com'
        ..address = long,
    );
    final tbClientService = MockTbClientService();
    when(() => tbClientService.client).thenReturn(MockThingsboardClient());
    getIt.registerSingleton<ITbClientService>(tbClientService);
    final list = CustomersList(PageLinkController());
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => list.buildEntityListCard(context, customer),
          ),
        ),
      ),
    );

    for (final text in [
      customer.email!,
      ContactInfo.of(customer)!.shortAddress!,
    ]) {
      final widget = tester.widget<Text>(find.text(text));
      expect(widget.maxLines, 2, reason: text);
      expect(widget.overflow, TextOverflow.ellipsis, reason: text);
    }
  });

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
      // In the middle of the list area (give or take the list's own
      // padding), not under the header.
      final message = tester
          .getRect(find.text('No devices'))
          .expandToInclude(
            tester.getRect(find.text('The list is currently empty.')),
          );
      final list = tester.getRect(find.byType(Scrollable).first);
      expect(message.center.dy, moreOrLessEquals(list.center.dy, epsilon: 16));

      server.devices = ['Thermostat'];
      await tester.fling(find.text('No devices'), const Offset(0, 400), 1000);
      await tester.pumpAndSettle();

      expect(find.text('Thermostat'), findsOneWidget);
    });
  }
}
