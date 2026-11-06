// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';

enum UnitSystems {
  metric,
  imperial,
  auto,
  hybrid;

  static UnitSystems fromString(String? code) {
    if (code == null) {
      return UnitSystems.auto;
    }
    return UnitSystems.values.firstWhereOrNull(
          (e) => e.name == code.toLowerCase(),
        ) ??
        UnitSystems.auto;
  }

  String getLocalizedName(BuildContext context) {
    return switch (this) {
      UnitSystems.auto => S.of(context).autoUnitSystem,
      UnitSystems.metric => S.of(context).metricUnitSystem,
      UnitSystems.imperial => S.of(context).imperialUnitSystem,
      UnitSystems.hybrid => S.of(context).hybridUnitSystem,
    };
  }
}
