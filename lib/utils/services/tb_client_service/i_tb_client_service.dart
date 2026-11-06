// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class ITbClientService {
  Future<void> init();
  ThingsboardClient get client;
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  });

  /// The server is older than the client supports; the router shows the
  /// server update page while this is set.
  ValueListenable<UnsupportedServerVersionError?> get unsupportedServer;

  /// Records [error] when it is an [UnsupportedServerVersionError]: the
  /// caller's flow ends there, the server update page explains it. Returns
  /// whether it was one.
  bool reportUnsupportedServer(Object error);

  /// Leaves the server update page (back to the login page).
  void clearUnsupportedServer();
}
