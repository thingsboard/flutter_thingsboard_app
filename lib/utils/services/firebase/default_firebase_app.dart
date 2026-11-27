// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/logger/tb_logger.dart';
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
    getIt<TbLogger>().debug('Firebase is not configured in this build: $e');
  }
}

/// Gives the app the Firebase app that belongs to the server it points at:
/// the default one on a built-in server, none on a custom one.
///
/// With [removeExisting] the current apps are deleted first, as after a switch
/// to another server. Without it nothing is removed and an app that is already
/// there is kept, so a server the build counts as custom keeps the app it has.
Future<void> syncFirebaseAppWithEndpoint({
  required bool removeExisting,
  Future<void> Function() init = initDefaultFirebaseApp,
}) async {
  final firebase = getIt<IFirebaseService>();
  if (removeExisting) {
    await firebase.clearApps();
  } else if (firebase.apps.isNotEmpty) {
    return;
  }
  if (await getIt<IEndpointService>().isCustomEndpoint()) return;
  await init();
}
