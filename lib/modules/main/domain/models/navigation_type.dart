// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';

enum TbNavigationType {
  /// The default: tabs switch in place; Back closes the pages opened in a
  /// tab, then returns to the first tab, then leaves the app.
  tabs,

  /// Every tab tap is pushed: Back walks through the visited tabs.
  push,

  /// Home and URL tabs switch in place, the other tabs are pushed.
  mixed;

  /// Set at build time with `--dart-define=navigationType=tabs|push|mixed`.
  static final configured = TbNavigationType.fromString(
    const String.fromEnvironment('navigationType'),
  );

  static TbNavigationType fromString(String? input) {
    return TbNavigationType.values.firstWhereOrNull((e) => e.name == input) ??
        TbNavigationType.tabs;
  }

  /// Whether tapping the tab at [path] adds it to the history.
  bool pushesTab(String path) => switch (this) {
    TbNavigationType.tabs => false,
    TbNavigationType.push => true,
    TbNavigationType.mixed => !path.contains('/home') && !path.contains('/url'),
  };
}
