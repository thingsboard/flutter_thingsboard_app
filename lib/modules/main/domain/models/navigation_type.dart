// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';

enum TbNavigationType {
  push,
  mixed;

  /// Set at build time with `--dart-define=navigationType=push|mixed`.
  static final configured = TbNavigationType.fromString(
    const String.fromEnvironment('navigationType'),
  );

  static TbNavigationType fromString(String? input) {
    return TbNavigationType.values.firstWhereOrNull((e) => e.name == input) ??
        TbNavigationType.push;
  }
}
