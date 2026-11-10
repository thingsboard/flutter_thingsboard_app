// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/profile/presentation/widgets/profile_preview_widget.dart';

void main() {
  const shown = Locale('fr');

  group('profileLanguage', () {
    test('is Auto without a language, as the web UI shows it', () {
      expect(profileLanguage(null, shown), autoLanguage);
      expect(profileLanguage('', shown), autoLanguage);
    });

    test('is the selectable language for a ThingsBoard code', () {
      expect(profileLanguage('de_DE', shown), const Locale('de'));
      expect(profileLanguage('zh_TW', shown), const Locale('zh', 'TW'));
    });

    test('is the shown language for one the app does not translate', () {
      expect(profileLanguage('uk_UA', shown), shown);
    });
  });
}
