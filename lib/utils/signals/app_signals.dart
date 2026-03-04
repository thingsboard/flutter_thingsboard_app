/// lib/utils/signals/app_signals.dart
///
/// Central hub for ALL global [signals_flutter] signals.
///
/// This is the SINGLE place where app-wide reactive state is declared.
/// Any new signal needed in the future (auth state, theme, locale, etc.)
/// should be added here so the entire codebase has one import to reach them.
///
/// Usage (in any widget):
/// ```dart
/// import 'package:thingsboard_app/utils/signals/app_signals.dart';
///
/// // Reactive — rebuilds the widget whenever the value changes:
/// final size = screenSizeSignal.watch(context);
///
/// // One-shot read — does NOT subscribe the widget:
/// final bottom = viewInsetsSignal.value.bottom;
/// ```
library app_signals;

import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

// ---------------------------------------------------------------------------
// MediaQuery signals
// ---------------------------------------------------------------------------

/// The current logical screen size, kept in sync with
/// [MediaQuery.sizeOf]. Updated from the root widget on every build.
final Signal<Size> screenSizeSignal = signal(
  Size.zero,
  debugLabel: 'screenSize',
);

/// The current view insets (e.g. keyboard height), kept in sync with
/// [MediaQuery.viewInsetsOf]. Updated from the root widget on every build.
final Signal<EdgeInsets> viewInsetsSignal = signal(
  EdgeInsets.zero,
  debugLabel: 'viewInsets',
);

/// The shortest side of the screen, derived from [screenSizeSignal].
final ReadonlySignal<double> shortestSideSignal = computed(
  () => screenSizeSignal.value.shortestSide,
  debugLabel: 'shortestSide',
);

/// Whether the screen is considered a mobile device (shortest side < 600),
/// derived from [shortestSideSignal].
final ReadonlySignal<bool> isMobileSignal = computed(
  () => shortestSideSignal.value < 600,
  debugLabel: 'isMobile',
);

/// The current screen orientation, derived from [screenSizeSignal].
final ReadonlySignal<Orientation> orientationSignal = computed(
  () =>
      screenSizeSignal.value.width > screenSizeSignal.value.height
          ? Orientation.landscape
          : Orientation.portrait,
  debugLabel: 'orientation',
);

// ---------------------------------------------------------------------------
// Internal helper — called by the root widget only.
// ---------------------------------------------------------------------------

/// Pushes the latest [MediaQuery] values into the signals.
///
/// Compares old vs new values before writing so that unchanged values do
/// not trigger unnecessary signal graph traversals.
///
/// Only [ThingsboardApp] (the root widget) should call this function.
void updateMediaQuerySignals(Size newSize, EdgeInsets newInsets) {
  if (screenSizeSignal.value != newSize) {
    screenSizeSignal.value = newSize;
  }
  if (viewInsetsSignal.value != newInsets) {
    viewInsetsSignal.value = newInsets;
  }
}

// ---------------------------------------------------------------------------
// Future signals — add them below, grouped by feature area.
// ---------------------------------------------------------------------------
//
// Example:
//   /// Whether the sidebar drawer is open.
//   final Signal<bool> drawerOpenSignal = signal(false, debugLabel: 'drawerOpen');
