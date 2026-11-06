// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/modules/profile/presentation/view/change_password_page.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

class MockOverlayService extends Mock implements IOverlayService {}

/// TbAppBar reads the bottom bar pages; none are needed here.
class _NoPagesNavigation extends Navigation {
  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);
}

void main() {
  late MockOverlayService overlay;

  setUp(() {
    overlay = MockOverlayService();
    getIt.registerSingleton<IOverlayService>(overlay);
    addTearDown(getIt.reset);
  });

  Future<S> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [navigationProvider.overrideWith(_NoPagesNavigation.new)],
        child: MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (_, _) => const ChangePasswordPage()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return S.of(tester.element(find.byType(ChangePasswordPage)));
  }

  Future<void> submit(WidgetTester tester, S s) async {
    await tester.tap(find.widgetWithText(ElevatedButton, s.changePassword));
    await tester.pumpAndSettle();
  }

  testWidgets('an empty form shows the required messages', (tester) async {
    final s = await pumpPage(tester);

    await submit(tester, s);

    expect(find.text(s.currentPasswordRequireText), findsOneWidget);
    expect(find.text(s.newPasswordRequireText), findsOneWidget);
    expect(find.text(s.newPassword2RequireText), findsOneWidget);
  });

  testWidgets('different new passwords are reported', (tester) async {
    final s = await pumpPage(tester);
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'old');
    await tester.enterText(fields.at(1), 'new-1');
    await tester.enterText(fields.at(2), 'new-2');

    await submit(tester, s);

    verify(() => overlay.showErrorNotification(any())).called(1);
    expect(find.text(s.newPasswordRequireText), findsNothing);
  });
}
