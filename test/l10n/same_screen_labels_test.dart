// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/generated/l10n.dart';

/// Strings shown side by side must not read the same in any language.
void main() {
  final pairs = <String, (String, String) Function(S)>{
    // Customer and tenant details: the name above the address fields.
    'title / address': (s) => (s.title, s.address),
    // Discard dialog: the confirm button next to Cancel.
    'cancel / yesDiscard': (s) => (s.cancel, s.yesDiscard),
    // Live tracking: Pause next to Stop.
    'liveTrackingPause / liveTrackingStop': (s) =>
        (s.liveTrackingPause, s.liveTrackingStop),
  };

  for (final MapEntry(key: name, value: pick) in pairs.entries) {
    test('$name differ in every language', () {
      for (final locale in S.supportedLocales) {
        final (a, b) = pick(lookupS(locale));
        expect(a, isNot(b), reason: '$locale');
      }
    });
  }
}
