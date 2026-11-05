// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class ITbClientService {
  Future<void> init();
  ThingsboardClient get client;
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  });
}
