// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract interface class ICustomTranslationService {
  Future<void> load({String? localeCode});

  /// Resolves `{i18n:key}` White Labeling markers in [value] for display.
  ///
  /// Returns `''` for a null or empty [value], the value untouched when it has
  /// no marker, and leaves a marker in place when its key has no translation.
  ///
  /// Display-only: apply at render time and keep raw values for anything the
  /// backend consumes (search text, alarm type filters, dashboard state).
  ///
  /// Unlike web's `UtilsService.customTranslation()`, a marker-free value is
  /// not looked up as `custom.<value>`, and a null input yields `''`.
  String translate(String? value);

  void clear();
}
