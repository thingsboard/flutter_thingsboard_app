// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/customer/presentation/view/customer_details_page.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../../../helpers/test_dependencies.dart';

class MockCustomerApi extends Mock implements CustomerControllerApi {}

class MockTranslations extends Mock implements ICustomTranslationService {}

class MockLoadingService extends Mock implements ILoadingService {}

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

const _arabic = Locale('ar');

void main() {
  late Completer<Response<Customer>> response;

  setUp(() {
    final client = MockThingsboardClient();
    registerTestDependencies(
      tbClient: client,
      localDatabase: MockLocalDatabaseService(),
      firebaseService: MockFirebaseService(),
    );
    final api = MockCustomerApi();
    when(client.getCustomerControllerApi).thenReturn(api);
    when(
      () => api.getCustomerById(
        customerId: any(named: 'customerId'),
        extra: any(named: 'extra'),
      ),
    ).thenAnswer((_) => response.future);

    final translations = MockTranslations();
    when(() => translations.translate(any()))
        .thenAnswer((i) => i.positionalArguments.first as String);
    final loading = MockLoadingService();
    when(() => loading.isLoading).thenReturn(ValueNotifier(false));
    getIt
      ..registerSingleton<ICustomTranslationService>(translations)
      ..registerSingleton<ILoadingService>(loading);
  });

  Future<void> pumpPage(WidgetTester tester) async {
    // Made inside the test so its future completes in the test's fake zone.
    response = Completer();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [navigationProvider.overrideWith(_NoPagesNavigation.new)],
        child: MaterialApp.router(
          locale: _arabic,
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (_, _) => CustomerDetailsPage('customer-id'),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('the titles follow the app language', (tester) async {
    final s = lookupS(_arabic);
    await pumpPage(tester);

    expect(find.text(s.customer), findsOneWidget);
    expect(find.text(s.customerDetails), findsOneWidget);

    response.complete(
      Response(
        requestOptions: RequestOptions(),
        data: Customer((b) => b..title = 'Acme'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Acme'), findsNWidgets(2));
    expect(find.text(s.customerDetails), findsOneWidget);
  });

  testWidgets('the phone number keeps its plus first in right to left', (
    tester,
  ) async {
    await pumpPage(tester);
    response.complete(
      Response(
        requestOptions: RequestOptions(),
        data: Customer(
          (b) => b
            ..title = 'Acme'
            ..phone = '+380501234567',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('\u2066+380501234567\u2069'), findsOneWidget);
  });

  // MOB-12: details that did not fit on the screen were cut off.
  testWidgets('long details scroll to the last field', (tester) async {
    tester.view.physicalSize = const Size(400, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await pumpPage(tester);
    response.complete(
      Response(
        requestOptions: RequestOptions(),
        data: Customer(
          (b) => b
            ..title = 'Acme'
            ..address = List.filled(40, 'Long address line').join('\n')
            ..email = 'last@example.com',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(find.text('last@example.com'), 200);
    expect(find.text('last@example.com').hitTestable(), findsOneWidget);
  });

  // In landscape the Dynamic Island covered the start of the labels.
  testWidgets('the details keep clear of a landscape display cutout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(874, 402);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(left: 62, right: 62);
    addTearDown(tester.view.reset);

    await pumpPage(tester);
    response.complete(
      Response(
        requestOptions: RequestOptions(),
        data: Customer((b) => b..title = 'Acme'),
      ),
    );
    await tester.pumpAndSettle();

    final label = find.text(lookupS(_arabic).country);
    expect(tester.getTopLeft(label).dx, greaterThanOrEqualTo(62));
    expect(tester.getTopRight(label).dx, lessThanOrEqualTo(874 - 62));
  });
}
