// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TbLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(line);
    }
  }
}
