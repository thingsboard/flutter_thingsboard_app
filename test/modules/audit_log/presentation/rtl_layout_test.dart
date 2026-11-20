// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/audit_log/presentation/view/audit_log_details_page.dart';
import 'package:thingsboard_app/modules/audit_log/presentation/widgets/audit_logs_base.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

class MockLoadingService extends Mock implements ILoadingService {}

class MockOverlayService extends Mock implements IOverlayService {}

final auditLog = AuditLog(
  (b) => b
    ..entityName = 'Weather Station'
    ..userName = 'tenant@thingsboard.org'
    ..actionType = ActionType.UPDATED
    ..actionStatus = ActionStatus.SUCCESS
    ..actionData = JsonObject({
      'entity': {'name': 'Weather Station'},
    })
    ..createdTime = 1700000000000,
);

Future<void> pumpArabic(WidgetTester tester, Widget child) => tester.pumpWidget(
  ProviderScope(
    overrides: [navigationProvider.overrideWith(_NoPagesNavigation.new)],
    child: MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => Scaffold(body: child),
          ),
        ],
      ),
      locale: const Locale('ar'),
      supportedLocales: S.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  ),
);

void main() {
  setUp(() {
    final loading = MockLoadingService();
    when(() => loading.isLoading).thenReturn(ValueNotifier(false));
    getIt
      ..registerSingleton<ILoadingService>(loading)
      ..registerSingleton<IOverlayService>(MockOverlayService());

    addTearDown(getIt.reset);
  });

  testWidgets('the status bar of a card is on the start (right) side', (
    tester,
  ) async {
    await pumpArabic(tester, AuditLogCard(auditLog: auditLog));

    final card = tester.getRect(find.byType(AuditLogCard));
    final bar = tester.getRect(
      find.byWidgetPredicate(
        (w) => w is Container && w.constraints?.maxWidth == 4,
      ),
    );
    expect(bar.right, card.right);
  });

  testWidgets('a Latin entity name keeps its direction in Arabic', (
    tester,
  ) async {
    await pumpArabic(tester, AuditLogCard(auditLog: auditLog));

    final name = tester.renderObject<RenderParagraph>(
      find.text('Weather Station'),
    );
    // Laid out right to left, the ellipsis would cut the start of the name.
    expect(name.textDirection, TextDirection.ltr);
  });

  testWidgets('action data JSON reads left to right in Arabic', (tester) async {
    await pumpArabic(tester, AuditLogDetailsPage(auditLog));

    final json = tester.renderObject<RenderParagraph>(
      find.textContaining('"entity"'),
    );
    expect(json.textDirection, TextDirection.ltr);
  });
}
