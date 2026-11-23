// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/firebase_options.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';

/// The Firebase app of the build's own server, which push notifications use.
/// A build without Firebase configured has none, and that is not an error.
Future<void> initDefaultFirebaseApp() async {
  try {
    await getIt<IFirebaseService>().initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e is! UnsupportedError) rethrow;
  }
}

/// Re-creates the default Firebase app when the app points at a built-in
/// server and has none, as after a switch from a custom one. Unlike
/// `pointAppAt`, it removes nothing, so a server the build counts as custom
/// keeps the app it has.
Future<void> restoreDefaultFirebaseApp({
  Future<void> Function() init = initDefaultFirebaseApp,
}) async {
  if (getIt<IFirebaseService>().apps.isNotEmpty ||
      await getIt<IEndpointService>().isCustomEndpoint()) {
    return;
  }
  await init();
}
