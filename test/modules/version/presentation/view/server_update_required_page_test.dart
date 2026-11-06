// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/version/presentation/view/server_update_required_page.dart';

void main() {
  test('shows the release, not the build', () {
    expect(displayVersion('4.2.2.8PE-SNAPSHOT.321c31571da'), '4.2.2.8');
    expect(displayVersion('4.3.1'), '4.3.1');
    expect(displayVersion('4.4.0'), '4.4');
    expect(displayVersion('4.0'), '4');
    expect(displayVersion('unknown'), 'unknown');
  });
}
