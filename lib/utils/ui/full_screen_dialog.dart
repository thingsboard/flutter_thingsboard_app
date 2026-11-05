// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Pushes [dialog] as a full-screen dialog route and returns its result.
Future<T?> showFullScreenDialog<T>(Widget dialog, BuildContext context) {
  return Navigator.of(context).push<T>(
    MaterialPageRoute<T>(builder: (_) => dialog, fullscreenDialog: true),
  );
}
