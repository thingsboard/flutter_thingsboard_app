// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';

class TbLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (EnvironmentVariables.verbose) {
      return true;
    } else if (kReleaseMode) {
      return event.level.index >= Level.warning.index;
    } else {
      return true;
    }
  }
}
