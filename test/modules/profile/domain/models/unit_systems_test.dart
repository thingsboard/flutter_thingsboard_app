// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/profile/domain/models/unit_systems.dart';

void main() {
  group('UnitSystems.tbValue', () {
    test('is the upper-case web UI value for an explicit system', () {
      expect(UnitSystems.metric.tbValue, 'METRIC');
      expect(UnitSystems.imperial.tbValue, 'IMPERIAL');
      expect(UnitSystems.hybrid.tbValue, 'HYBRID');
    });

    test('is null for auto, which the web UI stores as no value', () {
      expect(UnitSystems.auto.tbValue, isNull);
    });
  });

  group('UnitSystems.fromString', () {
    test('reads no value and the legacy AUTO as auto', () {
      expect(UnitSystems.fromString(null), UnitSystems.auto);
      expect(UnitSystems.fromString('AUTO'), UnitSystems.auto);
    });

    test('round-trips every system through tbValue', () {
      for (final system in UnitSystems.values) {
        expect(UnitSystems.fromString(system.tbValue), system);
      }
    });
  });
}
