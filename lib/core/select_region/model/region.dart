// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';

enum Region {
  northAmerica,
  europe,
  custom;

  static Region regionFromString(String input) {
    return Region.values.firstWhere((e) => e.name == input);
  }
}

extension RegionToString on Region {
  String regionToString(BuildContext context) {
    switch (this) {
      case Region.northAmerica:
        return S.of(context).northAmerica;

      case Region.europe:
        return S.of(context).europe;
      case Region.custom:
        return 'Regions';
    }
  }
}
