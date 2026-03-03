import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:thingsboard_app/modules/main/model/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/model/navigation_state.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:get_it/get_it.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockLoadingService extends Mock implements ILoadingService {
  @override
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Wraps [widget] in the minimal scaffold required by [TbAppBar]:
/// a [ProviderScope] that overrides [navigationProvider], a [GoRouter],
/// and registers a mock [ILoadingService] with GetIt.
Widget _buildTestApp({
  required Widget widget,
  List<NavigationItemData> bottomBarPages = const [],
}) {
  final mockLoadingService = _MockLoadingService();

  // Register mock with GetIt — reset first to avoid duplicate registration.
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<ILoadingService>()) {
    getIt.registerSingleton<ILoadingService>(mockLoadingService);
  }

  final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (_, __) => Scaffold(body: widget))],
  );

  return ProviderScope(
    overrides: [
      navigationProvider.overrideWith(
        () => _FakeNavigation(
          NavigationState(bottomBarPages: bottomBarPages, morePages: const []),
        ),
      ),
    ],
    child: MaterialApp.router(routerConfig: router),
  );
}

/// A minimal [Navigation] notifier that just returns a fixed [NavigationState].
class _FakeNavigation extends Navigation {
  _FakeNavigation(this._state);
  final NavigationState _state;

  @override
  NavigationState build() => _state;
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  tearDown(() {
    // Clean up GetIt between tests.
    GetIt.instance.reset();
  });


  group('buildTitle wraps only first Text in a Column', () {
    testWidgets(
      'Column title: first Text is wrapped in AutoSizeText, rest unchanged',
      (tester) async {
        const titleColumn = Column(
          children: [Text('Main Title'), Text('Subtitle')],
        );

        await tester.pumpWidget(
          _buildTestApp(widget: TbAppBar(title: titleColumn)),
        );
        await tester.pumpAndSettle();

        // The first Text ('Main Title') must be inside an AutoSizeText (the
        // tooltip wrapper).  The second Text ('Subtitle') must remain a plain
        // Text widget NOT inside an AutoSizeText.
        final autoSizeWidgets = tester.widgetList<AutoSizeText>(
          find.byType(AutoSizeText),
        );
        expect(
          autoSizeWidgets.any((w) => w.data == 'Main Title'),
          isTrue,
          reason: 'First Text in Column must be wrapped in AutoSizeText',
        );

        // 'Subtitle' should NOT be wrapped in AutoSizeText.
        final subtitleAutoSize = tester.widgetList<AutoSizeText>(
          find.byType(AutoSizeText),
        );
        expect(
          subtitleAutoSize.any((w) => w.data == 'Subtitle'),
          isFalse,
          reason: 'Second Text in Column must NOT be wrapped in AutoSizeText',
        );
      },
    );

    testWidgets(
      'Column title: only one info icon exists (single shared controller)',
      (tester) async {
        // Shrink the screen to trigger the AutoSizeText overflow replacement.
        tester.view.physicalSize = const Size(200, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        const titleColumn = Column(
          children: [
            Text('A very long title that will definitely overflow the bar'),
            Text('Subtitle'),
          ],
        );

        await tester.pumpWidget(
          _buildTestApp(widget: TbAppBar(title: titleColumn)),
        );
        await tester.pumpAndSettle();

        // There should never be more than one info_outline icon,
        // confirming the second Text is never wrapped.
        final infoIcons = tester.widgetList(find.byIcon(Icons.info_outline));
        expect(
          infoIcons.length,
          lessThanOrEqualTo(1),
          reason:
              'Only the first Text should have a tooltip trigger; '
              'second Text must not be wrapped',
        );
      },
    );
  });

  group('MediaQuery.paddingOf usage', () {
    testWidgets('TbAppBar renders without error when top padding is set', (
      tester,
    ) async {
      // Supply a non-zero top padding to ensure the code path that reads
      // MediaQuery.paddingOf(context).top is exercised.
      tester.view.padding = const FakeViewPadding(top: 44);
      tester.view.physicalSize = const Size(200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _buildTestApp(
          widget: TbAppBar(
            title: const Text(
              'A very long title that will definitely overflow',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // If MediaQueryData.fromView was still used (deprecated API), it
      // triggers a debug assertion in newer Flutter.  Reaching here without
      // an exception is the passing condition.
      expect(tester.takeException(), isNull);
    });
  });

  // -------------------------------------------------------------------------
  // Smoke: plain Text title
  // -------------------------------------------------------------------------
  group('Smoke tests', () {
    testWidgets('TbAppBar with plain Text title renders without error', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestApp(widget: TbAppBar(title: const Text('Hello'))),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('TbAppBar with no title renders without error', (tester) async {
      await tester.pumpWidget(_buildTestApp(widget: TbAppBar()));
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
